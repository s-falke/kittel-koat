model main {
  var A, B, C, D;
  states f300, f1, f2;
  transition t0 := {
    from   := f300;
    to     := f300;
    guard  := 0 > A && B + 1 = 0;
    action := B' = 0, A' = -99 + A, D' = ?;
  };
  transition t1 := {
    from   := f300;
    to     := f300;
    guard  := 0 > A && B >= 0;
    action := B' = 1 + B, A' = 1 + A, D' = ?;
  };
  transition t2 := {
    from   := f300;
    to     := f300;
    guard  := 0 > A && 0 > 1 + B;
    action := B' = 1 + B, A' = 1 + A, D' = ?;
  };
  transition t3 := {
    from   := f300;
    to     := f1;
    guard  := A >= 0;
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
