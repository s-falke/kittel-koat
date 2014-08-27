model main {
  var A, B, C, D;
  states f2, f300, f1;
  transition t0 := {
    from   := f2;
    to     := f2;
    guard  := 1 >= A;
    action := A' = 1 + A, B' = 1 + B, D' = ?;
  };
  transition t1 := {
    from   := f2;
    to     := f2;
    guard  := 2 >= B && A > 1;
    action := A' = 1 + A, B' = 1 + B, D' = ?;
  };
  transition t2 := {
    from   := f2;
    to     := f300;
    guard  := B > 2 && A > 1;
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
