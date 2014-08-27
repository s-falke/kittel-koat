model main {
  var A, B, C, D;
  states f2, f1, f300;
  transition t0 := {
    from   := f2;
    to     := f1;
    guard  := 0 > C && A = 14;
    action := A' = C, B' = D, C' = ?, D' = ?;
  };
  transition t1 := {
    from   := f2;
    to     := f2;
    guard  := C >= 0 && A = 14;
    action := A' = C, C' = ?, D' = ?;
  };
  transition t2 := {
    from   := f2;
    to     := f1;
    guard  := A > 14 && 0 >= A;
    action := A' = -1 + A, B' = C, C' = ?, D' = ?;
  };
  transition t3 := {
    from   := f2;
    to     := f1;
    guard  := 13 >= A && 0 >= A;
    action := A' = -1 + A, B' = C, C' = ?, D' = ?;
  };
  transition t4 := {
    from   := f2;
    to     := f2;
    guard  := A > 14 && A > 0;
    action := A' = -1 + A, C' = ?, D' = ?;
  };
  transition t5 := {
    from   := f2;
    to     := f2;
    guard  := 13 >= A && A > 0;
    action := A' = -1 + A, C' = ?, D' = ?;
  };
  transition t6 := {
    from   := f300;
    to     := f2;
    guard  := true;
    action := C' = ?, D' = ?;
  };
}
strategy dumb {
  Region init := { state = f300 };
}
