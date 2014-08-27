model main {
  var A, B, C;
  states f4, f5, f0, f12;
  transition t0 := {
    from   := f4;
    to     := f5;
    guard  := 0 > A;
    action := C' = ?;
  };
  transition t1 := {
    from   := f4;
    to     := f5;
    guard  := A > 0;
    action := C' = ?;
  };
  transition t2 := {
    from   := f0;
    to     := f4;
    guard  := true;
    action := B' = 0, A' = C, C' = ?;
  };
  transition t3 := {
    from   := f5;
    to     := f4;
    guard  := 3 >= B;
    action := B' = B + 1, A' = C, C' = ?;
  };
  transition t4 := {
    from   := f5;
    to     := f4;
    guard  := B > 4;
    action := B' = B + 1, A' = C, C' = ?;
  };
  transition t5 := {
    from   := f5;
    to     := f4;
    guard  := B = 4;
    action := B' = 1, A' = C, C' = ?;
  };
  transition t6 := {
    from   := f4;
    to     := f12;
    guard  := A = 0;
    action := A' = 0, C' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
