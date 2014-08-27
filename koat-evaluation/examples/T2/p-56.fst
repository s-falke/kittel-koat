model main {
  var A, B, C, D, E, F;
  states f2, f1, f300;
  transition t0 := {
    from   := f2;
    to     := f1;
    guard  := 1 >= A;
    action := B' = F, F' = ?;
  };
  transition t1 := {
    from   := f2;
    to     := f300;
    guard  := A > 1 && C > 1;
    action := F' = ?;
  };
  transition t2 := {
    from   := f300;
    to     := f1;
    guard  := D + 1 >= 0;
    action := B' = F, F' = ?;
  };
  transition t3 := {
    from   := f300;
    to     := f300;
    guard  := E >= 0 && 0 > 1 + D;
    action := D' = 1 + D, E' = 1 + E, F' = ?;
  };
  transition t4 := {
    from   := f300;
    to     := f300;
    guard  := 0 > 1 + E && 0 > 1 + D;
    action := D' = 1 + D, E' = 1 + E, F' = ?;
  };
}
strategy dumb {
  Region init := { state = f2 };
}
