module type AbstractRule =
  sig
    type rule
    val toString: rule -> string
    val toDotString: rule -> string
    val getLeft: rule -> Term.term
    val getRights: rule -> Term.term list
    val getCond: rule -> Pc.cond
    val getFuns: rule -> string list
    val getLeftFun: rule -> string
    val getRightFuns: rule -> string list

    (** Get all used variables (in lhs, rhs, cond) *)
    val getVars: rule -> string list

    (** Rename rule variables such that no variables listed in first parameter are used. *)
    val renameVars: string list -> rule -> rule

    val isLinear: rule -> bool
    val isRightLinear: rule -> bool
    val isConstraintLinear: rule -> bool

    val equal: rule -> rule -> bool

    val satisfiesVarCond: rule -> bool

    (** Normalize rule to the standard internal format. *)
    val internalize: rule -> rule
  end;;
