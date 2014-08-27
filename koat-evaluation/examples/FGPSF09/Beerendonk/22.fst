model main {
  var A, B;
  states eval1, eval2, start;
  transition t0 := {
    from   := eval1;
    to     := eval2;
    guard  := A > 0;
    action := ;
  };
  transition t1 := {
    from   := eval2;
    to     := eval2;
    guard  := A > 0 && B > 0;
    action := B' = B - 1;
  };
  transition t2 := {
    from   := eval2;
    to     := eval1;
    guard  := A > 0 && 0 >= B;
    action := A' = A - 1;
  };
  transition t3 := {
    from   := start;
    to     := eval1;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = start };
}
