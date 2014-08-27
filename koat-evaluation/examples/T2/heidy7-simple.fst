model main {
  var A, B, C, D;
  states f0, f1, f4;
  transition t0 := {
    from   := f0;
    to     := f1;
    guard  := true;
    action := A' = 0, D' = ?;
  };
  transition t1 := {
    from   := f1;
    to     := f1;
    guard  := B > 0;
    action := C' = D, B' = B - 1, D' = ?;
  };
  transition t2 := {
    from   := f1;
    to     := f4;
    guard  := 0 >= B;
    action := C' = D, D' = ?;
  };
  transition t3 := {
    from   := f4;
    to     := f4;
    guard  := true;
    action := A' = 1, C' = D, D' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
