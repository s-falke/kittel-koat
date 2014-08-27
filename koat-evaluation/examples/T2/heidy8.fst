model main {
  var A, B, C, D, E, F;
  states f0, f3, f6;
  transition t0 := {
    from   := f0;
    to     := f3;
    guard  := true;
    action := A' = 0, B' = 0, F' = ?;
  };
  transition t1 := {
    from   := f3;
    to     := f3;
    guard  := C > 0 && F > 0;
    action := D' = F, C' = C - 1, F' = ?;
  };
  transition t2 := {
    from   := f3;
    to     := f3;
    guard  := C > 0 && 0 >= F;
    action := D' = F, C' = C - 2, F' = ?;
  };
  transition t3 := {
    from   := f3;
    to     := f6;
    guard  := 0 >= C;
    action := E' = F, F' = ?;
  };
  transition t4 := {
    from   := f6;
    to     := f6;
    guard  := E > 0;
    action := A' = 1, E' = F, F' = ?;
  };
  transition t5 := {
    from   := f6;
    to     := f6;
    guard  := 0 >= E;
    action := A' = 0, E' = F, F' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
