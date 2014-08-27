model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1;
  states f13, f47, f39, f54, f56, f59, f0;
  transition t0 := {
    from   := f13;
    to     := f47;
    guard  := A >= B;
    action := X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t1 := {
    from   := f39;
    to     := f47;
    guard  := C > 2;
    action := X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t2 := {
    from   := f39;
    to     := f47;
    guard  := 1 >= C;
    action := X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t3 := {
    from   := f54;
    to     := f54;
    guard  := true;
    action := X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t4 := {
    from   := f56;
    to     := f59;
    guard  := true;
    action := X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t5 := {
    from   := f47;
    to     := f54;
    guard  := D > 0;
    action := E' = 0, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t6 := {
    from   := f47;
    to     := f54;
    guard  := 0 >= D;
    action := F' = 0, E' = 0, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t7 := {
    from   := f39;
    to     := f47;
    guard  := C = 2;
    action := C' = 2, G' = H, E' = E + 1, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t8 := {
    from   := f13;
    to     := f47;
    guard  := X > 0 && B > A;
    action := I' = Y, J' = Z, K' = A1, L' = E, M' = X, N' = X, O' = X, H' = X, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t9 := {
    from   := f13;
    to     := f39;
    guard  := B > A && 0 >= X && B1 > 1;
    action := I' = Y, J' = Z, K' = A1, L' = E, M' = X, N' = X, O' = X, H' = X, P' = X, Q' = R, S' = B1, T' = B1, U' = B1, V' = 0, C' = B1, R' = 0, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t10 := {
    from   := f13;
    to     := f39;
    guard  := B > A && 0 >= X && 0 >= B1;
    action := I' = Y, J' = Z, K' = A1, L' = E, M' = X, N' = X, O' = X, H' = X, P' = X, Q' = R, S' = B1, T' = B1, U' = B1, V' = 0, C' = B1, R' = 0, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t11 := {
    from   := f13;
    to     := f13;
    guard  := 0 >= X && B > A;
    action := A' = A + 1, I' = Y, J' = Z, K' = A1, L' = E, M' = X, N' = X, O' = X, H' = X, P' = X, Q' = R, S' = 1, T' = 1, U' = 1, V' = 0, C' = 1, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t12 := {
    from   := f0;
    to     := f13;
    guard  := 0 >= Y;
    action := F' = 0, W' = 0, D' = Y, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t13 := {
    from   := f0;
    to     := f13;
    guard  := Y > 0;
    action := F' = 0, W' = 0, D' = Y, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
