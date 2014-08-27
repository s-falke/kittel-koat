model main {
  var A, B, C, D, E;
  states f0, f4, f7, f19;
  transition t0 := {
    from   := f0;
    to     := f4;
    guard  := true;
    action := A' = 0, E' = ?;
  };
  transition t1 := {
    from   := f4;
    to     := f7;
    guard  := B > A;
    action := C' = A + 1, E' = ?;
  };
  transition t2 := {
    from   := f7;
    to     := f7;
    guard  := B > C;
    action := C' = C + 1, D' = 0, E' = ?;
  };
  transition t3 := {
    from   := f7;
    to     := f7;
    guard  := B > C && 0 > E;
    action := B' = B - 1, D' = E, E' = ?;
  };
  transition t4 := {
    from   := f7;
    to     := f7;
    guard  := B > C && E > 0;
    action := B' = B - 1, D' = E, E' = ?;
  };
  transition t5 := {
    from   := f7;
    to     := f4;
    guard  := C >= B;
    action := A' = A + 1, E' = ?;
  };
  transition t6 := {
    from   := f4;
    to     := f19;
    guard  := A >= B;
    action := E' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
