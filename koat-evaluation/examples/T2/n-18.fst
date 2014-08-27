model main {
  var A, B, C;
  states f3, f2, f300;
  transition t0 := {
    from   := f3;
    to     := f2;
    guard  := true;
    action := C' = ?;
  };
  transition t1 := {
    from   := f2;
    to     := f2;
    guard  := 1 >= A;
    action := A' = -1 + A, C' = ?;
  };
  transition t2 := {
    from   := f2;
    to     := f300;
    guard  := A > 1;
    action := A' = -1 + A, B' = C, C' = ?;
  };
}
strategy dumb {
  Region init := { state = f3 };
}
