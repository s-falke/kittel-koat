model main {
  var A, B, C;
  states f2, f3;
  transition t0 := {
    from   := f2;
    to     := f3;
    guard  := A >= 0;
    action := B' = C, A' = -1 + A, C' = ?;
  };
  transition t1 := {
    from   := f2;
    to     := f3;
    guard  := 0 > A;
    action := B' = C, C' = ?;
  };
}
strategy dumb {
  Region init := { state = f2 };
}
