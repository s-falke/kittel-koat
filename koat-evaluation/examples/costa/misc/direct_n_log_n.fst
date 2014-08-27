model main {
  var A, B;
  states start, a;
  transition t0 := {
    from   := start;
    to     := a;
    guard  := A > 0;
    action := B' = ?;
  };
  transition t1 := {
    from   := start;
    to     := a;
    guard  := A > 1;
    action := B' = ?;
  };
  transition t2 := {
    from   := start;
    to     := a;
    guard  := A > 3;
    action := B' = ?;
  };
  transition t3 := {
    from   := a;
    to     := a;
    guard  := 2*B > 1 && A = 2*B;
    action := A' = B, B' = ?;
  };
  transition t4 := {
    from   := a;
    to     := a;
    guard  := 2*B > 0 && A = 2*B + 1;
    action := A' = B, B' = ?;
  };
}
strategy dumb {
  Region init := { state = start };
}
