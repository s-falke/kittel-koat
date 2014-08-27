model main {
  var A, B, C;
  states zip3, group3, start;
  transition t0 := {
    from   := zip3;
    to     := zip3;
    guard  := A > 0 && B > 0 && C > 0;
    action := A' = A - 1, B' = B - 1, C' = C - 1;
  };
  transition t1 := {
    from   := group3;
    to     := group3;
    guard  := A > 3;
    action := A' = A - 3;
  };
  transition t2 := {
    from   := start;
    to     := zip3;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = start };
}
