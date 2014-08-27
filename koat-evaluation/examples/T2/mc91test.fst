model main {
  var A, B, C, D, E, F;
  states f0, f1, f2;
  transition t0 := {
    from   := f0;
    to     := f1;
    guard  := true;
    action := A' = F, B' = 1, C' = 0, F' = ?;
  };
  transition t1 := {
    from   := f1;
    to     := f1;
    guard  := B > 0 && A > 100;
    action := A' = A - 10, B' = B - 1, F' = ?;
  };
  transition t2 := {
    from   := f1;
    to     := f1;
    guard  := B > 0 && 100 >= A;
    action := A' = A + 11, B' = B + 1, F' = ?;
  };
  transition t3 := {
    from   := f1;
    to     := f1;
    guard  := A > 100 && 0 >= C && B > 0;
    action := A' = A - 10, B' = B - 1, C' = 1, D' = A, E' = B, F' = ?;
  };
  transition t4 := {
    from   := f1;
    to     := f1;
    guard  := 100 >= A && 0 >= C && B > 0;
    action := A' = A + 11, B' = B + 1, C' = 1, D' = A, E' = B, F' = ?;
  };
  transition t5 := {
    from   := f1;
    to     := f2;
    guard  := D >= A && C > 0 && B >= E;
    action := F' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
