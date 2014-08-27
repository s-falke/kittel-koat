model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1;
  states f51, f53, f56, f11, f37, f0;
  transition t0 := {
    from   := f51;
    to     := f51;
    guard  := true;
    action := W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?;
  };
  transition t1 := {
    from   := f53;
    to     := f56;
    guard  := true;
    action := W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?;
  };
  transition t2 := {
    from   := f11;
    to     := f51;
    guard  := A >= B;
    action := C' = 0, D' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?;
  };
  transition t3 := {
    from   := f37;
    to     := f51;
    guard  := E > 2;
    action := C' = 0, D' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?;
  };
  transition t4 := {
    from   := f37;
    to     := f51;
    guard  := 1 >= E;
    action := C' = 0, D' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?;
  };
  transition t5 := {
    from   := f37;
    to     := f51;
    guard  := E = 2;
    action := C' = 0, E' = 2, F' = G, D' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?;
  };
  transition t6 := {
    from   := f11;
    to     := f51;
    guard  := W > 0 && B > A;
    action := C' = 0, H' = X, I' = Y, J' = Z, K' = D, L' = W, M' = W, N' = W, G' = W, D' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?;
  };
  transition t7 := {
    from   := f11;
    to     := f37;
    guard  := B > A && 0 >= W && A1 > 1;
    action := H' = X, I' = Y, J' = Z, K' = D, L' = W, M' = W, N' = W, G' = W, O' = W, P' = Q, R' = A1, S' = A1, T' = A1, U' = 0, E' = A1, Q' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?;
  };
  transition t8 := {
    from   := f11;
    to     := f37;
    guard  := B > A && 0 >= W && 0 >= A1;
    action := H' = X, I' = Y, J' = Z, K' = D, L' = W, M' = W, N' = W, G' = W, O' = W, P' = Q, R' = A1, S' = A1, T' = A1, U' = 0, E' = A1, Q' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?;
  };
  transition t9 := {
    from   := f11;
    to     := f11;
    guard  := 0 >= W && B > A;
    action := A' = A + 1, H' = X, I' = Y, J' = Z, K' = D, L' = W, M' = W, N' = W, G' = W, O' = W, P' = Q, R' = 1, S' = 1, T' = 1, U' = 0, E' = 1, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?;
  };
  transition t10 := {
    from   := f0;
    to     := f11;
    guard  := true;
    action := C' = 0, V' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
