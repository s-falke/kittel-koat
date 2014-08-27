model main {
  var A, B, C;
  states f0, f1;
  transition t0 := {
    from   := f0;
    to     := f1;
    guard  := true;
    action := C' = ?;
  };
  transition t1 := {
    from   := f1;
    to     := f1;
    guard  := true;
    action := A' = C + 1, B' = C + 1, C' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
