model main {
  var A, B, C, D;
  states f2, f3, f4;
  transition t0 := {
    from   := f2;
    to     := f2;
    guard  := A > 0;
    action := A' = -B + A, B' = 1 + B, D' = ?;
  };
  transition t1 := {
    from   := f3;
    to     := f2;
    guard  := B > 0;
    action := D' = ?;
  };
  transition t2 := {
    from   := f2;
    to     := f4;
    guard  := 0 >= A;
    action := C' = D, D' = ?;
  };
  transition t3 := {
    from   := f3;
    to     := f4;
    guard  := 0 >= B;
    action := C' = D, D' = ?;
  };
}
strategy dumb {
  Region init := { state = f3 };
}
