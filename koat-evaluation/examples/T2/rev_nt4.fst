model main {
  var A, B, C, D, E;
  states f12, f11, f28, f20;
  transition t0 := {
    from   := f12;
    to     := f11;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := f28;
    to     := f20;
    guard  := A > 0;
    action := B' = 1, C' = A, D' = 1, E' = A;
  };
}
strategy dumb {
  Region init := { state = f28 };
}
