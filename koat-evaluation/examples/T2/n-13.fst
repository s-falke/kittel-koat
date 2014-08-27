model main {
  var A, B, C;
  states f3, f1, f300;
  transition t0 := {
    from   := f3;
    to     := f1;
    guard  := true;
    action := C' = ?;
  };
  transition t1 := {
    from   := f1;
    to     := f1;
    guard  := A >= 0;
    action := A' = 1 + A, C' = ?;
  };
  transition t2 := {
    from   := f1;
    to     := f300;
    guard  := 0 > A;
    action := B' = C, C' = ?;
  };
}
strategy dumb {
  Region init := { state = f3 };
}
