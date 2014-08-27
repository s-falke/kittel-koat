model main {
  var A, B, C, D, E;
  states f3, f2, f300;
  transition t0 := {
    from   := f3;
    to     := f2;
    guard  := true;
    action := D' = ?, E' = ?;
  };
  transition t1 := {
    from   := f2;
    to     := f2;
    guard  := 0 > A && 0 >= D && B > 0;
    action := A' = -1 + E, D' = ?, E' = ?;
  };
  transition t2 := {
    from   := f2;
    to     := f2;
    guard  := 0 > A && 0 >= D && 0 >= B;
    action := A' = -1 + E, D' = ?, E' = ?;
  };
  transition t3 := {
    from   := f2;
    to     := f2;
    guard  := D > 1 && 0 > A;
    action := A' = 1 + E, D' = ?, E' = ?;
  };
  transition t4 := {
    from   := f2;
    to     := f2;
    guard  := A > 0 && 0 > 1 + D && B > 0;
    action := A' = -1 + E, D' = ?, E' = ?;
  };
  transition t5 := {
    from   := f2;
    to     := f2;
    guard  := A > 0 && 0 > 1 + D && 0 >= B;
    action := A' = -1 + E, D' = ?, E' = ?;
  };
  transition t6 := {
    from   := f2;
    to     := f2;
    guard  := D >= 0 && A > 0;
    action := A' = 1 + E, D' = ?, E' = ?;
  };
  transition t7 := {
    from   := f2;
    to     := f300;
    guard  := 0 > A;
    action := C' = E, A' = 0, D' = ?, E' = ?;
  };
  transition t8 := {
    from   := f2;
    to     := f300;
    guard  := A > 0;
    action := C' = E, A' = 0, D' = ?, E' = ?;
  };
  transition t9 := {
    from   := f2;
    to     := f300;
    guard  := A = 0;
    action := C' = E, D' = ?, E' = ?;
  };
}
strategy dumb {
  Region init := { state = f3 };
}
