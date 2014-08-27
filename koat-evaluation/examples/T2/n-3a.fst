model main {
  var A, B, C, D, E, F;
  states f2, f1, f300;
  transition t0 := {
    from   := f2;
    to     := f1;
    guard  := true;
    action := E' = ?, F' = ?;
  };
  transition t1 := {
    from   := f1;
    to     := f1;
    guard  := E > 0 && B > A;
    action := C' = E, A' = 1 + A, E' = ?, F' = ?;
  };
  transition t2 := {
    from   := f1;
    to     := f1;
    guard  := 0 > E && B > A;
    action := C' = E, A' = 1 + A, E' = ?, F' = ?;
  };
  transition t3 := {
    from   := f1;
    to     := f1;
    guard  := B > A;
    action := C' = 0, E' = ?, F' = ?;
  };
  transition t4 := {
    from   := f1;
    to     := f1;
    guard  := E > 0 && B >= F && A = B;
    action := C' = E, A' = 1 + A, B' = A, E' = ?, F' = ?;
  };
  transition t5 := {
    from   := f1;
    to     := f1;
    guard  := 0 > E && B >= F && A = B;
    action := C' = E, A' = 1 + A, B' = A, E' = ?, F' = ?;
  };
  transition t6 := {
    from   := f1;
    to     := f1;
    guard  := B >= E && A = B;
    action := C' = 0, B' = A, E' = ?, F' = ?;
  };
  transition t7 := {
    from   := f1;
    to     := f300;
    guard  := A >= B && A > B;
    action := D' = E, E' = ?, F' = ?;
  };
  transition t8 := {
    from   := f1;
    to     := f300;
    guard  := A >= B && B > A;
    action := D' = E, E' = ?, F' = ?;
  };
}
strategy dumb {
  Region init := { state = f2 };
}
