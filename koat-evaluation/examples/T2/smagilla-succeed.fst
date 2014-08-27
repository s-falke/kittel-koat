model main {
  var A, B, C, D, E, F;
  states f10, f20, f22, f25, f0;
  transition t0 := {
    from   := f10;
    to     := f10;
    guard  := A > 0 && F > 0;
    action := B' = B - 1, C' = C + 1, A' = A - 1, D' = F, F' = ?;
  };
  transition t1 := {
    from   := f10;
    to     := f10;
    guard  := 0 >= F && A > 0 && A > B;
    action := A' = A - 1, D' = F, F' = ?;
  };
  transition t2 := {
    from   := f20;
    to     := f20;
    guard  := true;
    action := F' = ?;
  };
  transition t3 := {
    from   := f22;
    to     := f25;
    guard  := true;
    action := F' = ?;
  };
  transition t4 := {
    from   := f10;
    to     := f20;
    guard  := 0 >= A;
    action := F' = ?;
  };
  transition t5 := {
    from   := f0;
    to     := f10;
    guard  := F > 0;
    action := B' = F, E' = 8, C' = 0, A' = 8, F' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
