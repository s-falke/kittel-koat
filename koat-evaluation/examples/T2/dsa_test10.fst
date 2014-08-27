model main {
  var A, B, C, D, E, F, G;
  states f12, f25, f36, f0;
  transition t0 := {
    from   := f12;
    to     := f12;
    guard  := 9 >= A;
    action := A' = A + 1, F' = ?, G' = ?;
  };
  transition t1 := {
    from   := f25;
    to     := f25;
    guard  := 9 >= B;
    action := B' = B + 1, F' = ?, G' = ?;
  };
  transition t2 := {
    from   := f25;
    to     := f36;
    guard  := B > 9;
    action := F' = ?, G' = ?;
  };
  transition t3 := {
    from   := f12;
    to     := f25;
    guard  := A > 9;
    action := C' = F, B' = 0, F' = ?, G' = ?;
  };
  transition t4 := {
    from   := f0;
    to     := f12;
    guard  := true;
    action := D' = F, E' = G, A' = 0, F' = ?, G' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
