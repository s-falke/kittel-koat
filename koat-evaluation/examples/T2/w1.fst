model main {
  var A, B, C;
  states f0, f1;
  transition t0 := {
    from   := f0;
    to     := f1;
    guard  := B > 1;
    action := A' = B, B' = ?, C' = ?;
  };
  transition t1 := {
    from   := f1;
    to     := f1;
    guard  := 1 >= B && B + 1 >= 0 && C > 1;
    action := A' = B, B' = ?, C' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
