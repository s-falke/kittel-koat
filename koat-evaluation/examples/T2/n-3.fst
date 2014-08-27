model main {
  var A, B, C, D;
  states f2, f300, f1;
  transition t0 := {
    from   := f2;
    to     := f2;
    guard  := B > A;
    action := A' = 1 + A, D' = ?;
  };
  transition t1 := {
    from   := f2;
    to     := f2;
    guard  := A > B && A >= B;
    action := A' = 1 + A, D' = ?;
  };
  transition t2 := {
    from   := f2;
    to     := f300;
    guard  := A = B;
    action := C' = D, D' = ?;
  };
  transition t3 := {
    from   := f1;
    to     := f2;
    guard  := true;
    action := D' = ?;
  };
}
strategy dumb {
  Region init := { state = f1 };
}
