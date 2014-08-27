model main {
  var A, B, C, D, E, F, G, H, I;
  states f0, f23;
  transition t0 := {
    from   := f0;
    to     := f23;
    guard  := 99 >= F;
    action := A' = 0, B' = 1, C' = G, D' = H, E' = I, F' = ?, G' = ?, H' = ?, I' = ?;
  };
  transition t1 := {
    from   := f0;
    to     := f23;
    guard  := true;
    action := A' = 0, B' = 1, C' = G, D' = H, E' = I, F' = ?, G' = ?, H' = ?, I' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
