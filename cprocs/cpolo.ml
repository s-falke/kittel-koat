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

let rec getSubset r s set =
  match r with
    | [] -> []
    | ru::rr -> if Trs.contains s ru then
                  (List.hd set)::(getSubset rr s (List.tl set))
                else
                  (getSubset rr s (List.tl set))

(* Find a polynomial interpretation *)
let rec process degree useSizeComplexities (rcc, g, l) tgraph rvgraph =
  if Cprob.isSolved rcc then
    None
  else
  (
    let vars = Cfarkaspolo.getVars rcc in
      let globalSizeComplexities = if useSizeComplexities then Crvgraph.computeGlobalSizeComplexities (Cfarkaspolo.getOut rvgraph) rcc g vars else [] in
        Polo.count := 1;
        let r = List.map first rcc
        and s = (List.map first (List.filter (fun (_, c, _) -> c = Cprob.Unknown) rcc)) in
          let toOrient = if useSizeComplexities then s else r in
            let (abs, params) = Polo.create_poly_map degree toOrient in
              let (conds, polys, bounds) = Polo.create_conds_polys_bounds toOrient abs Big_int.unit_big_int in
                let polyst = List.map2 Polo.transform_poly polys conds
                and boundst = List.map2 Polo.transform_poly (getSubset toOrient s bounds) (getSubset toOrient s conds) in
                  let polyconditions = Polo.get_absolute_positive polyst
                  and boundconditions = Polo.get_absolute_positive boundst in
                    let polystrict = Polo.getGtrForConstant (getSubset toOrient s polyconditions) in
                      match Polo.has_solution polyconditions polystrict boundconditions params with
                        | None -> None
                        | Some model ->
                          (
                            let model' = Polo.fix_model model params in
                              let conc = List.map (fun (f, pol) -> (f, Some pol)) (Polo.get_concrete_poly abs model') in
                                let c = Cfarkaspolo.getC useSizeComplexities tgraph conc rcc g toOrient globalSizeComplexities vars in
                                  let nrcc = annotate rcc s polystrict boundconditions model' c
                                  and ng = g
                                  and nl = l
                                  and ntgraph = tgraph
                                  and nrvgraph = rvgraph in
                                    if Cfarkaspolo.equal rcc nrcc then
                                      None
                                    else
                                      Some (((nrcc, ng, nl), ntgraph, nrvgraph), fun ini outi -> Cfarkaspolo.getProof ini outi (rcc, g, l) (nrcc, ng, nl) conc useSizeComplexities globalSizeComplexities toOrient vars)
                          )
  )

and first (x, _, _) =
  x
and second (_, c, _) =
  c
and third (_, _, c) =
  c

and annotate rcc s polystrict boundconditions model d =
  match rcc with
    | [] -> []
    | (rule, c, c')::rest -> if s <> [] && Rule.equal rule (List.hd s) && c = Cprob.Unknown then
                               if isStrictlySmaller (List.hd polystrict) (List.hd boundconditions) model then
                                 (rule, d, c')::(annotate rest (List.tl s) (List.tl polystrict) (List.tl boundconditions) model d)
                               else
                                 (rule, c, c')::(annotate rest (List.tl s) (List.tl polystrict) (List.tl boundconditions) model d)
                             else
                               (rule, c, c')::(annotate rest s polystrict boundconditions model d)
and isStrictlySmaller strictcond boundcond model =
  (List.exists (fun c -> Pc.isTrue c model) strictcond) && (List.exists (fun c -> Pc.isTrue c model) boundcond)
