model main {
  var A, B, C;
  states eval, start;
  transition t0 := {
    from   := eval;
    to     := eval;
    guard  := A >= B;
    action := A' = A + 1, B' = B + A;
  };
  transition t1 := {
    from   := eval;
    to     := eval;
    guard  := A >= B;
    action := A' = A - C, B' = B + C*C, C' = C - 1;
  };
  transition t2 := {
    from   := start;
    to     := eval;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = start };
}
