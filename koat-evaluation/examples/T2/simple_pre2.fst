model main {
  var A, B, C;
  states f0, f8;
  transition t0 := {
    from   := f0;
    to     := f8;
    guard  := true;
    action := A' = 2, B' = 1, C' = 2;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
