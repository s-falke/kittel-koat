model main {
  var A, B;
  states eval, start;
  transition t0 := {
    from   := eval;
    to     := eval;
    guard  := A > B;
    action := A' = A - 1, B' = B + 1;
  };
  transition t1 := {
    from   := start;
    to     := eval;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = start };
}
