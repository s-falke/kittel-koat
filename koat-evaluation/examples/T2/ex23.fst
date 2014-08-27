model main {
  var A, B, C, D;
  states f0, f5, f7;
  transition t0 := {
    from   := f0;
    to     := f5;
    guard  := A > 127;
    action := B' = 0, D' = ?;
  };
  transition t1 := {
    from   := f0;
    to     := f7;
    guard  := 127 >= A;
    action := B' = 0, C' = D, D' = ?;
  };
  transition t2 := {
    from   := f7;
    to     := f7;
    guard  := 35 >= B;
    action := B' = B + 1, C' = C + 1, D' = ?;
  };
  transition t3 := {
    from   := f7;
    to     := f5;
    guard  := B > 35;
    action := D' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
