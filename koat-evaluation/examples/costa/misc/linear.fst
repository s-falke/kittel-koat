model main {
  var A;
  states start, a;
  transition t0 := {
    from   := start;
    to     := a;
    guard  := A > 0;
    action := ;
  };
  transition t1 := {
    from   := start;
    to     := a;
    guard  := A = 100;
    action := A' = 100;
  };
  transition t2 := {
    from   := a;
    to     := a;
    guard  := A > 0;
    action := A' = A - 1;
  };
}
strategy dumb {
  Region init := { state = start };
}
