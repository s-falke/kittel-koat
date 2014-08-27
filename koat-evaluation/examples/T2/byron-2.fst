model main {
  var A, B, C, D, E, F, G, H, I;
  states f0, f2, f1;
  transition t0 := {
    from   := f0;
    to     := f2;
    guard  := 0 >= A;
    action := B' = G, G' = ?, H' = ?, I' = ?;
  };
  transition t1 := {
    from   := f0;
    to     := f0;
    guard  := A > 0 && C > 2;
    action := D' = G, E' = 0, C' = -1 + C, F' = H, G' = ?, H' = ?, I' = ?;
  };
  transition t2 := {
    from   := f0;
    to     := f0;
    guard  := 0 > H && A > 0;
    action := A' = -1 + A, D' = G, E' = H, C' = I, G' = ?, H' = ?, I' = ?;
  };
  transition t3 := {
    from   := f0;
    to     := f0;
    guard  := H > 0 && A > 0;
    action := A' = -1 + A, D' = G, E' = H, C' = I, G' = ?, H' = ?, I' = ?;
  };
  transition t4 := {
    from   := f1;
    to     := f0;
    guard  := true;
    action := G' = ?, H' = ?, I' = ?;
  };
}
strategy dumb {
  Region init := { state = f1 };
}
