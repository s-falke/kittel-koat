model main {
  var A;
  states f, start;
  transition t0 := {
    from   := f;
    to     := f;
    guard  := 0 > A*A;
    action := ;
  };
  transition t1 := {
    from   := start;
    to     := f;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = start };
}
