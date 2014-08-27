model main {
  var A, B;
  states f0, f9;
  transition t0 := {
    from   := f0;
    to     := f9;
    guard  := true;
    action := A' = B, B' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
