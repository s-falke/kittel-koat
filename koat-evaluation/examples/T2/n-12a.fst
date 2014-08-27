model main {
  var A, B, C;
  states f2, f300, f1;
  transition t0 := {
    from   := f2;
    to     := f2;
    guard  := A >= 0;
    action := C' = ?;
  };
  transition t1 := {
    from   := f300;
    to     := f2;
    guard  := true;
    action := C' = ?;
  };
  transition t2 := {
    from   := f2;
    to     := f1;
    guard  := 0 > A;
    action := B' = C, C' = ?;
  };
}
strategy dumb {
  Region init := { state = f300 };
}
