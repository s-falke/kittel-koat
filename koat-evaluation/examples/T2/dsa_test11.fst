model main {
  var A, B, C, D;
  states f0, f20;
  transition t0 := {
    from   := f0;
    to     := f20;
    guard  := true;
    action := A' = C, B' = D, C' = ?, D' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
