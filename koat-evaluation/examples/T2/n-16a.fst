model main {
  var A, B, C, D;
  states f2, f1, f300;
  transition t0 := {
    from   := f2;
    to     := f1;
    guard  := 0 > A + B;
    action := A' = A + B, C' = D, D' = ?;
  };
  transition t1 := {
    from   := f2;
    to     := f2;
    guard  := A + B >= 0;
    action := A' = A + B, D' = ?;
  };
  transition t2 := {
    from   := f300;
    to     := f2;
    guard  := true;
    action := D' = ?;
  };
}
strategy dumb {
  Region init := { state = f300 };
}
