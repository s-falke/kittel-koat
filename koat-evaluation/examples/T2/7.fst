model main {
  var A, B, C, D;
  states f4, f5, f0;
  transition t0 := {
    from   := f4;
    to     := f5;
    guard  := A > B;
    action := D' = ?;
  };
  transition t1 := {
    from   := f0;
    to     := f4;
    guard  := true;
    action := A' = D, C' = B, B' = D + 1, D' = ?;
  };
  transition t2 := {
    from   := f4;
    to     := f4;
    guard  := true;
    action := A' = D, C' = B, B' = D + 1, D' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
