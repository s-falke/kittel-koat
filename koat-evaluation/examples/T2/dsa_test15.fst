model main {
  var A, B, C, D;
  states f0, f8, f19, f29;
  transition t0 := {
    from   := f0;
    to     := f8;
    guard  := true;
    action := A' = D, B' = 0, D' = ?;
  };
  transition t1 := {
    from   := f8;
    to     := f8;
    guard  := 9 >= B;
    action := B' = B + 1, D' = ?;
  };
  transition t2 := {
    from   := f19;
    to     := f19;
    guard  := 9 >= C;
    action := C' = C + 1, D' = ?;
  };
  transition t3 := {
    from   := f19;
    to     := f29;
    guard  := C > 9;
    action := D' = ?;
  };
  transition t4 := {
    from   := f8;
    to     := f19;
    guard  := B > 9;
    action := C' = 0, D' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
