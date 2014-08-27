model main {
  var A, B;
  states eval, start;
  transition t0 := {
    from   := eval;
    to     := eval;
    guard  := A > 0 && B >= A;
    action := A' = A - 1;
  };
  transition t1 := {
    from   := eval;
    to     := eval;
    guard  := A > 0 && A > B;
    action := A' = B;
  };
  transition t2 := {
    from   := start;
    to     := eval;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = start };
}
