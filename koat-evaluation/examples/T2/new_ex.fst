model main {
  var A, B, C, D, E;
  states f0, f6, f10, f14, f25;
  transition t0 := {
    from   := f0;
    to     := f6;
    guard  := true;
    action := A' = E, B' = 0, E' = ?;
  };
  transition t1 := {
    from   := f6;
    to     := f10;
    guard  := A > 0;
    action := A' = A - 1, B' = B + 1, E' = ?;
  };
  transition t2 := {
    from   := f10;
    to     := f14;
    guard  := B > 0;
    action := B' = B - 1, C' = A - 1, E' = ?;
  };
  transition t3 := {
    from   := f14;
    to     := f14;
    guard  := C > 0;
    action := C' = C - 1, D' = 0, E' = ?;
  };
  transition t4 := {
    from   := f14;
    to     := f14;
    guard  := C > 0 && 0 > E;
    action := A' = A - 1, B' = B + 1, C' = C - 1, D' = E, E' = ?;
  };
  transition t5 := {
    from   := f14;
    to     := f14;
    guard  := C > 0 && E > 0;
    action := A' = A - 1, B' = B + 1, C' = C - 1, D' = E, E' = ?;
  };
  transition t6 := {
    from   := f14;
    to     := f10;
    guard  := 0 >= C;
    action := E' = ?;
  };
  transition t7 := {
    from   := f10;
    to     := f6;
    guard  := 0 >= B;
    action := E' = ?;
  };
  transition t8 := {
    from   := f6;
    to     := f25;
    guard  := 0 >= A;
    action := E' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
