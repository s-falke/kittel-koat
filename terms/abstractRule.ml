module type AbstractRule =
  sig
    type rule
    val compare: rule -> rule -> int
    val toString: rule -> string
    val toDotString: rule -> string
    val listToStringPrefix: string -> rule list -> string
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

    (** Chain two rules to obtain a new one.
      * Currently assumes the first one to be unary.
      *)
    val chainTwoRules: rule -> rule -> rule

    (** True iff there is only one rhs *)
    val isUnary: rule -> bool

    (** Restricts the arguments of terms appearing in rules according to a set of (0-based) indices.
      *  So 
      *    restrictArguments [0;1;4] (f(x,y,z,u,v) -> Com_2(g(x,y,z,u+1,v),h(y,x,u,z,v)))
      *  yields
      *    f(x,y,v) -> Com_2(g(x,y,v),h(y,x,v)))
      *)
    val restrictArguments: int list -> rule -> rule
  end
