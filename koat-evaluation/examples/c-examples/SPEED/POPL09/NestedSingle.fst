model main {
  var A, B, C, D;
  states evalNestedSinglestart, evalNestedSingleentryin, evalNestedSinglebb5in, evalNestedSinglebb2in, evalNestedSinglereturnin, evalNestedSinglebb4in, evalNestedSinglebb3in, evalNestedSinglebb1in, evalNestedSinglestop;
  transition t0 := {
    from   := evalNestedSinglestart;
    to     := evalNestedSingleentryin;
    guard  := true;
    action := D' = ?;
  };
  transition t1 := {
    from   := evalNestedSingleentryin;
    to     := evalNestedSinglebb5in;
    guard  := true;
    action := A' = 0, D' = ?;
  };
  transition t2 := {
    from   := evalNestedSinglebb5in;
    to     := evalNestedSinglebb2in;
    guard  := B > A;
    action := C' = A, D' = ?;
  };
  transition t3 := {
    from   := evalNestedSinglebb5in;
    to     := evalNestedSinglereturnin;
    guard  := A >= B;
    action := D' = ?;
  };
  transition t4 := {
    from   := evalNestedSinglebb2in;
    to     := evalNestedSinglebb4in;
    guard  := C >= B;
    action := D' = ?;
  };
  transition t5 := {
    from   := evalNestedSinglebb2in;
    to     := evalNestedSinglebb3in;
    guard  := B > C;
    action := D' = ?;
  };
  transition t6 := {
    from   := evalNestedSinglebb3in;
    to     := evalNestedSinglebb1in;
    guard  := 0 > D;
    action := D' = ?;
  };
  transition t7 := {
    from   := evalNestedSinglebb3in;
    to     := evalNestedSinglebb1in;
    guard  := D > 0;
    action := D' = ?;
  };
  transition t8 := {
    from   := evalNestedSinglebb3in;
    to     := evalNestedSinglebb4in;
    guard  := true;
    action := D' = ?;
  };
  transition t9 := {
    from   := evalNestedSinglebb1in;
    to     := evalNestedSinglebb2in;
    guard  := true;
    action := C' = C + 1, D' = ?;
  };
  transition t10 := {
    from   := evalNestedSinglebb4in;
    to     := evalNestedSinglebb5in;
    guard  := true;
    action := A' = C + 1, D' = ?;
  };
  transition t11 := {
    from   := evalNestedSinglereturnin;
    to     := evalNestedSinglestop;
    guard  := true;
    action := D' = ?;
  };
}
strategy dumb {
  Region init := { state = evalNestedSinglestart };
}
