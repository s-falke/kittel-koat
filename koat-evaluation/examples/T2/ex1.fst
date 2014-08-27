model main {
  var A, B, C, D, E;
  states f0, f5, f16;
  transition t0 := {
    from   := f0;
    to     := f5;
    guard  := true;
    action := A' = 0, B' = 0, D' = ?, E' = ?;
  };
  transition t1 := {
    from   := f5;
    to     := f5;
    guard  := true;
    action := A' = A + 1, B' = B + 2, C' = D + E, D' = ?, E' = ?;
  };
  transition t2 := {
    from   := f5;
    to     := f16;
    guard  := true;
    action := D' = ?, E' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
