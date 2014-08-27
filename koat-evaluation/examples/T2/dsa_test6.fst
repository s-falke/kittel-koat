model main {
  var A, B, C;
  states f0, f6, f15;
  transition t0 := {
    from   := f0;
    to     := f6;
    guard  := true;
    action := A' = C, B' = 0, C' = ?;
  };
  transition t1 := {
    from   := f6;
    to     := f6;
    guard  := 9 >= B;
    action := B' = B + 1, C' = ?;
  };
  transition t2 := {
    from   := f6;
    to     := f15;
    guard  := B > 9;
    action := C' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
