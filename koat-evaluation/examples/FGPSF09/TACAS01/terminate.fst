model main {
  var A, B, C;
  states eval, start;
  transition t0 := {
    from   := eval;
    to     := eval;
    guard  := 100 >= A && B >= C;
    action := A' = C, C' = A + 1, B' = B - 1;
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
