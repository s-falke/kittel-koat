model main {
  var A, B;
  states f0, f5, f12;
  transition t0 := {
    from   := f0;
    to     := f5;
    guard  := B > 0;
    action := A' = B, B' = ?;
  };
  transition t1 := {
    from   := f5;
    to     := f5;
    guard  := 19 >= A;
    action := A' = A + 1, B' = ?;
  };
  transition t2 := {
    from   := f0;
    to     := f12;
    guard  := 0 >= B;
    action := A' = B, B' = ?;
  };
  transition t3 := {
    from   := f5;
    to     := f12;
    guard  := A > 19;
    action := B' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
