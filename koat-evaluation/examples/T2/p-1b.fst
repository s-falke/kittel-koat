model main {
  var A, B, C, D;
  states f300, f1, f2;
  transition t0 := {
    from   := f300;
    to     := f300;
    guard  := B > A;
    action := A' = 1 + A, D' = ?;
  };
  transition t1 := {
    from   := f300;
    to     := f1;
    guard  := A >= B;
    action := C' = D, D' = ?;
  };
  transition t2 := {
    from   := f2;
    to     := f300;
    guard  := true;
    action := D' = ?;
  };
}
strategy dumb {
  Region init := { state = f2 };
}
