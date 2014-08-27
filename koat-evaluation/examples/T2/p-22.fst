model main {
  var A, B, C;
  states f5, f1, f300;
  transition t0 := {
    from   := f5;
    to     := f5;
    guard  := A > 0;
    action := A' = -1 + A, C' = ?;
  };
  transition t1 := {
    from   := f5;
    to     := f1;
    guard  := 0 >= A;
    action := B' = C, C' = ?;
  };
  transition t2 := {
    from   := f300;
    to     := f5;
    guard  := A > 0;
    action := A' = -1 + A, C' = ?;
  };
  transition t3 := {
    from   := f300;
    to     := f1;
    guard  := 0 >= A;
    action := B' = C, C' = ?;
  };
}
strategy dumb {
  Region init := { state = f300 };
}
