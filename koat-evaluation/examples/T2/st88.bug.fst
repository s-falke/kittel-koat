model main {
  var A, B, C;
  states f26, f2, f9, f12, f28, f30, f20, f0;
  transition t0 := {
    from   := f26;
    to     := f2;
    guard  := true;
    action := C' = ?;
  };
  transition t1 := {
    from   := f2;
    to     := f2;
    guard  := true;
    action := C' = ?;
  };
  transition t2 := {
    from   := f9;
    to     := f12;
    guard  := 5 >= A && 0 > C;
    action := B' = C, C' = ?;
  };
  transition t3 := {
    from   := f9;
    to     := f12;
    guard  := 5 >= A && C > 0;
    action := B' = C, C' = ?;
  };
  transition t4 := {
    from   := f12;
    to     := f9;
    guard  := A > 5;
    action := A' = A + 1, C' = ?;
  };
  transition t5 := {
    from   := f28;
    to     := f30;
    guard  := true;
    action := C' = ?;
  };
  transition t6 := {
    from   := f20;
    to     := f20;
    guard  := A > 2;
    action := A' = A - 1, C' = ?;
  };
  transition t7 := {
    from   := f20;
    to     := f9;
    guard  := 2 >= A;
    action := C' = ?;
  };
  transition t8 := {
    from   := f12;
    to     := f9;
    guard  := 5 >= A;
    action := A' = A + 1, C' = ?;
  };
  transition t9 := {
    from   := f9;
    to     := f20;
    guard  := 5 >= A;
    action := B' = 0, C' = ?;
  };
  transition t10 := {
    from   := f9;
    to     := f20;
    guard  := A > 5;
    action := C' = ?;
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
