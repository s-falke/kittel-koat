model main {
  var A, B, C, D, E, F, G, H;
  states f2, f0, f3, f4;
  transition t0 := {
    from   := f2;
    to     := f2;
    guard  := G > 0 && A > 0;
    action := B' = G, C' = G, A' = 1 + A, G' = ?, H' = ?;
  };
  transition t1 := {
    from   := f2;
    to     := f2;
    guard  := 0 > G && A > 0;
    action := B' = G, C' = G, A' = 1 + A, G' = ?, H' = ?;
  };
  transition t2 := {
    from   := f2;
    to     := f0;
    guard  := true;
    action := B' = 0, C' = 0, D' = G, G' = ?, H' = ?;
  };
  transition t3 := {
    from   := f3;
    to     := f2;
    guard  := G > 0 && A > 0;
    action := B' = G, C' = G, A' = 1 + A, G' = ?, H' = ?;
  };
  transition t4 := {
    from   := f3;
    to     := f2;
    guard  := 0 > G && A > 0;
    action := B' = G, C' = G, A' = 1 + A, G' = ?, H' = ?;
  };
  transition t5 := {
    from   := f3;
    to     := f0;
    guard  := true;
    action := B' = 0, C' = 0, D' = G, G' = ?, H' = ?;
  };
  transition t6 := {
    from   := f4;
    to     := f2;
    guard  := G > 0 && H > 0;
    action := B' = G, C' = G, A' = 1 + H, E' = H, F' = H, G' = ?, H' = ?;
  };
  transition t7 := {
    from   := f4;
    to     := f2;
    guard  := 0 > G && H > 0;
    action := B' = G, C' = G, A' = 1 + H, E' = H, F' = H, G' = ?, H' = ?;
  };
  transition t8 := {
    from   := f4;
    to     := f0;
    guard  := true;
    action := B' = 0, C' = 0, A' = G, D' = H, E' = G, F' = G, G' = ?, H' = ?;
  };
}
strategy dumb {
  Region init := { state = f4 };
}
