model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N;
  states f1, f300, f2;
  transition t0 := {
    from   := f1;
    to     := f1;
    guard  := B > A;
    action := C' = K, D' = L, E' = M, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t1 := {
    from   := f1;
    to     := f300;
    guard  := A >= B;
    action := C' = K, D' = L, F' = M, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t2 := {
    from   := f2;
    to     := f1;
    guard  := true;
    action := G' = K, H' = L, I' = M, J' = N, K' = ?, L' = ?, M' = ?, N' = ?;
  };
}
strategy dumb {
  Region init := { state = f2 };
}
