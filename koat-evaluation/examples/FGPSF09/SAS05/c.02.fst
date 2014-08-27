model main {
  var A, B;
  states eval1, eval2, start;
  transition t0 := {
    from   := eval1;
    to     := eval2;
    guard  := A >= 0;
    action := A' = A + 1, B' = 1;
  };
  transition t1 := {
    from   := eval2;
    to     := eval2;
    guard  := A >= 0 && B > 0 && A >= B;
    action := B' = B + 1;
  };
  transition t2 := {
    from   := eval2;
    to     := eval1;
    guard  := A >= 0 && B > 0 && B > A;
    action := A' = A - 2;
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
