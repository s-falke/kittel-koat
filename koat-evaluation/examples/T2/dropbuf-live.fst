model main {
  var A, B, C, D, E, F, G, H;
  states f0, f7;
  transition t0 := {
    from   := f0;
    to     := f7;
    guard  := true;
    action := A' = 0, B' = 0, C' = F, D' = G, E' = H, F' = ?, G' = ?, H' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
