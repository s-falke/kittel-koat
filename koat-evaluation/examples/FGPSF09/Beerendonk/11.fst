model main {
  var A, B;
  states eval, start;
  transition t0 := {
    from   := eval;
    to     := eval;
    guard  := 0 >= A && B = 1;
    action := B' = A;
  };
  transition t1 := {
    from   := eval;
    to     := eval;
    guard  := B > 0 && 1 + B >= 0 && B > A;
    action := B' = A;
  };
  transition t2 := {
    from   := eval;
    to     := eval;
    guard  := A > 0 && B = 1;
    action := B' = 0;
  };
  transition t3 := {
    from   := eval;
    to     := eval;
    guard  := B > 0 && 1 + B >= 0 && A >= B;
    action := B' = B - 1;
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
