model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O;
  states f2, f300, f1;
  transition t0 := {
    from   := f2;
    to     := f2;
    guard  := L > 0 && B > A;
    action := C' = M, D' = N, E' = L, F' = O, L' = ?, M' = ?, N' = ?, O' = ?;
  };
  transition t1 := {
    from   := f2;
    to     := f2;
    guard  := 0 > L && B > A;
    action := C' = M, D' = N, E' = L, F' = O, L' = ?, M' = ?, N' = ?, O' = ?;
  };
  transition t2 := {
    from   := f2;
    to     := f2;
    guard  := B > A;
    action := C' = M, D' = N, E' = 0, L' = ?, M' = ?, N' = ?, O' = ?;
  };
  transition t3 := {
    from   := f2;
    to     := f300;
    guard  := A >= B;
    action := C' = M, D' = N, G' = L, L' = ?, M' = ?, N' = ?, O' = ?;
  };
  transition t4 := {
    from   := f1;
    to     := f2;
    guard  := true;
    action := H' = M, I' = N, J' = N, K' = M, L' = ?, M' = ?, N' = ?, O' = ?;
  };
}
strategy dumb {
  Region init := { state = f1 };
}
