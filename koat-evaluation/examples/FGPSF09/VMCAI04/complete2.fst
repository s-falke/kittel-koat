model main {
  var A, B;
  states eval, start;
  transition t0 := {
    from   := eval;
    to     := eval;
    guard  := A >= 0 && B + 2*A > 9 && 10 >= 2*A + B;
    action := A' = B, B' = ?;
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
