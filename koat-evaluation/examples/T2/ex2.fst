model main {
  var A, B, C, D, E, F;
  states f0, f14, f22;
  transition t0 := {
    from   := f0;
    to     := f14;
    guard  := 0 >= E;
    action := A' = E, B' = E, C' = 0, E' = ?, F' = ?;
  };
  transition t1 := {
    from   := f0;
    to     := f14;
    guard  := E > 1023;
    action := A' = E, B' = E, C' = 0, E' = ?, F' = ?;
  };
  transition t2 := {
    from   := f0;
    to     := f14;
    guard  := 1023 >= E && E > 0;
    action := A' = E, B' = E, D' = F, C' = 0, E' = ?, F' = ?;
  };
  transition t3 := {
    from   := f14;
    to     := f14;
    guard  := E > C;
    action := C' = C + 1, E' = ?, F' = ?;
  };
  transition t4 := {
    from   := f14;
    to     := f22;
    guard  := C >= E;
    action := E' = ?, F' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
