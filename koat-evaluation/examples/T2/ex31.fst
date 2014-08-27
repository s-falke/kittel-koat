model main {
  var A, B, C, D, E;
  states f0, f4, f11;
  transition t0 := {
    from   := f0;
    to     := f4;
    guard  := true;
    action := A' = 0, B' = 99, C' = ?, D' = ?, E' = ?;
  };
  transition t1 := {
    from   := f4;
    to     := f4;
    guard  := B > A && C > D;
    action := A' = E, C' = ?, D' = ?, E' = ?;
  };
  transition t2 := {
    from   := f4;
    to     := f4;
    guard  := B > A;
    action := B' = E, C' = ?, D' = ?, E' = ?;
  };
  transition t3 := {
    from   := f4;
    to     := f11;
    guard  := A >= B;
    action := C' = ?, D' = ?, E' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
