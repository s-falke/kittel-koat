model main {
  var A, B, C;
  states f9, f10, f25, f2, f27, f29, f19, f0;
  transition t0 := {
    from   := f9;
    to     := f10;
    guard  := 5 >= A;
    action := C' = ?;
  };
  transition t1 := {
    from   := f25;
    to     := f2;
    guard  := true;
    action := C' = ?;
  };
  transition t2 := {
    from   := f2;
    to     := f2;
    guard  := true;
    action := C' = ?;
  };
  transition t3 := {
    from   := f9;
    to     := f10;
    guard  := A > 5 && 0 > C;
    action := B' = C, C' = ?;
  };
  transition t4 := {
    from   := f9;
    to     := f10;
    guard  := A > 5 && C > 0;
    action := B' = C, C' = ?;
  };
  transition t5 := {
    from   := f10;
    to     := f9;
    guard  := A > 5;
    action := A' = A + 1, C' = ?;
  };
  transition t6 := {
    from   := f27;
    to     := f29;
    guard  := true;
    action := C' = ?;
  };
  transition t7 := {
    from   := f19;
    to     := f19;
    guard  := A > 2;
    action := A' = A - 1, C' = ?;
  };
  transition t8 := {
    from   := f19;
    to     := f9;
    guard  := 2 >= A;
    action := C' = ?;
  };
  transition t9 := {
    from   := f10;
    to     := f9;
    guard  := 5 >= A;
    action := A' = A + 1, C' = ?;
  };
  transition t10 := {
    from   := f9;
    to     := f19;
    guard  := A > 5;
    action := B' = 0, C' = ?;
  };
  transition t11 := {
    from   := f0;
    to     := f9;
    guard  := true;
    action := A' = C, C' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
