model main {
  var A, B, C, D, E, F;
  states f0, f7, f10, f13, f16, f31;
  transition t0 := {
    from   := f0;
    to     := f7;
    guard  := true;
    action := A' = 400, B' = 0, F' = ?;
  };
  transition t1 := {
    from   := f7;
    to     := f10;
    guard  := 4 >= B;
    action := C' = 0, F' = ?;
  };
  transition t2 := {
    from   := f10;
    to     := f13;
    guard  := 4 >= C;
    action := D' = 0, F' = ?;
  };
  transition t3 := {
    from   := f13;
    to     := f16;
    guard  := 4 >= D;
    action := E' = 0, F' = ?;
  };
  transition t4 := {
    from   := f16;
    to     := f16;
    guard  := 4 >= E && A > F;
    action := E' = E + 1, F' = ?;
  };
  transition t5 := {
    from   := f16;
    to     := f16;
    guard  := 4 >= E;
    action := E' = E + 1, F' = ?;
  };
  transition t6 := {
    from   := f16;
    to     := f31;
    guard  := 4 >= E;
    action := F' = ?;
  };
  transition t7 := {
    from   := f16;
    to     := f13;
    guard  := E > 4;
    action := D' = D + 1, F' = ?;
  };
  transition t8 := {
    from   := f13;
    to     := f10;
    guard  := D > 4;
    action := C' = C + 1, F' = ?;
  };
  transition t9 := {
    from   := f10;
    to     := f7;
    guard  := C > 4;
    action := B' = B + 1, F' = ?;
  };
  transition t10 := {
    from   := f7;
    to     := f31;
    guard  := B > 4;
    action := F' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
