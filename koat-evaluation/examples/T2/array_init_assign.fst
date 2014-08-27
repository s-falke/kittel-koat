model main {
  var A, B, C;
  states f0, f4, f10, f18;
  transition t0 := {
    from   := f0;
    to     := f4;
    guard  := true;
    action := A' = 0, C' = ?;
  };
  transition t1 := {
    from   := f4;
    to     := f4;
    guard  := 1 >= A;
    action := A' = A + 1, C' = ?;
  };
  transition t2 := {
    from   := f10;
    to     := f10;
    guard  := 1 >= B;
    action := B' = B + 1, C' = ?;
  };
  transition t3 := {
    from   := f10;
    to     := f18;
    guard  := B > 1 && 0 > C;
    action := C' = ?;
  };
  transition t4 := {
    from   := f10;
    to     := f18;
    guard  := B > 1;
    action := C' = ?;
  };
  transition t5 := {
    from   := f4;
    to     := f10;
    guard  := A > 1;
    action := B' = 0, C' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
