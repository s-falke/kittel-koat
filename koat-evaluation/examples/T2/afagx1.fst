model main {
  var A, B, C;
  states f7, f13, f15, f17, f0;
  transition t0 := {
    from   := f7;
    to     := f7;
    guard  := 0 > A;
    action := A' = C, C' = ?;
  };
  transition t1 := {
    from   := f7;
    to     := f7;
    guard  := A > 0;
    action := A' = C, C' = ?;
  };
  transition t2 := {
    from   := f13;
    to     := f13;
    guard  := true;
    action := C' = ?;
  };
  transition t3 := {
    from   := f15;
    to     := f17;
    guard  := true;
    action := C' = ?;
  };
  transition t4 := {
    from   := f7;
    to     := f13;
    guard  := A = 0;
    action := B' = 1, A' = 0, C' = ?;
  };
  transition t5 := {
    from   := f0;
    to     := f7;
    guard  := true;
    action := B' = 1, A' = C, C' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
