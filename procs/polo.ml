(*
  Polynomial interpretations

  @author Stephan Falke

  Copyright 2010-2014 Stephan Falke

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
*)

module VarMap = Poly.VarMap

let count = ref 1

type poly_map = string * Parapoly.parapoly

(* Find a polynomial interpretation *)
let rec process degree trs tgraph isScc =
  if trs = [] then
    None
  else
  (
    count := 1;
    let (abs, params) = create_poly_map degree trs in
      let (conds, polys, bounds) = create_conds_polys_bounds trs abs Big_int.zero_big_int in
        let polyst = List.map2 transform_poly polys conds
        and boundst = List.map2 transform_poly bounds conds in
          let polyconditions = get_absolute_positive polyst
          and boundconditions = get_absolute_positive boundst in
            let polystrict = getGtrForConstant polyconditions in
              match has_solution polyconditions polystrict boundconditions params with
                | None -> None
                | Some model ->
                  (
                    let model' = fix_model model params in
                      let (ntrs, junk) = get_new_trs trs polystrict boundconditions model' in
                        Some ([(ntrs, Termgraph.removeNodes tgraph junk, false)], fun i alli -> getProof i alli ntrs trs (get_concrete_poly abs model'))
                  )
  )

(* set up parametric polynomials *)
and create_poly_map degree trs =
  let funs = Utils.remdup (List.flatten (List.map (fun rule -> (Rule.getFuns rule)) trs)) in
    let abs = List.map (create_poly_map_one degree trs) funs in
      (abs, getParams abs)
and create_poly_map_one degree trs f =
  (f, getPoly degree (Trs.getArityOf f trs) f)
and getPoly degree arity f =
  let vars = List.map (fun i -> "X_" ^ (string_of_int i)) (Utils.getList 1 arity) in
    let num = List.length vars in
      let monos = getMonos degree vars num in
        let mononum = List.length monos in
          ((getPoly_nonconst monos f 1), getPoly_const f (mononum + 1))
and getMonos degree vars num =
  if degree = 0 then
    []
  else if degree = 1 then
    List.map (fun v -> [(v, 1)]) vars
  else
    let vecs = Utils.remdup (getVectors (expandAllOne (getBase num)) [] degree) in
      List.map (getMonoFromVector vars) vecs
and getBase num =
  if num = 0 then
    []
  else
    0::(getBase (num - 1))
and getVectors todo accu degree =
  if degree = 0 then
    accu
  else if degree = 1 then
    accu @ todo
  else
    getVectors (expandAll todo) (accu @ todo) (degree - 1)
and expandAll todo =
  List.flatten (List.map expandAllOne todo)
and expandAllOne vec =
  match vec with
    | [] -> []
    | i::[] -> [[i + 1]]
    | i::ii -> let tmp = expandAllOne ii in
                 [(i + 1)::ii] @ (List.map (fun l -> i::l) tmp)
and getMonoFromVector vars vec =
  List.filter (fun (v, i) -> i <> 0) (List.map2 (fun v i -> (v, i)) vars vec)
and getPoly_const f j =
  let name = getName f j in
    ([(Big_int.unit_big_int, [(name, 1)])], Big_int.zero_big_int)
and getPoly_nonconst monos f j =
  match monos with
    | [] -> []
    | m::mm -> (getPoly_mono f j m)::(getPoly_nonconst mm f (j + 1))
and getPoly_mono f j mono =
  let name = getName f j in
    (([(Big_int.unit_big_int, [(name, 1)])], Big_int.zero_big_int), mono)
and getName f j =
  f ^ "_" ^ (string_of_int j)
and getParams abs =
  (List.flatten (List.map getParamsOne abs))
and getParamsOne (_, (pp, c)) =
  (List.flatten (List.map getParamsMono pp)) @ (Poly.getVars c)
and getParamsMono (ppp, _) =
  Poly.getVars ppp

(* set up conditions, greater relations, and bounds *)
and create_conds_polys_bounds trs abs lowerbound =
   match trs with
    | [] -> ([], [], [])
    | r::rr -> let (c, p, b) = create_conds_polys_bounds rr abs lowerbound
               and (cn, pn, bn) = create_cond_poly_bound_one r abs lowerbound in
                 (cn::c, pn::p, bn::b)
and create_cond_poly_bound_one r abs lowerbound =
  let (lhs, rhs, cond) = (Rule.getLeft r, Rule.getRight r, Rule.getCond r) in
  let lpol = List.assoc (Term.getFun lhs) abs in
    let lpolinst = Parapoly.instantiate lpol (getInstBin (Term.getFun lhs) (Term.getArgs lhs) 1) in
      (
        cond,
        Parapoly.minus lpolinst (Parapoly.instantiate (List.assoc (Term.getFun rhs) abs) (getInstBin (Term.getFun rhs) (Term.getArgs rhs) 1)),
        Parapoly.add lpolinst ([], ([], Big_int.minus_big_int lowerbound))
      )
and getInstBin f args i =
  match args with
    | [] -> []
    | a::l -> let sub = getInstBin f l (i + 1) in
                ("X_" ^ (string_of_int i), getAsParaPoly a)::sub
and getAsParaPoly (poly, c) =
  (List.map getAsParaPolyAux poly, ([], c))
and getAsParaPolyAux (c, mon) =
  (([], c), mon)
and transform c =
   match c with
    | Pc.Equ (l, r) -> [ Poly.minus l r; Poly.minus r l ]
    | Pc.Neq (l, r) -> failwith "cannot do this!"
    | Pc.Geq (l, r) -> [ Poly.minus l r ]
    | Pc.Gtr (l, r) -> [ Poly.minus l (Poly.add r ([], Big_int.unit_big_int)) ]
    | Pc.Leq (l, r) -> [ Poly.minus r l ]
    | Pc.Lss (l, r) -> [ Poly.minus r (Poly.add l ([], Big_int.unit_big_int)) ]
and getStrongest c =
  let vars = Utils.remdup (List.flatten (List.map Poly.getVars c)) in
    let strongestOneVar = getStrongestLoop c vars in
      List.filter (fun cond -> (not (Poly.isUnivariateLinear cond)) || containsEqual strongestOneVar cond) c
and containsEqual list elem =
  List.exists (Poly.equal elem) list
and getStrongestLoop c vars =
  match vars with
    | [] -> []
    | x::xs -> (getBiggestLower c x) @ (getSmallestUpper c x) @ (getStrongestLoop c xs)
and getBiggestLower conds x =
  match conds with
    | [] -> []
    | ([(c, [(y, 1)])], a)::cc -> if (x = y) && (Poly.eq_big_int c Big_int.unit_big_int) then
                                    let tmp = getBiggestLower cc x in
                                      if tmp = [] then
                                        [([(c, [(y, 1)])], a)]
                                      else
                                        let (_, b) = List.hd tmp in
                                          if Big_int.lt_big_int a b then
                                            [([(c, [(y, 1)])], a)]
                                          else
                                            [([(c, [(y, 1)])], b)]
                                  else
                                    getBiggestLower cc x
    | _::cc -> getBiggestLower cc x
and getSmallestUpper conds x =
  match conds with
    | [] -> []
    | ([(c, [(y, 1)])], a)::cc -> if (x = y) && (Poly.eq_big_int c (Big_int.minus_big_int Big_int.unit_big_int)) then
                                    let tmp = getSmallestUpper cc x in
                                      if tmp = [] then
                                        [([(c, [(y, 1)])], a)]
                                      else
                                        let (_, b) = List.hd tmp in
                                          if Big_int.lt_big_int a b then
                                            [([(c, [(y, 1)])], a)]
                                          else
                                            [([(c, [(y, 1)])], b)]
                                  else
                                    getSmallestUpper cc x
    | _::cc -> getSmallestUpper cc x

(* transform *)
and transform_poly p c =
  let (c1, c2) = split_cond (remove_duplicate_conds (List.flatten (List.map transform_cond c))) in
    let todo = [ (c1, c2, p) ]
    and accu = [] in
      let tmp = transform_poly_loop todo accu in
        let res = remdupCP tmp in
          res
and remove_duplicate_conds c =
  match c with
    | [] -> []
    | p::pp -> p::(remove_duplicate_conds (List.filter (fun q -> not (Poly.equal p q)) pp))
and remdupCP cps =
  match cps with
    | [] -> []
    | (c, p)::cps' -> (c, p)::(remdupCP (List.filter (fun (c', p') -> not (equalCP (c, p) (c', p'))) cps'))
