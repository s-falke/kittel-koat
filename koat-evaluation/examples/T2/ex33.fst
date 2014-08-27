model main {
  var A, B, C, D, E, F, G, H, I;
  states f0, f17;
  transition t0 := {
    from   := f0;
    to     := f17;
    guard  := 0 > 1 + G;
    action := A' = H, B' = G, C' = I, G' = ?, H' = ?, I' = ?;
  };
  transition t1 := {
    from   := f0;
    to     := f17;
    guard  := G >= 0;
    action := A' = H, B' = G, C' = I, G' = ?, H' = ?, I' = ?;
  };
  transition t2 := {
    from   := f0;
    to     := f17;
    guard  := true;
    action := A' = H, B' = -1, D' = 0, E' = G, F' = I, G' = ?, H' = ?, I' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
