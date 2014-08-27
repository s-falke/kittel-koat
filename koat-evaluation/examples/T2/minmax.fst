model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M;
  states f11, f54, f38, f0;
  transition t0 := {
    from   := f11;
    to     := f54;
    guard  := A >= B;
    action := C' = B + A, L' = ?, M' = ?;
  };
  transition t1 := {
    from   := f11;
    to     := f54;
    guard  := B > A;
    action := C' = B - A, L' = ?, M' = ?;
  };
  transition t2 := {
    from   := f38;
    to     := f11;
    guard  := D > E;
    action := A' = L, F' = D, G' = D, L' = ?, M' = ?;
  };
  transition t3 := {
    from   := f38;
    to     := f11;
    guard  := E >= D;
    action := A' = L, H' = M, F' = D, G' = D, L' = ?, M' = ?;
  };
  transition t4 := {
    from   := f0;
    to     := f38;
    guard  := true;
    action := I' = 10, B' = 2, A' = 1, D' = 1, J' = 2, E' = 10, K' = L, L' = ?, M' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
