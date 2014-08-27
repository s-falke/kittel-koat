model main {
  var A, B;
  states eval, start;
  transition t0 := {
    from   := eval;
    to     := eval;
    guard  := A > 0 && B > 0;
    action := A' = A - 1, B' = A;
  };
  transition t1 := {
    from   := eval;
    to     := eval;
    guard  := A > 0 && B > 0;
    action := A' = B - 2, B' = A + 1;
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
