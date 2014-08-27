model main {
  var A, B, C, D, E;
  states f2, f1, f300;
  transition t0 := {
    from   := f2;
    to     := f2;
    guard  := D > 0 && A > 1;
    action := B' = D, A' = -1 + A, D' = ?, E' = ?;
  };
  transition t1 := {
    from   := f2;
    to     := f2;
    guard  := 0 > D && A > 1;
    action := B' = D, A' = -1 + A, D' = ?, E' = ?;
  };
  transition t2 := {
    from   := f2;
    to     := f1;
    guard  := D > 0 && 1 >= A;
    action := B' = D, A' = -1 + A, C' = E, D' = ?, E' = ?;
  };
  transition t3 := {
    from   := f2;
    to     := f1;
    guard  := 0 > D && 1 >= A;
    action := B' = D, A' = -1 + A, C' = E, D' = ?, E' = ?;
  };
  transition t4 := {
    from   := f2;
    to     := f2;
    guard  := A > 0;
    action := B' = 0, D' = ?, E' = ?;
  };
  transition t5 := {
    from   := f2;
    to     := f1;
    guard  := 0 >= A;
    action := B' = 0, C' = D, D' = ?, E' = ?;
  };
  transition t6 := {
    from   := f300;
    to     := f2;
    guard  := true;
    action := D' = ?, E' = ?;
  };
}
strategy dumb {
  Region init := { state = f300 };
}
