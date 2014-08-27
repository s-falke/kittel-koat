model main {
  var A, B, C;
  states f3, f0;
  transition t0 := {
    from   := f3;
    to     := f0;
    guard  := true;
    action := A' = 2, C' = ?;
  };
  transition t1 := {
    from   := f0;
    to     := f0;
    guard  := C > 0;
    action := A' = A + 1, B' = C, C' = ?;
  };
  transition t2 := {
    from   := f0;
    to     := f0;
    guard  := 0 >= C;
    action := A' = A - 1, B' = C, C' = ?;
  };
}
strategy dumb {
  Region init := { state = f3 };
}
