model main {
  var A, B, C, D;
  states f2, f3, f300;
  transition t0 := {
    from   := f2;
    to     := f2;
    guard  := A + B >= 0;
    action := A' = A + B, D' = ?;
  };
  transition t1 := {
    from   := f3;
    to     := f2;
    guard  := true;
    action := D' = ?;
  };
  transition t2 := {
    from   := f2;
    to     := f300;
    guard  := 0 > A + B;
    action := C' = D, A' = A + B, D' = ?;
  };
}
strategy dumb {
  Region init := { state = f3 };
}
