model main {
  var A, B, C;
  states f2, f1, f300;
  transition t0 := {
    from   := f2;
    to     := f1;
    guard  := 0 >= A;
    action := A' = -1 + A, B' = C, C' = ?;
  };
  transition t1 := {
    from   := f2;
    to     := f2;
    guard  := A > 0;
    action := A' = -1 + A, C' = ?;
  };
  transition t2 := {
    from   := f300;
    to     := f2;
    guard  := true;
    action := C' = ?;
  };
}
strategy dumb {
  Region init := { state = f300 };
}
