model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1;
  states f11, f45, f37, f53, f55, f58, f0;
  transition t0 := {
    from   := f11;
    to     := f45;
    guard  := A >= B;
    action := X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t1 := {
    from   := f37;
    to     := f45;
    guard  := C > 2;
    action := X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t2 := {
    from   := f37;
    to     := f45;
    guard  := 1 >= C;
    action := X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t3 := {
    from   := f53;
    to     := f53;
    guard  := true;
    action := X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t4 := {
    from   := f55;
    to     := f58;
    guard  := true;
    action := X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t5 := {
    from   := f45;
    to     := f53;
    guard  := 0 >= X;
    action := D' = 0, E' = X, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t6 := {
    from   := f45;
    to     := f53;
    guard  := X > 0;
    action := F' = 0, D' = 0, E' = X, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t7 := {
    from   := f37;
    to     := f45;
    guard  := C = 2;
    action := C' = 2, G' = H, D' = D + 1, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t8 := {
    from   := f11;
    to     := f45;
    guard  := Y > 0 && B > A;
    action := I' = X, J' = Z, K' = A1, L' = D, M' = Y, N' = Y, O' = Y, H' = Y, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t9 := {
    from   := f11;
    to     := f37;
    guard  := B > A && 0 >= Y && B1 > 1;
    action := I' = X, J' = Z, K' = A1, L' = D, M' = Y, N' = Y, O' = Y, H' = Y, P' = Y, Q' = R, S' = B1, T' = B1, U' = B1, V' = 0, C' = B1, R' = 0, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t10 := {
    from   := f11;
    to     := f37;
    guard  := B > A && 0 >= Y && 0 >= B1;
    action := I' = X, J' = Z, K' = A1, L' = D, M' = Y, N' = Y, O' = Y, H' = Y, P' = Y, Q' = R, S' = B1, T' = B1, U' = B1, V' = 0, C' = B1, R' = 0, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t11 := {
    from   := f11;
    to     := f11;
    guard  := 0 >= Y && B > A;
    action := A' = A + 1, I' = X, J' = Z, K' = A1, L' = D, M' = Y, N' = Y, O' = Y, H' = Y, P' = Y, Q' = R, S' = 1, T' = 1, U' = 1, V' = 0, C' = 1, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t12 := {
    from   := f0;
    to     := f11;
    guard  := true;
    action := F' = 0, W' = 0, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
