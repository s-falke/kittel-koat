model main {
  var A, B, C, D, E;
  states f9, f14, f22, f24, f27, f0;
  transition t0 := {
    from   := f9;
    to     := f14;
    guard  := 0 >= A;
    action := B' = 0, C' = E, E' = ?;
  };
  transition t1 := {
    from   := f14;
    to     := f14;
    guard  := C > 0;
    action := C' = C - 1, E' = ?;
  };
  transition t2 := {
    from   := f22;
    to     := f22;
    guard  := true;
    action := E' = ?;
  };
  transition t3 := {
    from   := f24;
    to     := f27;
    guard  := true;
    action := E' = ?;
  };
  transition t4 := {
    from   := f14;
    to     := f9;
    guard  := 0 >= C;
    action := D' = 0, A' = E, E' = ?;
  };
  transition t5 := {
    from   := f9;
    to     := f22;
    guard  := A > 0;
    action := E' = ?;
  };
  transition t6 := {
    from   := f0;
    to     := f9;
    guard  := true;
    action := B' = 0, D' = 0, A' = E, E' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
