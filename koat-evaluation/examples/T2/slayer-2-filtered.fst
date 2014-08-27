model main {
  var A, B, C, D, E;
  states f0, f4, f1, f2, f3;
  transition t0 := {
    from   := f0;
    to     := f4;
    guard  := A > 9;
    action := B' = E, E' = ?;
  };
  transition t1 := {
    from   := f0;
    to     := f0;
    guard  := 9 >= A;
    action := A' = 1 + A, C' = A, E' = ?;
  };
  transition t2 := {
    from   := f1;
    to     := f0;
    guard  := 9 >= E && A = 0;
    action := A' = 1, E' = ?;
  };
  transition t3 := {
    from   := f2;
    to     := f0;
    guard  := 9 >= A;
    action := A' = 2, D' = 2, E' = ?;
  };
  transition t4 := {
    from   := f3;
    to     := f0;
    guard  := true;
    action := A' = 0, E' = ?;
  };
}
strategy dumb {
  Region init := { state = f3 };
}
