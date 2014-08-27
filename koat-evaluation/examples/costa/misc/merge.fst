model main {
  var A, B;
  states merge, start;
  transition t0 := {
    from   := merge;
    to     := merge;
    guard  := A > 0 && B > 0;
    action := A' = A - 1;
  };
  transition t1 := {
    from   := merge;
    to     := merge;
    guard  := A > 0 && B > 0;
    action := B' = B - 1;
  };
  transition t2 := {
    from   := start;
    to     := merge;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = start };
}
