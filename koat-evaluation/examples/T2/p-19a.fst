model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O;
  states f2, f300, f1;
  transition t0 := {
    from   := f2;
    to     := f2;
    guard  := A > 0;
    action := B' = K, C' = L, D' = M, E' = N, F' = O, K' = ?, L' = ?, M' = ?, N' = ?, O' = ?;
  };
  transition t1 := {
    from   := f2;
    to     := f300;
    guard  := 0 >= A;
    action := B' = K, C' = L, G' = M, K' = ?, L' = ?, M' = ?, N' = ?, O' = ?;
  };
  transition t2 := {
    from   := f1;
    to     := f2;
    guard  := true;
    action := H' = K, I' = L, J' = K, K' = ?, L' = ?, M' = ?, N' = ?, O' = ?;
  };
}
strategy dumb {
  Region init := { state = f1 };
}
