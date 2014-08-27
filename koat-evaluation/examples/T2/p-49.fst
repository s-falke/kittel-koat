model main {
  var A, B, C;
  states f300, f1, f2;
  transition t0 := {
    from   := f300;
    to     := f1;
    guard  := 0 > A;
    action := B' = C, C' = ?;
  };
  transition t1 := {
    from   := f300;
    to     := f300;
    guard  := A >= 0;
    action := A' = -1 + A, C' = ?;
  };
  transition t2 := {
    from   := f2;
    to     := f300;
    guard  := true;
    action := C' = ?;
  };
}
strategy dumb {
  Region init := { state = f2 };
}
