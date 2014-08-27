(*
  Representation of complexity bounds.

  @author Marc Brockschmidt
  @license This file is distributed under the MIT License (MIT)
           See LICENSE for details
*)

type bound =
  | Num of Big_int.big_int
  | Var of string
  | Add of bound * bound
  | Sub of bound * bound
  | Mul of bound * bound
  | Div of bound * bound
  | Pow of bound * bound
  | Log of bound * bound
  | Max of bound list

exception NoConstant

let getVars b =
  let addIfNew vars v =
    if List.exists (fun v' -> v = v') vars then
      vars
    else
      v::vars in  
  let rec getVars' b acc =
    match b with
    | Num _ -> acc
    | Var v -> addIfNew acc v
    | Add (b1, b2)
    | Sub (b1, b2)
    | Mul (b1, b2)
    | Div (b1, b2)
    | Pow (b1, b2)
    | Log (b1, b2) ->
      let acc' = getVars' b1 acc in
      getVars' b2 acc'
    | Max bs ->
      List.fold_left (fun acc b -> getVars' b acc) [] bs in
  getVars' b []

let rec getConst b =
  match b with
  | Var _ -> raise NoConstant
  | Num i -> i
  | Add (b1, b2) -> Big_int.add_big_int (getConst b1) (getConst b2)
  | Sub (b1, b2) -> Big_int.sub_big_int (getConst b1) (getConst b2)
  | Mul (b1, b2) -> Big_int.mult_big_int (getConst b1) (getConst b2)
  | Div (b1, b2) -> Big_int.div_big_int (getConst b1) (getConst b2)
  | Pow (b1, b2) -> Big_int.power_big_int_positive_big_int (getConst b1) (getConst b2)
  | Log (b1, b2) -> raise (Invalid_argument "Can't get constant out of logarithm at this time.")
  | Max bs       -> List.fold_left max Big_int.zero_big_int (List.map getConst bs)

let pp b =
  let protect strength force s =
    if strength >= force then s else "(" ^ s ^ ")" in
  let rec pp force b =
    match b with
    | Num i -> Big_int.string_of_big_int i
    | Var v -> v
    | Add (b1, b2) -> protect 1 force (Printf.sprintf "%s + %s" (pp 1 b1) (pp 1 b2))
    | Sub (b1, b2) -> protect 1 force (Printf.sprintf "%s - %s" (pp 1 b1) (pp 2 b2))
    | Mul (b1, b2) -> protect 2 force (Printf.sprintf "%s * %s" (pp 2 b1) (pp 2 b2))
    | Div (b1, b2) -> protect 2 force (Printf.sprintf "%s / %s" (pp 2 b1) (pp 2 b2))
    | Pow (b1, b2) -> 
        (
         try 
           let c = getConst b2 in
           Printf.sprintf "%s^%s" (pp 3 b1) (Big_int.string_of_big_int c)
         with
         | _ ->
             Printf.sprintf "pow(%s, %s)" (pp 0 b1) (pp 0 b2)
        )
    | Log (b1, b2) -> Printf.sprintf "log(%s, %s)" (pp 0 b1) (pp 0 b2)
    | Max bs       -> Printf.sprintf "max(%s)" (String.concat ", " (List.map (pp 0) bs)) in
  pp 0 b

let rec tonumdegree b =
  match b with
  | Num _ -> 0.0
  | Var _ -> 1.0
  | Add (b1, b2)
  | Sub (b1, b2) -> max (tonumdegree b1) (tonumdegree b2)
  | Mul (b1, b2)
  | Div (b1, b2) -> (tonumdegree b1) +. (tonumdegree b2)
  | Pow (b1, b2) ->
      (
       try (tonumdegree b1) *. (Big_int.float_of_big_int (getConst b2)) with
       | NoConstant -> 10000.0 *. (tonumdegree b2)
      )
  | Log (b1, b2) -> 0.5 *. (tonumdegree b2)
  | Max bs       -> List.fold_left max 0. (List.map tonumdegree bs)
