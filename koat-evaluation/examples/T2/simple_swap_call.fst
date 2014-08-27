model main {
  var A, B, C, D, E;
  states f0, f11;
  transition t0 := {
    from   := f0;
    to     := f11;
    guard  := 99 >= D;
    action := A' = 0, B' = 1, C' = E, D' = ?, E' = ?;
  };
  transition t1 := {
    from   := f0;
    to     := f11;
    guard  := true;
    action := A' = 0, B' = 1, C' = E, D' = ?, E' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
