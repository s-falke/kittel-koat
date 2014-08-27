model main {
  var A, B;
  states f0, f7;
  transition t0 := {
    from   := f0;
    to     := f7;
    guard  := true;
    action := A' = 1, B' = 1;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
