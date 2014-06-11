(*
  TRSs

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

type trs = Rule.rule list

(* Create a string for a Trs *)
let rec toStringPrefix p rules =
  String.concat "\n" (List.map (fun r -> p ^ Rule.toString r) rules)
and toString rules =
  toStringPrefix "" rules

(* Get the arity of a function symbol in a trs *)
let rec getArityOf f trs =
  let fterm = getFterm f trs in
    Term.getArity fterm
and getFterm f trs =
  match trs with
    | [] -> failwith "internal error in Trs.getArityOp"
    | r::rr ->
        if (Term.getFun (Rule.getLeft r) = f) then
          (Rule.getLeft r)
        else if (Term.getFun (Rule.getRight r) = f) then
          (Rule.getRight r)
        else
          getFterm f rr

(* Returns all rules for a function symbol *)
let rec getRules trs f =
  List.filter (fun r -> Term.getFun (Rule.getLeft r) = f) trs

(* Returns the function symbols of this trs *)
let getFuns trs =
  Utils.remdup (List.flatten (List.map (fun rule -> (Rule.getFuns rule)) trs))

(* Returns the left-hand side function symbols of this trs *)
let getLeftFuns trs =
  Utils.remdup (List.map (fun rule -> (Term.getFun (Rule.getLeft rule))) trs)

(* Returns the right-hand side function symbols of this trs *)
let getRightFuns trs =
  Utils.remdup (List.map (fun rule -> (Term.getFun (Rule.getRight rule))) trs)

(* Determines whether a trs is linear *)
let isLinear trs =
  List.for_all Rule.isLinear trs

(* Determines whether the constraints of a trs are linear *)
let isConstraintLinear trs =
  List.for_all Rule.isConstraintLinear trs

let rec equal trs1 trs2 =
  trs1 == trs2 || ((List.length trs1 = List.length trs2) && (List.for_all2 Rule.equal trs1 trs2))

(* fresh vars on rhs that are defined in the constraint are replaced by their definitions *)
let internalize trs =
  List.map Rule.internalize trs

let contains trs rule =
  (List.exists (fun rule' -> rule' == rule) trs) || (List.exists (fun rule' -> Rule.equal rule' rule) trs)
