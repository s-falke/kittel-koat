model main {
  var A, B, C, D, E;
  states start, lbl41, stop, start0;
  transition t0 := {
    from   := start;
    to     := lbl41;
    guard  := A = B && C = D;
    action := A' = E, E' = ?;
  };
  transition t1 := {
    from   := lbl41;
    to     := stop;
    guard  := C = D;
    action := C' = A, E' = ?;
  };
  transition t2 := {
    from   := start0;
    to     := start;
    guard  := true;
    action := A' = B, C' = D, E' = ?;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
