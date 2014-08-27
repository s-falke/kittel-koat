model main {
  var A, B, C, D, E;
  states f0, f8, f14, f23, f28, f38;
  transition t0 := {
    from   := f0;
    to     := f8;
    guard  := true;
    action := A' = 0, D' = ?, E' = ?;
  };
  transition t1 := {
    from   := f8;
    to     := f14;
    guard  := 99 >= A && 99 >= D;
    action := B' = A, D' = ?, E' = ?;
  };
  transition t2 := {
    from   := f8;
    to     := f14;
    guard  := 99 >= A;
    action := B' = A, D' = ?, E' = ?;
  };
  transition t3 := {
    from   := f23;
    to     := f28;
    guard  := 99 >= A && 0 > E;
    action := C' = D, D' = ?, E' = ?;
  };
  transition t4 := {
    from   := f23;
    to     := f28;
    guard  := 99 >= A;
    action := C' = D, D' = ?, E' = ?;
  };
  transition t5 := {
    from   := f23;
    to     := f23;
    guard  := 99 >= A;
    action := A' = A + 1, D' = ?, E' = ?;
  };
  transition t6 := {
    from   := f28;
    to     := f23;
    guard  := true;
    action := A' = A + 1, D' = ?, E' = ?;
  };
  transition t7 := {
    from   := f28;
    to     := f23;
    guard  := 98 >= D;
    action := A' = A + 1, D' = ?, E' = ?;
  };
  transition t8 := {
    from   := f23;
    to     := f38;
    guard  := A > 99;
    action := D' = ?, E' = ?;
  };
  transition t9 := {
    from   := f8;
    to     := f8;
    guard  := 99 >= A;
    action := A' = A + 1, B' = A, D' = ?, E' = ?;
  };
  transition t10 := {
    from   := f14;
    to     := f8;
    guard  := true;
    action := A' = A + 1, D' = ?, E' = ?;
  };
  transition t11 := {
    from   := f14;
    to     := f8;
    guard  := 98 >= D;
    action := A' = A + 1, D' = ?, E' = ?;
  };
  transition t12 := {
    from   := f8;
    to     := f23;
    guard  := A > 99;
    action := A' = 0, D' = ?, E' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
