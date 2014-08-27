model main {
  var A, B;
  states f, start;
  transition t0 := {
    from   := f;
    to     := f;
    guard  := A > B;
    action := A' = A + 1, B' = B + 2;
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
