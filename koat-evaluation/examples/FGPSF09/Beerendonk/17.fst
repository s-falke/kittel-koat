model main {
  var A, B;
  states eval, start;
  transition t0 := {
    from   := eval;
    to     := eval;
    guard  := A + B > 0 && A > B;
    action := A' = A - 1;
  };
  transition t1 := {
    from   := eval;
    to     := eval;
    guard  := 2*A > 0 && B = A;
    action := A' = A - 1;
  };
  transition t2 := {
    from   := eval;
    to     := eval;
    guard  := A + B > 0 && B >= A && B > A;
    action := B' = B - 1;
  };
  transition t3 := {
    from   := eval;
    to     := eval;
    guard  := A + B > 0 && B >= A && A > B;
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
