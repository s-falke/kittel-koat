(*
  CINTs

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

type cint = Comrule.rule list

(* Create a string for a Cint *)
let rec toStringPrefix p rules =
  String.concat "\n" (List.map (fun r -> p ^ Comrule.toString r) rules)
and toString rules =
  toStringPrefix "" rules

(* Get the arity of a function symbol in a trs *)
let rec getArityOf f cint =
  let fterm = getFterm f cint in
    Term.getArity fterm
and getFterm f cint =
  match cint with
    | [] -> failwith "internal error in Cint.getArityOf"
    | r::rr -> if (Term.getFun (Comrule.getLeft r) = f) then
                          Comrule.getLeft r
                        else if (List.exists (fun r -> Term.getFun r = f) (Comrule.getRights r)) then
                          getFtermFrom f (Comrule.getRights r)
                        else
                          getFterm f rr
and getFtermFrom f rs =
  match rs with
    | [] -> failwith "internal error in Cint.getArityOf"
    | r::rest -> if Term.getFun r = f then
                   r
                 else
                   getFtermFrom f rest

(* Returns all rules for a function symbol *)
let rec getRules cint f =
  List.filter (fun rule -> Comrule.getLeftFun rule = f) cint

(* Returns the function symbols of this cint *)
let getFuns cint =
  Utils.remdup (List.flatten (List.map (fun rule -> (Comrule.getFuns rule)) cint))

(* Determines whether a cint is linear *)
let isLinear trs =
  List.for_all Comrule.isLinear trs

(* Determines whether the constraints of a cint are linear *)
let isConstraintLinear trs =
  List.for_all Comrule.isConstraintLinear trs

let equal cint1 cint2 =
  cint1 == cint2 || ((List.length cint1 = List.length cint2) && (List.for_all2 Comrule.equal cint1 cint2))

(* only one rhs? *)
let isUnary cint =
  List.for_all Comrule.isUnary cint

(* convert unary cint to a trs *)
let rec toTrs cint =
  List.map ruletotrs cint
and ruletotrs r =
  if not(Comrule.isUnary r) then
    failwith "Cannot convert non-unary CINT into a TRS"
  else
    Rule.create
      (Comrule.getLeft r)
      (List.hd (Comrule.getRights r))
      (Comrule.getCond r)

let contains cint comrule =
  (List.exists (fun comrule' -> comrule' == comrule) cint) || (List.exists (fun comrule' -> Comrule.equal comrule' comrule) cint)

let rec separate cint =
  List.flatten (List.map toSep cint)
and toSep r =
  List.map (fun rhs -> Rule.create (Comrule.getLeft r) rhs (Comrule.getCond r)) (Comrule.getRights r)
