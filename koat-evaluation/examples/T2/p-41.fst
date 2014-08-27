model main {
  var A, B;
  states f2, f5;
  transition t0 := {
    from   := f2;
    to     := f5;
    guard  := true;
    action := A' = B, B' = ?;
  };
}
strategy dumb {
  Region init := { state = f2 };
}
