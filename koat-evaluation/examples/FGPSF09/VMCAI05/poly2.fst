model main {
  var A, B, C;
  states eval, start;
  transition t0 := {
    from   := eval;
    to     := eval;
    guard  := A >= 0;
    action := A' = A + B, C' = C + 1, B' = B - 2;
  };
  transition t1 := {
    from   := eval;
    to     := eval;
    guard  := A >= 0;
    action := A' = A + C, C' = C - 2;
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
