model main {
  var A, B, C, D, E;
  states eval, start;
  transition t0 := {
    from   := eval;
    to     := eval;
    guard  := A > B && C > D;
    action := E' = E + 1, B' = B + 1;
  };
  transition t1 := {
    from   := eval;
    to     := eval;
    guard  := A > B && C > D;
    action := E' = E + 1, D' = D + 1;
  };
  transition t2 := {
    from   := eval;
    to     := eval;
    guard  := B >= A && C > D;
    action := E' = E + 1, D' = D + 1;
  };
  transition t3 := {
    from   := eval;
    to     := eval;
    guard  := A > B && D >= C;
    action := E' = E + 1, B' = B + 1;
  };
  transition t4 := {
    from   := start;
    to     := eval;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = start };
}
