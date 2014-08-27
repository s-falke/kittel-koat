model main {
  var A, B, C, D, E, F;
  states f4, f5, f30, f3;
  transition t0 := {
    from   := f4;
    to     := f5;
    guard  := A > 1;
    action := B' = 1, F' = ?;
  };
  transition t1 := {
    from   := f4;
    to     := f5;
    guard  := 1 >= A;
    action := B' = 0, F' = ?;
  };
  transition t2 := {
    from   := f30;
    to     := f4;
    guard  := true;
    action := C' = 2, A' = 2, D' = F, F' = ?;
  };
  transition t3 := {
    from   := f5;
    to     := f4;
    guard  := 0 >= F && F > 0;
    action := A' = A - 1, D' = F, F' = ?;
  };
  transition t4 := {
    from   := f5;
    to     := f4;
    guard  := F > 0;
    action := A' = A + 1, D' = F, F' = ?;
  };
  transition t5 := {
    from   := f5;
    to     := f3;
    guard  := 0 >= B;
    action := E' = 0, F' = ?;
  };
}
strategy dumb {
  Region init := { state = f30 };
}
