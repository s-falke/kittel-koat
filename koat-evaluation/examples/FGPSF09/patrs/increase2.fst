model main {
  var A, B, C;
  states f, start;
  transition t0 := {
    from   := f;
    to     := f;
    guard  := A > B + C;
    action := B' = B + 1;
  };
  transition t1 := {
    from   := f;
    to     := f;
    guard  := A > B + C;
    action := C' = C + 1;
  };
  transition t2 := {
    from   := start;
    to     := f;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = start };
}
