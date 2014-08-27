model main {
  var A;
  states f0, f5;
  transition t0 := {
    from   := f0;
    to     := f5;
    guard  := true;
    action := A' = -1;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
