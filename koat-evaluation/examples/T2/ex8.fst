model main {
  var A, B, C, D, E, F, G;
  states f0, f9, f24, f37, f48;
  transition t0 := {
    from   := f0;
    to     := f9;
    guard  := true;
    action := A' = F, B' = F, C' = F, D' = 0, F' = ?, G' = ?;
  };
  transition t1 := {
    from   := f9;
    to     := f9;
    guard  := C > D;
    action := D' = D + 1, E' = F, F' = ?, G' = ?;
  };
  transition t2 := {
    from   := f24;
    to     := f24;
    guard  := 0 > F;
    action := F' = ?, G' = ?;
  };
  transition t3 := {
    from   := f24;
    to     := f24;
    guard  := true;
    action := F' = ?, G' = ?;
  };
  transition t4 := {
    from   := f37;
    to     := f37;
    guard  := F > G;
    action := F' = ?, G' = ?;
  };
  transition t5 := {
    from   := f37;
    to     := f37;
    guard  := true;
    action := F' = ?, G' = ?;
  };
  transition t6 := {
    from   := f37;
    to     := f48;
    guard  := true;
    action := F' = ?, G' = ?;
  };
  transition t7 := {
    from   := f24;
    to     := f37;
    guard  := true;
    action := F' = ?, G' = ?;
  };
  transition t8 := {
    from   := f9;
    to     := f24;
    guard  := D >= C;
    action := F' = ?, G' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
