model main {
  var A, B;
  states f3, f0;
  transition t0 := {
    from   := f3;
    to     := f0;
    guard  := true;
    action := A' = 1, B' = 1;
  };
  transition t1 := {
    from   := f0;
    to     := f0;
    guard  := true;
    action := A' = A + 1;
  };
}
strategy dumb {
  Region init := { state = f3 };
}
