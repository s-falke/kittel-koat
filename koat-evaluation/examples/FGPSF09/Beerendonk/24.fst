model main {
  var A, B;
  states eval1, eval2, eval3, start;
  transition t0 := {
    from   := eval1;
    to     := eval2;
    guard  := A > 0 && B > 0 && A > B;
    action := ;
  };
  transition t1 := {
    from   := eval1;
    to     := eval3;
    guard  := A > 0 && B > 0 && B >= A;
    action := ;
  };
  transition t2 := {
    from   := eval2;
    to     := eval2;
    guard  := A > 0;
    action := A' = A - 1;
  };
  transition t3 := {
    from   := eval2;
    to     := eval1;
    guard  := 0 >= A;
    action := ;
  };
  transition t4 := {
    from   := eval3;
    to     := eval3;
    guard  := B > 0;
    action := B' = B - 1;
  };
  transition t5 := {
    from   := eval3;
    to     := eval1;
    guard  := 0 >= B;
    action := ;
  };
  transition t6 := {
    from   := start;
    to     := eval1;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = start };
}
