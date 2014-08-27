model main {
  var A, B, C;
  states f0, f1;
  transition t0 := {
    from   := f0;
    to     := f1;
    guard  := true;
    action := A' = C, B' = 1, C' = ?;
  };
  transition t1 := {
    from   := f1;
    to     := f1;
    guard  := B > 0 && A > 100;
    action := A' = A - 10, B' = B - 1, C' = ?;
  };
  transition t2 := {
    from   := f1;
    to     := f1;
    guard  := B > 0 && 100 >= A;
    action := A' = A + 11, B' = B + 1, C' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
