(*
  Knowledge propagation

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

open AbstractRule

module Make (RuleT : AbstractRule) = struct
  module CTRS = Ctrs.Make(RuleT)
  module TGraph = Tgraph.Make(RuleT)

  (* Remove subsumed rules *)
  let rec process (rcc, g, l) tgraph rvgraph =
    if CTRS.isSolved rcc then
      None
    else
    (
      let s = (List.map first (List.filter (fun (_, c, _) -> c = Complexity.Unknown) rcc))
      and k = (List.map first (List.filter (fun (_, c, _) -> c <> Complexity.Unknown) rcc)) in
        let subsumed = List.rev (TGraph.computeSubsumed tgraph s k) in
          if subsumed = [] then
            None
          else
            let nrcc = update rcc subsumed tgraph
            and ng = g
            and nl = l
            and ntgraph = tgraph
            and nrvgraph = rvgraph in
              Some (((nrcc, ng, nl), ntgraph, nrvgraph), fun ini outi -> getProof ini outi (rcc, g, l) (nrcc, ng, nl))
    )

  and first (x, _, _) =
    x

  and update rcc subsumed tgraph =
    match subsumed with
      | [] -> rcc
      | rule::rest -> update (updateOne rcc rule tgraph) rest tgraph
  and updateOne rcc rule tgraph =
    let pre = TGraph.getPreds tgraph [rule] in
      updateComplexity rcc rule (getSum rcc pre)
  and updateComplexity rcc rule d =
    match rcc with
      | [] -> []
      | (r, c, c')::rest -> if RuleT.equal r rule then
                              (r, d, c')::rest
                            else
                              (r, c, c')::(updateComplexity rest rule d)
  and getSum rcc pre =
    Complexity.listAdd (List.map (CTRS.getComplexity rcc) pre)

  and getProof ini outi rccgl nrccgl =
    "Repeatedly propagating knowledge in problem " ^
    (string_of_int ini) ^
    " produces the following problem:\n" ^
    (CTRS.toStringGNumber nrccgl outi)
end
