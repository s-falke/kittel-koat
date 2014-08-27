model main {
  var A, B, C;
  states eval, start;
  transition t0 := {
    from   := eval;
    to     := eval;
    guard  := A >= B && C > 0;
    action := B' = B + C;
  };
  transition t1 := {
    from   := start;
    to     := eval;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = start };
}
