model main {
  var A, B, C, D, E, F;
  states f0, f7, f21;
  transition t0 := {
    from   := f0;
    to     := f7;
    guard  := 0 > F;
    action := A' = F, B' = 0, C' = 0, F' = ?;
  };
  transition t1 := {
    from   := f0;
    to     := f7;
    guard  := F > 0;
    action := A' = F, B' = 0, C' = 0, F' = ?;
  };
  transition t2 := {
    from   := f0;
    to     := f7;
    guard  := true;
    action := A' = 0, B' = 1023, C' = 0, F' = ?;
  };
  transition t3 := {
    from   := f7;
    to     := f7;
    guard  := B >= C;
    action := C' = C + 1, D' = D + 2, F' = ?;
  };
  transition t4 := {
    from   := f7;
    to     := f21;
    guard  := E >= 0 && C > B && 1022 >= E;
    action := F' = ?;
  };
  transition t5 := {
    from   := f7;
    to     := f21;
    guard  := C > B && E > 1022;
    action := F' = ?;
  };
  transition t6 := {
    from   := f7;
    to     := f21;
    guard  := C > B && 0 > E;
    action := F' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
