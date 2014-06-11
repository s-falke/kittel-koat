(*
  Terms

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

type funSym = string
type term = funSym * (Poly.poly list)

(* Create term from what the parser gives *)
let create f arglist =
  let args = List.map Poly.construct_poly arglist in
    (f, args)

let compare (f1, as1) (f2, as2) =
  let fComp = String.compare f1 f2 in
  if fComp <> 0 then
    fComp
  else
    let aNum1 = List.length as1 in
    let aNum2 = List.length as2 in
    if aNum1 < aNum2 then
      -1
    else if aNum1 > aNum2 then
      1
    else
      List.fold_left2
        (fun acc a1 a2 -> if acc <> 0 then acc else Poly.compare a1 a2) 0 as1 as2

(* Create a string for a term *)
let toString (f, args) =
  f ^ "(" ^ (String.concat ", " (List.map Poly.toString args)) ^ ")"

(* Get the argument integer terms *)
let getArgs (_, args) =
  args

(* Get the function symbol *)
let getFun (f, _) =
  f

(* Returns the arity of a term *)
let getArity (_, args) =
  List.length args

(* Return the variables of a term *)
let getVars (_, args) =
  Utils.remdup (Utils.concatMap Poly.getVars args)

(* Instantiate a term *)
let instantiate (f, args) bindings =
  (f, List.map (fun poly -> Poly.instantiate poly bindings) args)

(* Renames the variables in a term *)
let renameVars varmapping (f, args) =
  (f, List.map (Poly.renameVars varmapping) args)

(* Determines whether a term is linear *)
let isLinear (_, args) =
  List.for_all Poly.isLinear args

let rec equal t1 t2 =
  t1 == t2 || equalInternal t1 t2
and equalInternal (f1, args1) (f2, args2) =
  f1 = f2 && (List.for_all2 Poly.equal args1 args2)
