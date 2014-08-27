model main {
  var A, B, C;
  states ack, start;
  transition t0 := {
    from   := ack;
    to     := ack;
    guard  := A > 0 && B > 0;
    action := A' = A - 1, B' = C, C' = ?;
  };
  transition t1 := {
    from   := ack;
    to     := ack;
    guard  := A > 0 && B > 0;
    action := B' = B - 1, C' = ?;
  };
  transition t2 := {
    from   := start;
    to     := ack;
    guard  := true;
    action := C' = ?;
  };
}
strategy dumb {
  Region init := { state = start };
}
