model main {
  var A, B, C, D;
  states f0, f3, f7, f4, f6, f5;
  transition t0 := {
    from   := f0;
    to     := f3;
    guard  := true;
    action := A' = -A, D' = ?;
  };
  transition t1 := {
    from   := f3;
    to     := f7;
    guard  := A = 0;
    action := A' = 0, B' = D, D' = ?;
  };
  transition t2 := {
    from   := f4;
    to     := f7;
    guard  := A = 0;
    action := A' = 0, B' = D, D' = ?;
  };
  transition t3 := {
    from   := f6;
    to     := f4;
    guard  := A > 0;
    action := C' = 1, D' = ?;
  };
  transition t4 := {
    from   := f3;
    to     := f4;
    guard  := 0 > A && 0 >= C;
    action := A' = -1 - A, C' = 1, D' = ?;
  };
  transition t5 := {
    from   := f3;
    to     := f4;
    guard  := 0 > A && C > 1;
    action := A' = -1 - A, C' = 1, D' = ?;
  };
  transition t6 := {
    from   := f3;
    to     := f4;
    guard  := A > 0 && 0 >= C;
    action := A' = -1 - A, C' = 1, D' = ?;
  };
  transition t7 := {
    from   := f3;
    to     := f4;
    guard  := A > 0 && C > 1;
    action := A' = -1 - A, C' = 1, D' = ?;
  };
  transition t8 := {
    from   := f4;
    to     := f3;
    guard  := 0 > A && C = 1;
    action := A' = 1 - A, C' = 0, D' = ?;
  };
  transition t9 := {
    from   := f4;
    to     := f3;
    guard  := A > 0 && C = 1;
    action := A' = 1 - A, C' = 0, D' = ?;
  };
  transition t10 := {
    from   := f5;
    to     := f3;
    guard  := 0 > A && C = 1;
    action := A' = 1 - A, C' = 0, D' = ?;
  };
  transition t11 := {
    from   := f5;
    to     := f3;
    guard  := A > 0 && C = 1;
    action := A' = 1 - A, C' = 0, D' = ?;
  };
}
strategy dumb {
  Region init := { state = f6 };
}
