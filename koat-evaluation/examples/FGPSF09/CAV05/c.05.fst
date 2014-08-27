model main {
  var A, B;
  states eval, start;
  transition t0 := {
    from   := eval;
    to     := eval;
    guard  := A > B && A > 0 && B > 0;
    action := A' = A - B;
  };
  transition t1 := {
    from   := eval;
    to     := eval;
    guard  := B > A && A > 0 && B > 0 && A > B;
    action := A' = A - B;
  };
  transition t2 := {
    from   := eval;
    to     := eval;
    guard  := A > B && A > 0 && B > 0 && B >= A;
    action := B' = B - A;
  };
  transition t3 := {
    from   := eval;
    to     := eval;
    guard  := B > A && A > 0 && B > 0 && B >= A;
    action := B' = B - A;
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
