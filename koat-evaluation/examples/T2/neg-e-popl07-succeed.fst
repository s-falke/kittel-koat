model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z;
  states f13, f45, f37, f52, f54, f57, f0;
  transition t0 := {
    from   := f13;
    to     := f45;
    guard  := A >= B;
    action := V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t1 := {
    from   := f37;
    to     := f45;
    guard  := C > 2;
    action := V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t2 := {
    from   := f37;
    to     := f45;
    guard  := 1 >= C;
    action := V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t3 := {
    from   := f52;
    to     := f52;
    guard  := true;
    action := V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t4 := {
    from   := f54;
    to     := f57;
    guard  := true;
    action := V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t5 := {
    from   := f45;
    to     := f52;
    guard  := D > 0;
    action := E' = 0, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t6 := {
    from   := f45;
    to     := f52;
    guard  := 0 >= D;
    action := F' = 0, E' = 0, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t7 := {
    from   := f37;
    to     := f45;
    guard  := C = 2;
    action := C' = 2, G' = H, E' = E + 1, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t8 := {
    from   := f13;
    to     := f45;
    guard  := V > 0 && B > A;
    action := I' = W, J' = X, K' = Y, L' = E, M' = V, N' = V, H' = V, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t9 := {
    from   := f13;
    to     := f37;
    guard  := B > A && 0 >= V && Z > 1;
    action := I' = W, J' = X, K' = Y, L' = E, M' = V, N' = V, H' = V, O' = V, P' = Q, R' = Z, S' = Z, C' = Z, T' = 0, Q' = 0, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t10 := {
    from   := f13;
    to     := f37;
    guard  := B > A && 0 >= V && 0 >= Z;
    action := I' = W, J' = X, K' = Y, L' = E, M' = V, N' = V, H' = V, O' = V, P' = Q, R' = Z, S' = Z, C' = Z, T' = 0, Q' = 0, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t11 := {
    from   := f13;
    to     := f13;
    guard  := 0 >= V && B > A;
    action := A' = A + 1, I' = W, J' = X, K' = Y, L' = E, M' = V, N' = V, H' = V, O' = V, P' = Q, R' = 1, S' = 1, C' = 1, T' = 0, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t12 := {
    from   := f0;
    to     := f13;
    guard  := 0 >= W;
    action := F' = 0, U' = 0, D' = W, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t13 := {
    from   := f0;
    to     := f13;
    guard  := W > 0;
    action := F' = 0, U' = 0, D' = W, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
