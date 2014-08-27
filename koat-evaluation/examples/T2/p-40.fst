model main {
  var A, B, C, D, E;
  states f1, f3, f2;
  transition t0 := {
    from   := f1;
    to     := f3;
    guard  := A > 499;
    action := B' = D, D' = ?, E' = ?;
  };
  transition t1 := {
    from   := f1;
    to     := f1;
    guard  := 499 >= A;
    action := A' = 1 + A, D' = ?, E' = ?;
  };
  transition t2 := {
    from   := f2;
    to     := f3;
    guard  := E > 499;
    action := B' = D, A' = E, C' = E, D' = ?, E' = ?;
  };
  transition t3 := {
    from   := f2;
    to     := f1;
    guard  := 499 >= D;
    action := A' = 1 + D, C' = D, D' = ?, E' = ?;
  };
}
strategy dumb {
  Region init := { state = f2 };
}
