model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M;
  states f2, f300, f1;
  transition t0 := {
    from   := f2;
    to     := f300;
    guard  := 0 >= A;
    action := B' = K, C' = L, D' = M, K' = ?, L' = ?, M' = ?;
  };
  transition t1 := {
    from   := f2;
    to     := f2;
    guard  := A > 0;
    action := B' = K, C' = L, E' = M, K' = ?, L' = ?, M' = ?;
  };
  transition t2 := {
    from   := f1;
    to     := f2;
    guard  := true;
    action := F' = K, G' = L, H' = M, I' = M, J' = K, K' = ?, L' = ?, M' = ?;
  };
}
strategy dumb {
  Region init := { state = f1 };
}
