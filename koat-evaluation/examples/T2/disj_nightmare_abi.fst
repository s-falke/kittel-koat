model main {
  var A, B;
  states f0, start;
  transition t0 := {
    from   := f0;
    to     := f0;
    guard  := 0 > A && B = 0;
    action := B' = A;
  };
  transition t1 := {
    from   := f0;
    to     := f0;
    guard  := A > 0 && B = 0;
    action := B' = A;
  };
  transition t2 := {
    from   := start;
    to     := f0;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = start };
}
