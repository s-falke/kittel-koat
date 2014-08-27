model main {
  var A, B, C, D, E, F;
  states eval, start;
  transition t0 := {
    from   := eval;
    to     := eval;
    guard  := 2*B >= 0 && 0 >= 2*B && A = 1;
    action := A' = 0, B' = ?, C' = ?, D' = ?, E' = ?, F' = ?;
  };
  transition t1 := {
    from   := eval;
    to     := eval;
    guard  := 2*B >= 0 && 2 + 2*B >= 0 && A = 1 + 2*B;
    action := A' = 2*B, B' = ?, C' = ?, D' = ?, E' = ?, F' = ?;
  };
  transition t2 := {
    from   := eval;
    to     := eval;
    guard  := 1 >= 2*C && 2*C >= 0 && 2*D > 0 && 1 >= 2*D && 1 >= 2*E && 3*E > 1 && B >= E && 1 >= 2*F && 3*F > 1 && F >= B && A = 1;
    action := A' = B, B' = ?, C' = ?, D' = ?, E' = ?, F' = ?;
  };
  transition t3 := {
    from   := eval;
    to     := eval;
    guard  := 2*D > 0 && 1 + 2*D >= 0 && 2*D >= 2*C && 1 + 2*C >= 2*D && 2*D >= 2*E && 3*E > 2*D && B >= E && 2*D >= 2*F && 3*F > 2*D && F >= B && A = 2*D;
    action := A' = B, B' = ?, C' = ?, D' = ?, E' = ?, F' = ?;
  };
  transition t4 := {
    from   := start;
    to     := eval;
    guard  := true;
    action := B' = ?, C' = ?, D' = ?, E' = ?, F' = ?;
  };
}
strategy dumb {
  Region init := { state = start };
}
