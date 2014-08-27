model main {
  var A, B, C, D, E;
  states f2, f300, f1;
  transition t0 := {
    from   := f2;
    to     := f300;
    guard  := true;
    action := E' = ?;
  };
  transition t1 := {
    from   := f300;
    to     := f300;
    guard  := E > 0 && B > A;
    action := C' = E, A' = 1 + A, E' = ?;
  };
  transition t2 := {
    from   := f300;
    to     := f300;
    guard  := 0 > E && B > A;
    action := C' = E, A' = 1 + A, E' = ?;
  };
  transition t3 := {
    from   := f300;
    to     := f300;
    guard  := B > A;
    action := C' = 0, E' = ?;
  };
  transition t4 := {
    from   := f300;
    to     := f1;
    guard  := A >= B;
    action := D' = E, E' = ?;
  };
}
strategy dumb {
  Region init := { state = f2 };
}
