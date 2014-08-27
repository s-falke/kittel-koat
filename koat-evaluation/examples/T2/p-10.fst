model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M;
  states f2, f300, f1;
  transition t0 := {
    from   := f2;
    to     := f2;
    guard  := B > A;
    action := C' = K, D' = L, E' = M, K' = ?, L' = ?, M' = ?;
  };
  transition t1 := {
    from   := f2;
    to     := f300;
    guard  := A >= B;
    action := C' = K, D' = L, F' = M, K' = ?, L' = ?, M' = ?;
  };
  transition t2 := {
    from   := f1;
    to     := f2;
    guard  := true;
    action := G' = K, H' = L, I' = L, J' = K, K' = ?, L' = ?, M' = ?;
  };
}
strategy dumb {
  Region init := { state = f1 };
}
