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

module RVG = Rvgraph.Make(Rule)
module LSC = LocalSizeComplexity.Make(Rule)
module GSC = GlobalSizeComplexity.Make(Rule)
module TGraph = Tgraph.Make(Rule)
module CTRSObl = Ctrsobl.Make(Rule)
module CTRS = CTRSObl.CTRS
open CTRSObl
open CTRS

let rec getSubset r s set =
  match r with
    | [] -> []
    | ru::rr -> if (List.exists (fun ru' -> Rule.equal ru ru') s) then
                  (List.hd set)::(getSubset rr s (List.tl set))
                else
                  (getSubset rr s (List.tl set))

(* Find a polynomial interpretation *)
let rec process degree useSizeComplexities ctrsobl tgraph rvgraph =
  if CTRSObl.isSolved ctrsobl then
    None
  else
    (
      Log.log (Printf.sprintf "Trying PRF (RTA'11-style) processor for degree %i (%s size bounds)..." degree (if useSizeComplexities then "with" else "without"));
      let globalSizeComplexities = if useSizeComplexities then GSC.compute ctrsobl (Utils.unboxOption rvgraph) else GSC.empty in
      Polo.count := 1;
      let s = CTRSObl.getUnknownComplexityRules ctrsobl in
      let toOrient = if useSizeComplexities then s else ctrsobl.ctrs.rules in
      let (abs, params) = Polo.create_poly_map degree toOrient in
      let (conds, polys, bounds) = Polo.create_conds_polys_bounds toOrient abs Big_int.unit_big_int in
      let polyst = List.map2 Polo.transform_poly polys conds in
      let boundst = List.map2 Polo.transform_poly (getSubset toOrient s bounds) (getSubset toOrient s conds) in
      let polyconditions = Polo.get_absolute_positive polyst in
      let boundconditions = Polo.get_absolute_positive boundst in
      let polystrict = Polo.getGtrForConstant (getSubset toOrient s polyconditions) in

      (* Optimization: If we use size complexities, we force coefficient for input
         sizes that will have unknown sizes to zero. *)
      let extra_constraints =
        if useSizeComplexities && degree > 0 then
          Cfarkaspolo.forceCoeffForUnknownInputToZero ctrsobl tgraph globalSizeComplexities toOrient abs
        else
          [] in

      match Smt.isSatisfiablePolo polyconditions polystrict boundconditions extra_constraints params with
      | None -> None
      | Some model ->
        (
          let model' = Polo.fix_model model params in
          let conc = List.map (fun (f, pol) -> (f, Some pol)) (Polo.get_concrete_poly abs model') in
          let c = Cfarkaspolo.getC useSizeComplexities tgraph conc ctrsobl toOrient globalSizeComplexities in
          Log.log (Printf.sprintf "PRF synthesis successful, proven complexity %s." (Complexity.toString c));
          let nctrsobl = annotate ctrsobl s polystrict boundconditions model' c in
          if CTRSObl.haveSameComplexities ctrsobl nctrsobl then 
            None
          else
            Some ((nctrsobl, tgraph, rvgraph), Cfarkaspolo.getProof ctrsobl nctrsobl conc useSizeComplexities globalSizeComplexities toOrient)
        )
    )

and annotate ctrsobl s polystrict boundconditions model d =
  let isStrictlySmaller strictcond boundcond model =
    (List.exists (fun c -> Pc.isTrue c model) strictcond) && (List.exists (fun c -> Pc.isTrue c model) boundcond)
  in
  let newComplexity =
    List.fold_left 
      (fun newComplexity (rule, strictVar, boundVar) -> 
        if isStrictlySmaller strictVar boundVar model && CTRSObl.hasUnknownComplexity ctrsobl rule then 
          RuleMap.add rule d newComplexity
        else
          newComplexity)
      ctrsobl.complexity
      (Utils.combine3 s polystrict boundconditions)
  in
  { ctrs = ctrsobl.ctrs ; complexity = newComplexity ; cost = ctrsobl.cost; leafCost = ctrsobl.leafCost }
