model main {
  var A, B, C;
  states f0, f4, f14;
  transition t0 := {
    from   := f0;
    to     := f4;
    guard  := true;
    action := A' = C, B' = 0, C' = ?;
  };
  transition t1 := {
    from   := f4;
    to     := f4;
    guard  := 0 > C;
    action := B' = B + 1, C' = ?;
  };
  transition t2 := {
    from   := f4;
    to     := f4;
    guard  := true;
    action := B' = B + 1, C' = ?;
  };
  transition t3 := {
    from   := f4;
    to     := f14;
    guard  := A >= 0 && B > A;
    action := C' = ?;
  };
  transition t4 := {
    from   := f4;
    to     := f14;
    guard  := 0 > A;
    action := C' = ?;
  };
  transition t5 := {
    from   := f4;
    to     := f14;
    guard  := A >= 0 && A >= B;
    action := C' = ?;
  };
  transition t6 := {
    from   := f4;
    to     := f14;
    guard  := 0 > C && A >= 0 && B > A;
    action := C' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
