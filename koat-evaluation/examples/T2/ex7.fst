model main {
  var A, B, C, D, E, F;
  states f0, f7, f19;
  transition t0 := {
    from   := f0;
    to     := f7;
    guard  := true;
    action := A' = F, B' = F, C' = 10, D' = 0, F' = ?;
  };
  transition t1 := {
    from   := f7;
    to     := f7;
    guard  := C > D;
    action := D' = D + 1, E' = F, F' = ?;
  };
  transition t2 := {
    from   := f7;
    to     := f19;
    guard  := D >= C;
    action := F' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
