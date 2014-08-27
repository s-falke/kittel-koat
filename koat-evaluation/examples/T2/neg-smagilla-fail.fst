model main {
  var A, B, C, D, E, F;
  states f11, f21, f23, f26, f0;
  transition t0 := {
    from   := f11;
    to     := f11;
    guard  := A > 0 && F > 0;
    action := B' = B - 1, C' = C + 1, A' = A - 1, D' = F, F' = ?;
  };
  transition t1 := {
    from   := f11;
    to     := f11;
    guard  := 0 >= F && A > 0 && A > B;
    action := A' = A - 1, D' = F, F' = ?;
  };
  transition t2 := {
    from   := f21;
    to     := f21;
    guard  := true;
    action := F' = ?;
  };
  transition t3 := {
    from   := f23;
    to     := f26;
    guard  := true;
    action := F' = ?;
  };
  transition t4 := {
    from   := f11;
    to     := f21;
    guard  := 0 >= A;
    action := F' = ?;
  };
  transition t5 := {
    from   := f0;
    to     := f11;
    guard  := F > 0;
    action := B' = F, E' = 8, C' = 0, A' = 8, F' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
