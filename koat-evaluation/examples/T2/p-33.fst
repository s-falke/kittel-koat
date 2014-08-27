model main {
  var A, B, C, D;
  states f2, f3, f300;
  transition t0 := {
    from   := f2;
    to     := f2;
    guard  := 0 >= C && 0 > A;
    action := A' = -1 + D, C' = ?, D' = ?;
  };
  transition t1 := {
    from   := f2;
    to     := f2;
    guard  := C > 1 && 0 > A;
    action := A' = 1 + D, C' = ?, D' = ?;
  };
  transition t2 := {
    from   := f2;
    to     := f2;
    guard  := 0 > 1 + C && A > 0;
    action := A' = -1 + D, C' = ?, D' = ?;
  };
  transition t3 := {
    from   := f2;
    to     := f2;
    guard  := C >= 0 && A > 0;
    action := A' = 1 + D, C' = ?, D' = ?;
  };
  transition t4 := {
    from   := f3;
    to     := f2;
    guard  := true;
    action := C' = ?, D' = ?;
  };
  transition t5 := {
    from   := f2;
    to     := f300;
    guard  := 0 > A;
    action := A' = 0, B' = D, C' = ?, D' = ?;
  };
  transition t6 := {
    from   := f2;
    to     := f300;
    guard  := A > 0;
    action := A' = 0, B' = D, C' = ?, D' = ?;
  };
  transition t7 := {
    from   := f2;
    to     := f300;
    guard  := A = 0;
    action := B' = D, C' = ?, D' = ?;
  };
}
strategy dumb {
  Region init := { state = f3 };
}
