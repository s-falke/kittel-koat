model main {
  var A, B;
  states f0, f5;
  transition t0 := {
    from   := f0;
    to     := f5;
    guard  := true;
    action := A' = B, B' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
