model main {
  var A, B, C;
  states eval, start;
  transition t0 := {
    from   := eval;
    to     := eval;
    guard  := A >= 0;
    action := A' = A - 1, B' = C, C' = ?;
  };
  transition t1 := {
    from   := eval;
    to     := eval;
    guard  := B >= 0;
    action := B' = B - 1, C' = ?;
  };
  transition t2 := {
    from   := start;
    to     := eval;
    guard  := true;
    action := C' = ?;
  };
}
strategy dumb {
  Region init := { state = start };
}
