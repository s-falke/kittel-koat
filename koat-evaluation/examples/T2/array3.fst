model main {
  var A, B, C, D;
  states f0, f9, f17, f24;
  transition t0 := {
    from   := f0;
    to     := f9;
    guard  := true;
    action := A' = 0, B' = D, C' = 0, D' = ?;
  };
  transition t1 := {
    from   := f9;
    to     := f9;
    guard  := 49 >= C;
    action := C' = C + 1, D' = ?;
  };
  transition t2 := {
    from   := f17;
    to     := f17;
    guard  := 49 >= A;
    action := A' = A + 1, D' = ?;
  };
  transition t3 := {
    from   := f17;
    to     := f24;
    guard  := A > 49;
    action := D' = ?;
  };
  transition t4 := {
    from   := f9;
    to     := f17;
    guard  := C > 49;
    action := A' = 0, D' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
