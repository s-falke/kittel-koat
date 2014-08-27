model main {
  var A, B, C;
  states eval, start;
  transition t0 := {
    from   := eval;
    to     := eval;
    guard  := 2*C >= 2*B && 1 + 2*B >= 2*C && 2*C > 0 && A = 2*C;
    action := A' = 2*C - 1, B' = ?, C' = ?;
  };
  transition t1 := {
    from   := start;
    to     := eval;
    guard  := true;
    action := B' = ?, C' = ?;
  };
}
strategy dumb {
  Region init := { state = start };
}
