model main {
  var A, B, C, D;
  states f3, f2, f300;
  transition t0 := {
    from   := f3;
    to     := f2;
    guard  := true;
    action := D' = ?;
  };
  transition t1 := {
    from   := f2;
    to     := f2;
    guard  := D > 0 && A >= 0;
    action := B' = D, A' = -1 + A, D' = ?;
  };
  transition t2 := {
    from   := f2;
    to     := f2;
    guard  := 0 > D && A >= 0;
    action := B' = D, A' = -1 + A, D' = ?;
  };
  transition t3 := {
    from   := f2;
    to     := f2;
    guard  := A >= 0;
    action := B' = 0, D' = ?;
  };
  transition t4 := {
    from   := f2;
    to     := f300;
    guard  := 0 > A;
    action := C' = D, D' = ?;
  };
}
strategy dumb {
  Region init := { state = f3 };
}
