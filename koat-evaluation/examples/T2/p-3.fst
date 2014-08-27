model main {
  var A, B, C, D;
  states f2, f1, f300;
  transition t0 := {
    from   := f2;
    to     := f1;
    guard  := true;
    action := D' = ?;
  };
  transition t1 := {
    from   := f1;
    to     := f1;
    guard  := B > A;
    action := A' = 1 + A, D' = ?;
  };
  transition t2 := {
    from   := f1;
    to     := f1;
    guard  := B >= D && A = B;
    action := A' = 1 + A, B' = A, D' = ?;
  };
  transition t3 := {
    from   := f1;
    to     := f300;
    guard  := A >= B && A > B;
    action := C' = D, D' = ?;
  };
  transition t4 := {
    from   := f1;
    to     := f300;
    guard  := A >= B && B > A;
    action := C' = D, D' = ?;
  };
}
strategy dumb {
  Region init := { state = f2 };
}
