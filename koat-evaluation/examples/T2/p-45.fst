model main {
  var A, B, C, D, E, F, G, H;
  states f2, f3, f4;
  transition t0 := {
    from   := f2;
    to     := f2;
    guard  := A > 0 && B > 0;
    action := B' = -1 + B, C' = A, D' = B, E' = -2 + A, A' = -1 + A, G' = ?, H' = ?;
  };
  transition t1 := {
    from   := f3;
    to     := f2;
    guard  := true;
    action := G' = ?, H' = ?;
  };
  transition t2 := {
    from   := f2;
    to     := f4;
    guard  := 0 >= B && 0 >= G;
    action := F' = H, B' = G, G' = ?, H' = ?;
  };
  transition t3 := {
    from   := f2;
    to     := f4;
    guard  := B > 0 && 0 >= A;
    action := F' = H, G' = ?, H' = ?;
  };
}
strategy dumb {
  Region init := { state = f3 };
}
