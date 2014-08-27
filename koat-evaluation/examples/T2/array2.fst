model main {
  var A, B, C;
  states f0, f6, f14;
  transition t0 := {
    from   := f0;
    to     := f6;
    guard  := true;
    action := A' = 0, B' = C, C' = ?;
  };
  transition t1 := {
    from   := f6;
    to     := f6;
    guard  := 49 >= A;
    action := A' = A + 1, C' = ?;
  };
  transition t2 := {
    from   := f6;
    to     := f14;
    guard  := A > 49;
    action := C' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
