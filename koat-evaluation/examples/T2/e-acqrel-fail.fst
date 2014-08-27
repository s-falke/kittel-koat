model main {
  var A, B, C, D, E;
  states f9, f15, f23, f25, f28, f0;
  transition t0 := {
    from   := f9;
    to     := f15;
    guard  := 0 >= A && E > 0;
    action := B' = 0, C' = E, E' = ?;
  };
  transition t1 := {
    from   := f15;
    to     := f15;
    guard  := C > 0;
    action := E' = ?;
  };
  transition t2 := {
    from   := f23;
    to     := f23;
    guard  := true;
    action := E' = ?;
  };
  transition t3 := {
    from   := f25;
    to     := f28;
    guard  := true;
    action := E' = ?;
  };
  transition t4 := {
    from   := f15;
    to     := f9;
    guard  := 0 >= C;
    action := D' = 0, A' = E, E' = ?;
  };
  transition t5 := {
    from   := f9;
    to     := f23;
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
