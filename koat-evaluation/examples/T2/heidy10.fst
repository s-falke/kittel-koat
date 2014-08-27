model main {
  var A, B, C;
  states f2, f0;
  transition t0 := {
    from   := f2;
    to     := f2;
    guard  := A > 0;
    action := A' = A - 1, C' = ?;
  };
  transition t1 := {
    from   := f0;
    to     := f2;
    guard  := B > 0;
    action := B' = B - 1, A' = C, C' = ?;
  };
  transition t2 := {
    from   := f2;
    to     := f2;
    guard  := B > 0 && 0 >= A;
    action := B' = B - 1, A' = C, C' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
