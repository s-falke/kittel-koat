model main {
  var A, B, C;
  states f0, f5;
  transition t0 := {
    from   := f0;
    to     := f5;
    guard  := true;
    action := A' = C, B' = C, C' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
