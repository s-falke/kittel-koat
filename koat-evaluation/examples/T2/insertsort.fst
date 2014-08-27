model main {
  var A, B, C, D, E, F;
  states f0, f15, f18, f28;
  transition t0 := {
    from   := f0;
    to     := f15;
    guard  := true;
    action := A' = 2, D' = ?, E' = ?, F' = ?;
  };
  transition t1 := {
    from   := f15;
    to     := f18;
    guard  := 10 >= A;
    action := B' = A, D' = ?, E' = ?, F' = ?;
  };
  transition t2 := {
    from   := f18;
    to     := f18;
    guard  := D > E;
    action := B' = B - 1, C' = F, D' = ?, E' = ?, F' = ?;
  };
  transition t3 := {
    from   := f18;
    to     := f15;
    guard  := true;
    action := A' = A + 1, D' = ?, E' = ?, F' = ?;
  };
  transition t4 := {
    from   := f15;
    to     := f28;
    guard  := A > 10;
    action := D' = ?, E' = ?, F' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
