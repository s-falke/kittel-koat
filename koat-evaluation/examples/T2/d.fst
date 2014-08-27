model main {
  var A, B, C, D, E, F;
  states f0, f1;
  transition t0 := {
    from   := f0;
    to     := f1;
    guard  := true;
    action := D' = ?, E' = ?, F' = ?;
  };
  transition t1 := {
    from   := f1;
    to     := f1;
    guard  := A > 0 && D > 0 && B = 0;
    action := A' = E, C' = B, B' = F, D' = ?, E' = ?, F' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
