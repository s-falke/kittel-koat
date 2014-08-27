model main {
  var A, B, C, D, E;
  states f6, f7, f0, f4, f14;
  transition t0 := {
    from   := f6;
    to     := f7;
    guard  := 0 > A;
    action := E' = ?;
  };
  transition t1 := {
    from   := f6;
    to     := f7;
    guard  := A > 0;
    action := E' = ?;
  };
  transition t2 := {
    from   := f0;
    to     := f4;
    guard  := B >= 0 && C >= B;
    action := D' = B + 1, E' = ?;
  };
  transition t3 := {
    from   := f4;
    to     := f6;
    guard  := B > D;
    action := A' = E, E' = ?;
  };
  transition t4 := {
    from   := f4;
    to     := f6;
    guard  := D > B;
    action := A' = E, E' = ?;
  };
  transition t5 := {
    from   := f7;
    to     := f4;
    guard  := C >= D;
    action := D' = D + 1, E' = ?;
  };
  transition t6 := {
    from   := f7;
    to     := f4;
    guard  := D > C;
    action := D' = 0, E' = ?;
  };
  transition t7 := {
    from   := f6;
    to     := f14;
    guard  := A = 0;
    action := A' = 0, E' = ?;
  };
  transition t8 := {
    from   := f4;
    to     := f14;
    guard  := B = D;
    action := D' = B, E' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
