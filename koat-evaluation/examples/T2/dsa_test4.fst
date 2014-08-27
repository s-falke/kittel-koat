model main {
  var A, B;
  states f0, f11;
  transition t0 := {
    from   := f0;
    to     := f11;
    guard  := true;
    action := A' = B, B' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
