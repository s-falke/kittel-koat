model main {
  var A;
  states f0, f6;
  transition t0 := {
    from   := f0;
    to     := f6;
    guard  := true;
    action := A' = 0;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
