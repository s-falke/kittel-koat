model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M;
  states f1, f300, f2;
  transition t0 := {
    from   := f1;
    to     := f1;
    guard  := J > 0 && B > A;
    action := C' = K, D' = L, E' = J, F' = M, J' = ?, K' = ?, L' = ?, M' = ?;
  };
  transition t1 := {
    from   := f1;
    to     := f1;
    guard  := 0 > J && B > A;
    action := C' = K, D' = L, E' = J, F' = M, J' = ?, K' = ?, L' = ?, M' = ?;
  };
  transition t2 := {
    from   := f1;
    to     := f1;
    guard  := B > A;
    action := C' = K, D' = L, E' = 0, J' = ?, K' = ?, L' = ?, M' = ?;
  };
  transition t3 := {
    from   := f1;
    to     := f300;
    guard  := A >= B;
    action := C' = K, D' = L, G' = J, J' = ?, K' = ?, L' = ?, M' = ?;
  };
  transition t4 := {
    from   := f2;
    to     := f1;
    guard  := true;
    action := H' = K, I' = L, J' = ?, K' = ?, L' = ?, M' = ?;
  };
}
strategy dumb {
  Region init := { state = f2 };
}
