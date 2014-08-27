model main {
  var A, B, C, D;
  states f6, f9, f17, f24, f0;
  transition t0 := {
    from   := f6;
    to     := f9;
    guard  := 0 > A;
    action := B' = D, D' = ?;
  };
  transition t1 := {
    from   := f6;
    to     := f9;
    guard  := A > 0;
    action := B' = D, D' = ?;
  };
  transition t2 := {
    from   := f6;
    to     := f17;
    guard  := A = 0;
    action := A' = 0, D' = ?;
  };
  transition t3 := {
    from   := f17;
    to     := f24;
    guard  := 0 >= C;
    action := D' = ?;
  };
  transition t4 := {
    from   := f17;
    to     := f24;
    guard  := C > 1;
    action := D' = ?;
  };
  transition t5 := {
    from   := f17;
    to     := f24;
    guard  := C = 1;
    action := C' = 0, D' = ?;
  };
  transition t6 := {
    from   := f9;
    to     := f17;
    guard  := B = 0;
    action := C' = 1, B' = 0, D' = ?;
  };
  transition t7 := {
    from   := f9;
    to     := f6;
    guard  := 0 > B;
    action := A' = D, D' = ?;
  };
  transition t8 := {
    from   := f9;
    to     := f6;
    guard  := B > 0;
    action := A' = D, D' = ?;
  };
  transition t9 := {
    from   := f0;
    to     := f6;
    guard  := true;
    action := C' = 0, A' = D, D' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
