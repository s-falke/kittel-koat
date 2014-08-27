model main {
  var A, B, C, D, E;
  states f0, f4, f8, f16, f20;
  transition t0 := {
    from   := f0;
    to     := f4;
    guard  := true;
    action := A' = 0, E' = ?;
  };
  transition t1 := {
    from   := f4;
    to     := f8;
    guard  := B > A;
    action := A' = A + 1, C' = 0, E' = ?;
  };
  transition t2 := {
    from   := f8;
    to     := f16;
    guard  := B > A;
    action := D' = 0, E' = ?;
  };
  transition t3 := {
    from   := f8;
    to     := f16;
    guard  := A >= B;
    action := E' = ?;
  };
  transition t4 := {
    from   := f8;
    to     := f8;
    guard  := B > A && 0 > E;
    action := A' = A + 1, C' = C + 1, D' = E, E' = ?;
  };
  transition t5 := {
    from   := f8;
    to     := f8;
    guard  := B > A && E > 0;
    action := A' = A + 1, C' = C + 1, D' = E, E' = ?;
  };
  transition t6 := {
    from   := f16;
    to     := f4;
    guard  := 0 >= C;
    action := E' = ?;
  };
  transition t7 := {
    from   := f16;
    to     := f4;
    guard  := C > 0;
    action := A' = A - 1, E' = ?;
  };
  transition t8 := {
    from   := f4;
    to     := f20;
    guard  := A >= B;
    action := E' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
