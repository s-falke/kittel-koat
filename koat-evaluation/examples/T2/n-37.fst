model main {
  var A, B, C, D, E, F, G, H;
  states f10, f4, f9, f7, f6;
  transition t0 := {
    from   := f10;
    to     := f4;
    guard  := true;
    action := A' = 4, B' = 0, C' = 0, G' = ?, H' = ?;
  };
  transition t1 := {
    from   := f4;
    to     := f9;
    guard  := true;
    action := D' = C, E' = C, G' = ?, H' = ?;
  };
  transition t2 := {
    from   := f7;
    to     := f4;
    guard  := true;
    action := F' = G, D' = H, B' = 1 + B, C' = G, G' = ?, H' = ?;
  };
  transition t3 := {
    from   := f4;
    to     := f4;
    guard  := true;
    action := F' = G, D' = H, B' = 1 + B, C' = G, G' = ?, H' = ?;
  };
  transition t4 := {
    from   := f6;
    to     := f4;
    guard  := true;
    action := F' = G, D' = H, B' = 1 + B, C' = G, G' = ?, H' = ?;
  };
}
strategy dumb {
  Region init := { state = f10 };
}
