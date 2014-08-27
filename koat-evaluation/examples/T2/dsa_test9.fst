model main {
  var A, B, C, D, E, F;
  states f0, f24;
  transition t0 := {
    from   := f0;
    to     := f24;
    guard  := true;
    action := A' = D, B' = E, C' = F, D' = ?, E' = ?, F' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
