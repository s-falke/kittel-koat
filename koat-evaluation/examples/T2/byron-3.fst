model main {
  var A, B, C, D;
  states f0, f2, f1;
  transition t0 := {
    from   := f0;
    to     := f2;
    guard  := 0 >= A;
    action := B' = D, D' = ?;
  };
  transition t1 := {
    from   := f0;
    to     := f0;
    guard  := A > 0;
    action := A' = A + C, C' = -1 + C, D' = ?;
  };
  transition t2 := {
    from   := f1;
    to     := f0;
    guard  := true;
    action := D' = ?;
  };
}
strategy dumb {
  Region init := { state = f1 };
}
