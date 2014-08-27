model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N;
  states f2, f300, f1;
  transition t0 := {
    from   := f2;
    to     := f300;
    guard  := true;
    action := A' = K, B' = L, C' = M, D' = N, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t1 := {
    from   := f300;
    to     := f300;
    guard  := F > E;
    action := G' = K, H' = L, I' = M, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t2 := {
    from   := f300;
    to     := f1;
    guard  := E >= F;
    action := G' = K, H' = L, J' = M, K' = ?, L' = ?, M' = ?, N' = ?;
  };
}
strategy dumb {
  Region init := { state = f2 };
}