and equalCP (c, p) (c', p') =
  (Parapoly.equal p p') && (equalC c c')
and equalC c c' =
  c == c' || (List.length c = List.length c' && List.for_all (fun a -> List.exists (Poly.equal a) c') c)
and transform_cond atom =
  match atom with
    | Pc.Equ (l, r) -> [ Poly.minus l r; Poly.minus r l ]
    | Pc.Neq (l, r) -> failwith "Cannot do this!"
    | Pc.Geq (l, r) -> [ Poly.minus l r ]
    | Pc.Gtr (l, r) -> [ Poly.minus l (Poly.add r ([], Big_int.unit_big_int)) ]
    | Pc.Leq (l, r) -> [ Poly.minus r l ]
    | Pc.Lss (l, r) -> [ Poly.minus r (Poly.add l ([], Big_int.unit_big_int)) ]
and split_cond cond =
  match cond with
    | [] -> ([], [])
    | c::cc -> let (c1, c2) = split_cond cc in
                 if Poly.isUnivariateLinear c then
                   ((strengthen c)::c1, c2)
                 else
                   (c1, c::c2)
and strengthen poly =
  let sign y = if (Big_int.lt_big_int y Big_int.zero_big_int) then (Big_int.minus_big_int Big_int.unit_big_int) else Big_int.unit_big_int in
    match poly with
      | ([(c, [(x, 1)])], d) -> ([(sign c, [(x, 1)])], Big_int.div_big_int d (Big_int.abs_big_int c))
      | _ -> poly
and transform_poly_loop todo accu =
  match todo with
    | [] -> accu
    | (c1, c2, p)::todo' -> if c2 = [] then
                              transform_poly_loop todo' ((c1, p)::accu)
                            else
                              let newtodo = applyOneRule c1 c2 p in
                                transform_poly_loop (remdupCCP (newtodo @ todo')) ((c1, p)::accu)
and remdupCCP ccps =
  match ccps with
    | [] -> []
    | (c1, c2, p)::ccps' -> (c1, c2, p)::(remdupCCP (List.filter (fun (c1', c2', p') -> not (equalCCP (c1, c2, p) (c1', c2', p'))) ccps'))
and equalCCP (c1, c2, p) (c1', c2', p') =
  (Parapoly.equal p p') && (equalC c1 c1') && (equalC c2 c2')
and applyOneRule c1 c2 p =
  applyOneRule_loop c1 c2 c2 p []
and applyOneRule_loop c1 c2 allC2 p accu =
  match c2 with
    | [] -> accu
    | s::ss -> applyOneRule_loop c1 ss allC2 p (accu @ (applyTheRule c1 s allC2 p))
and applyTheRule c1 s allC2 p =
  if Poly.isUnivariateLinear s then
    [((strengthen s)::c1, removeEqual allC2 s, p)]
  else
    let expressPossibilities = getExpressPossibilities s in
      List.map (applyExpressPossibility (c1, removeEqual allC2 s, p)) expressPossibilities
and removeEqual l e =
  match l with
    | [] -> []
    | x::xs -> if Poly.equal x e then
                 xs
               else
                 x::(removeEqual xs e)
and getExpressPossibilities s =
  let monos = getExpressMonomials s in
    getExpressPossibilitiesLoop s monos
and getExpressPossibilitiesLoop s monos =
  match monos with
    | [] -> []
    | m::mm -> let wname = getWname () in
                 (wname, List.hd (snd m), getNewPolynomial s m wname)::(getExpressPossibilitiesLoop s mm)
and getWname () =
  let wname = "!!_" ^ (string_of_int !count) in
    incr count;
    wname
and getNewPolynomial s m wname =
  let rhs = Poly.minus (Poly.minus s ([m], Big_int.zero_big_int)) (Poly.fromVar wname) in
    if (Poly.eq_big_int (fst m) Big_int.unit_big_int) then
      Poly.constmult rhs (Big_int.minus_big_int Big_int.unit_big_int)
    else
      rhs
and getExpressMonomials (monos, c) =
  List.filter isExpressMonomial monos
and isExpressMonomial (c, vps) =
  (List.length vps = 1) && (Poly.eq_big_int (Big_int.abs_big_int c) Big_int.unit_big_int)
and applyExpressPossibility (c1, c2, p) (w, (x, i), q) =
  ((Poly.fromVar w)::c1, remove_duplicate_conds (List.map (fun poly -> Poly.replaceVarPower poly (x, i) q) c2), Parapoly.replaceVarPower p (x, i) (getAsParaPoly q))

(* set up smt problem *)
and get_absolute_positive conds =
  List.map (fun foronepoly -> List.flatten (List.map get_absolute_positive_one foronepoly)) conds
and get_absolute_positive_one (c, (p, d)) =
  let c' = getStrongest c in
    let (p_good, p_bad) = split_bounded c' p in
      let p_bad_zero = List.map coeffZero p_bad in
        let p_good_possibilities = getCoeffPossibilities c' (p_good, d) in
          List.map (fun poss -> poss @ p_bad_zero) p_good_possibilities
and split_bounded c p =
  match p with
    | [] -> ([], [])
    | m::mm -> let (tmp1, tmp2) = split_bounded c mm in
                 if allOddHaveBound c m then
                   (m::tmp1, tmp2)
                 else
                   (tmp1, m::tmp2)
and allOddHaveBound c (_, varPowers) =
  List.for_all (fun (x, power) -> (power mod 2 = 0) || (hasBound c x)) varPowers
and hasBound c x =
  match c with
    | [] -> false
    | b::bb -> if isBoundFor b x then
                 true
               else
                 hasBound bb x
and isBoundFor b x =
  (Poly.isUnivariateLinear b) && (Poly.getVars b = [x])
and coeffZero (coeff, _) =
  Pc.Equ (coeff, ([], Big_int.zero_big_int))
and getCoeffPossibilities c (p, d) =
  let todo = [((p, d), [])]
  and accu = [] in
    getCoeffPossibilitiesLoop c todo accu
and getCoeffPossibilitiesLoop c todo accu =
  match todo with
    | [] -> accu
    | ((monos, d), cond)::todo' -> if monos = [] then
                                     getCoeffPossibilitiesLoop c todo' (((coeffGeq d)::cond)::accu)
                                   else
                                     let m = pick_max_degree_monomial monos in
                                       let new_todos = getBoundPossibilities c m (monos, d) cond in
                                         getCoeffPossibilitiesLoop c (new_todos @ todo') accu
and coeffGeq coeff =
  Pc.Geq (coeff, ([], Big_int.zero_big_int))
and pick_max_degree_monomial monos =
  match monos with
    | [] -> failwith "Should have monomials"
    | [m] -> m
    | m::mm -> let mDegree = Poly.getDegreeMono (snd m)
               and tmp = pick_max_degree_monomial mm in
                 if mDegree >= Poly.getDegreeMono (snd tmp) then
                   m
                 else
                   tmp
and getBoundPossibilities c m p cond =
  (* (r, varPowers, o') *)
  let todo = [(([], fst m), snd m, 0)]
  and accu = [] in
    List.map (constructBoundPossibilities m p cond) (getBoundPossibilitiesLoop c todo accu)
and getBoundPossibilitiesLoop c todo accu =
  match todo with
    | [] -> accu
    | (r, varPowers, o')::todo' -> if varPowers = [] then
                                     getBoundPossibilitiesLoop c todo' ((r, o')::accu)
                                   else
                                   (
                                     let new_todos = boundFirst c r varPowers o' in
                                       getBoundPossibilitiesLoop c (new_todos @ todo') accu
                                   )
and boundFirst c r varPowers o' =
  match varPowers with
    | [] -> failwith "Should have powers"
    | (v, power)::vps -> List.flatten (List.filter (fun l -> l <> []) [boundLower c r (v, power) vps o'; boundUpper c r (v, power) vps o'; boundEven r (v, power) vps o'])
and boundLower c r (v, power) vps o' =
  match findLowerBound c v with
    | None -> []
    | Some p -> let ppower = getAsParaPoly (getPower p power) in
                  [(Parapoly.mult r ppower, vps, o')]
and getPower p power =
  if power = 1 then
    p
  else
    Poly.mult (getPower p (power - 1)) p
and findLowerBound c v =
  match c with
    | [] -> None
    | b::bb -> if isLowerBoundFor b v then
                 Some b
               else
                 findLowerBound bb v
and isLowerBoundFor b v =
  (Poly.isUnivariateLinear b) && (Poly.getVars b = [v]) && (Poly.eq_big_int (Poly.getCoeff b (asMonomial v)) Big_int.unit_big_int)
and asMonomial v =
  [(v, 1)]
and boundUpper c r (v, power) vps o' =
  match findUpperBound c v with
    | None -> []
    | Some p -> let ppower = getAsParaPoly (getPower p power) in
                  if (power mod 2) = 0 then
                    [(Parapoly.mult r ppower, vps, o')]
                  else
                    [(Parapoly.constmult (Parapoly.mult r ppower) (Big_int.minus_big_int Big_int.unit_big_int), vps, o' + 1)]
and findUpperBound c v =
  match c with
    | [] -> None
    | b::bb -> if isUpperBoundFor b v then
                 Some b
               else
                 findUpperBound bb v
and isUpperBoundFor b v =
  (Poly.isUnivariateLinear b) && (Poly.getVars b = [v]) && (Poly.eq_big_int (Poly.getCoeff b (asMonomial v)) (Big_int.minus_big_int Big_int.unit_big_int))
and boundEven r (v, power) vps o' =
  if (power mod 2) = 0 then
    let vp = asParaPoly (([], Big_int.unit_big_int), [(v, power)]) in
      [(Parapoly.mult r vp, vps, o')]
  else
    []
and constructBoundPossibilities (coeff, _) p cond (r, o') =
  (Parapoly.add p (Parapoly.negate r), cond @ [constructNewCond coeff o'])
and constructNewCond coeff o' =
  if (o' mod 2) = 0 then
    coeffGeq coeff
  else
    coeffGeq (Poly.constmult coeff (Big_int.minus_big_int Big_int.unit_big_int))
and asParaPoly (coeff, varPower) =
  ([(coeff, varPower)], ([], Big_int.zero_big_int))

(* use smt solver to check for solution *)
and has_solution polyconditions polystrict boundconditions vars =
  Smt.isSatisfiablePolo polyconditions polystrict boundconditions [] vars
and getGtrForConstant polyst =
  List.map (List.map convertToGtr) polyst
and convertToGtr conds =
  (convertToGtrOne (List.hd conds))::(List.tl conds)
and convertToGtrOne c =
  match c with
    | Pc.Geq (l, r) -> Pc.Gtr (l, r)
    | _ -> failwith "Internal error in Polo.convertToGtrOne"

(* complete model given by smt solver *)
and fix_model model params =
  let missing = getMissing model params in
    extend_model model missing
and extend_model model missing =
  List.fold_left (fun model missing_var -> VarMap.add missing_var Big_int.zero_big_int model) model missing
and getMissing model params =
  List.filter (fun v -> not(VarMap.mem v model)) params

(* create concrete polo *)
and get_concrete_poly abs model =
  match abs with
    | [] -> []
    | (f, pol)::popo -> (f, get_concrete_poly_one pol model)::(get_concrete_poly popo model)
and get_concrete_poly_one (pol, c) model =
  let res = List.map (fun (p, x) -> (Poly.evaluate p model, x)) pol in
    let (iterm, _) = Poly.construct_poly res in
      (iterm, Poly.evaluate c model)

(* return new trs and proof *)
and get_new_trs trs polystrict boundconditions model =
  match trs with
    | [] -> ([], [])
    | ru::rus -> let (res, junk) = get_new_trs rus (List.tl polystrict) (List.tl boundconditions) model in
                   if isStrictlySmaller (List.hd polystrict) (List.hd boundconditions) model then
                     (res, ru::junk)
                   else
                     (ru::res, junk)
and isStrictlySmaller strictcond boundcond model =
  (List.exists (fun c -> Pc.isTrue c model) strictcond) && (List.exists (fun c -> Pc.isTrue c model) boundcond)
and getProof i alli ntrs trs concrete_poly =
  if ntrs = [] then
    "A polynomial interpretation with\n" ^
    (pol_to_string concrete_poly) ^ "\n" ^
    "removes all rules from problem " ^ (string_of_int i) ^ "."
  else
    let remo = List.filter (fun ru -> not (Trs.contains ntrs ru)) trs in
      let more = (List.length remo) <> 1 in
        "A polynomial interpretation with\n" ^
        (pol_to_string concrete_poly) ^ "\n" ^
        "removes the following" ^ (if more then " rules " else " rule ") ^
        "from problem " ^ (string_of_int i) ^ ":\n" ^
        (Trs.toStringPrefix "\t" remo) ^ "\n" ^
        "We thus obtain the following problem:\n" ^
        (Procs.getStringSccs alli [ntrs])
and pol_to_string concrete_poly =
  String.concat "\n" (List.map pol_to_string_one concrete_poly)
and pol_to_string_one (f, iterm) =
  "\tPol(" ^ f ^ ") = " ^ (Poly.toString iterm)
