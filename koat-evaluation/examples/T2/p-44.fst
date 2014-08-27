model main {
  var A, B, C, D;
  states f300, f1, f2;
  transition t0 := {
    from   := f300;
    to     := f300;
    guard  := A > 0 && B + A > 0 && B > 0;
    action := B' = -2 + A, A' = -1 + A, D' = ?;
  };
  transition t1 := {
    from   := f300;
    to     := f1;
    guard  := A > 0 && 0 >= B + A && B > 0;
    action := C' = D, D' = ?;
  };
  transition t2 := {
    from   := f300;
    to     := f1;
    guard  := B > 0 && 0 >= A;
    action := C' = D, D' = ?;
  };
  transition t3 := {
    from   := f300;
    to     := f1;
    guard  := 0 >= B;
    action := C' = D, D' = ?;
  };
  transition t4 := {
    from   := f2;
    to     := f300;
    guard  := true;
    action := D' = ?;
  };
}
strategy dumb {
  Region init := { state = f2 };
}
