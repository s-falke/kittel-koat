model main {
  var A, B;
  states eval, start;
  transition t0 := {
    from   := eval;
    to     := eval;
    guard  := 2*B >= 0 && A = 1 + 2*B;
    action := A' = -2 + 2*B, B' = ?;
  };
  transition t1 := {
    from   := start;
    to     := eval;
    guard  := true;
    action := B' = ?;
  };
}
strategy dumb {
  Region init := { state = start };
}
