model main {
  var A, B, C;
  states f4, f300;
  transition t0 := {
    from   := f4;
    to     := f300;
    guard  := 0 > A;
    action := B' = C, C' = ?;
  };
  transition t1 := {
    from   := f4;
    to     := f300;
    guard  := A >= 0;
    action := A' = 1 + A, B' = C, C' = ?;
  };
}
strategy dumb {
  Region init := { state = f4 };
}
