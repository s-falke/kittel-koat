model main {
  var A, B, C, D;
  states eval, start;
  transition t0 := {
    from   := eval;
    to     := eval;
    guard  := A > B && C >= 0 && D > 0;
    action := A' = A - C, B' = B + D, C' = ?, D' = ?;
  };
  transition t1 := {
    from   := start;
    to     := eval;
    guard  := true;
    action := C' = ?, D' = ?;
  };
}
strategy dumb {
  Region init := { state = start };
}
