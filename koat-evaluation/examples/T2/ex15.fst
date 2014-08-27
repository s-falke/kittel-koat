model main {
  var A, B, C, D, E;
  states f0, f28;
  transition t0 := {
    from   := f0;
    to     := f28;
    guard  := true;
    action := A' = 4, B' = 0, C' = 1, D' = 2, E' = 3;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
