model main {
  var A, B, C;
  states eval, start;
  transition t0 := {
    from   := eval;
    to     := eval;
    guard  := A + B > C && C >= 0 && A > 0;
    action := A' = A - 1;
  };
  transition t1 := {
    from   := eval;
    to     := eval;
    guard  := A + B > C && C >= 0 && 0 >= A && B > 0;
    action := B' = B - 1;
  };
  transition t2 := {
    from   := eval;
    to     := eval;
    guard  := A + B > C && C >= 0 && 0 >= A && 0 >= B;
    action := ;
  };
  transition t3 := {
    from   := start;
    to     := eval;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = start };
}
