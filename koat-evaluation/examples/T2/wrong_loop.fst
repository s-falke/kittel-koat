model main {
  var A, B, C;
  states f0, f3, f12;
  transition t0 := {
    from   := f0;
    to     := f3;
    guard  := true;
    action := A' = 0, C' = ?;
  };
  transition t1 := {
    from   := f3;
    to     := f3;
    guard  := A = 5;
    action := A' = C + 1, C' = ?;
  };
  transition t2 := {
    from   := f3;
    to     := f3;
    guard  := 9 >= A && 4 >= A;
    action := A' = A + 1, B' = A, C' = ?;
  };
  transition t3 := {
    from   := f3;
    to     := f3;
    guard  := 9 >= A && A > 5;
    action := A' = A + 1, B' = A, C' = ?;
  };
  transition t4 := {
    from   := f3;
    to     := f12;
    guard  := A > 9;
    action := C' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
