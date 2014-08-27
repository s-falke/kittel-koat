model main {
  var A, B, C, D;
  states eval1, eval2, eval3, eval4;
  transition t0 := {
    from   := eval1;
    to     := eval2;
    guard  := A > 1;
    action := A' = A - 1;
  };
  transition t1 := {
    from   := eval1;
    to     := eval2;
    guard  := 1 >= A;
    action := B' = B - 1;
  };
  transition t2 := {
    from   := eval2;
    to     := eval3;
    guard  := B > 1;
    action := C' = A, D' = 2*A;
  };
  transition t3 := {
    from   := eval3;
    to     := eval4;
    guard  := B >= D && B > D;
    action := ;
  };
  transition t4 := {
    from   := eval3;
    to     := eval4;
    guard  := B >= D && B > D;
    action := D' = D + 1;
  };
  transition t5 := {
    from   := eval3;
    to     := eval3;
    guard  := B >= D && B > D && D > 0;
    action := C' = D, D' = 2*D;
  };
  transition t6 := {
    from   := eval3;
    to     := eval3;
    guard  := B >= D && B > D && D > 0;
    action := C' = D + 1, D' = 2*D + 2;
  };
  transition t7 := {
    from   := eval3;
    to     := eval4;
    guard  := B = D;
    action := ;
  };
  transition t8 := {
    from   := eval3;
    to     := eval3;
    guard  := D > 0 && B = D;
    action := C' = D, D' = 2*D;
  };
  transition t9 := {
    from   := eval4;
    to     := eval2;
    guard  := A > 1 && A > 0 && B > 1;
    action := A' = A - 1;
  };
  transition t10 := {
    from   := eval4;
    to     := eval2;
    guard  := B > 1 && A = 1;
    action := B' = B - 1;
  };
}
strategy dumb {
  Region init := { state = eval1 };
}
