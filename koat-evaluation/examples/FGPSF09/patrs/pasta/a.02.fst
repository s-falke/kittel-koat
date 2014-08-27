model main {
  var A, B, C, D, E;
  states eval, start;
  transition t0 := {
    from   := eval;
    to     := eval;
    guard  := A >= 0 && B >= 0 && B > A && A + B >= 2*C && 3*C > A + B && D > C && A + B >= 2*E && 3*E > A + B && E + 1 >= D;
    action := A' = D, C' = ?, D' = ?, E' = ?;
  };
  transition t1 := {
    from   := eval;
    to     := eval;
    guard  := A >= 0 && B >= 0 && B > A && A + B >= 2*C && 3*C > A + B && D >= C && A + B >= 2*E && 3*E > A + B && E >= D;
    action := B' = D, C' = ?, D' = ?, E' = ?;
  };
  transition t2 := {
    from   := start;
    to     := eval;
    guard  := true;
    action := C' = ?, D' = ?, E' = ?;
  };
}
strategy dumb {
  Region init := { state = start };
}
