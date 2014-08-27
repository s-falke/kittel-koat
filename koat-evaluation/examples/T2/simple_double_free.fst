model main {
  var A, B;
  states f0, f6;
  transition t0 := {
    from   := f0;
    to     := f6;
    guard  := true;
    action := A' = B, B' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
