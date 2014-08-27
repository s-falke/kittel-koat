model main {
  var A, B;
  states eval, start;
  transition t0 := {
    from   := eval;
    to     := eval;
    guard  := A > 0;
    action := A' = A - 1;
  };
  transition t1 := {
    from   := eval;
    to     := eval;
    guard  := B > 0 && A > 0;
    action := A' = A - 1;
  };
  transition t2 := {
    from   := eval;
    to     := eval;
    guard  := A > 0 && 0 >= A && B > 0;
    action := B' = B - 1;
  };
  transition t3 := {
    from   := eval;
    to     := eval;
    guard  := B > 0 && 0 >= A;
    action := B' = B - 1;
  };
  transition t4 := {
    from   := eval;
    to     := eval;
    guard  := A > 0 && 0 >= A && 0 >= B;
    action := ;
  };
  transition t5 := {
    from   := eval;
    to     := eval;
    guard  := B > 0 && 0 >= A && 0 >= B;
    action := ;
  };
  transition t6 := {
    from   := start;
    to     := eval;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = start };
}
