model main {
  var A, B, C, D, E, F, G, H;
  states f12, f5, f11, f10, f7, f8;
  transition t0 := {
    from   := f12;
    to     := f5;
    guard  := true;
    action := A' = 400, B' = 0, C' = 0, G' = ?, H' = ?;
  };
  transition t1 := {
    from   := f5;
    to     := f11;
    guard  := B >= A && C = 0;
    action := D' = 0, C' = 0, E' = 0, G' = ?, H' = ?;
  };
  transition t2 := {
    from   := f5;
    to     := f10;
    guard  := C > 0;
    action := D' = C, E' = C, G' = ?, H' = ?;
  };
  transition t3 := {
    from   := f5;
    to     := f10;
    guard  := 0 > C;
    action := D' = C, E' = C, G' = ?, H' = ?;
  };
  transition t4 := {
    from   := f7;
    to     := f5;
    guard  := true;
    action := F' = G, D' = H, B' = 1 + B, C' = G, G' = ?, H' = ?;
  };
  transition t5 := {
    from   := f8;
    to     := f5;
    guard  := true;
    action := F' = G, D' = H, B' = 1 + B, C' = G, G' = ?, H' = ?;
  };
  transition t6 := {
    from   := f5;
    to     := f5;
    guard  := A > B && C = 0;
    action := F' = G, D' = H, B' = 1 + B, C' = G, G' = ?, H' = ?;
  };
}
strategy dumb {
  Region init := { state = f12 };
}
