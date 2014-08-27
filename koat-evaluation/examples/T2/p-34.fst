model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1;
  states f2, f1, f300;
  transition t0 := {
    from   := f2;
    to     := f1;
    guard  := true;
    action := A' = X, B' = X, C' = X, D' = X, E' = X, F' = X, G' = X, H' = X, I' = X, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?;
  };
  transition t1 := {
    from   := f1;
    to     := f1;
    guard  := 0 >= Y && 0 > J;
    action := K' = X, L' = Z, M' = A1, N' = B1, O' = C1, P' = D1, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?;
  };
  transition t2 := {
    from   := f1;
    to     := f1;
    guard  := 0 > J && E1 > 0 && F1 > 1;
    action := K' = X, L' = Z, M' = A1, N' = B1, Q' = C1, R' = D1, S' = Y, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?;
  };
  transition t3 := {
    from   := f1;
    to     := f1;
    guard  := 0 > 1 + E1 && J > 0;
    action := K' = X, N' = Z, O' = A1, P' = B1, T' = C1, U' = D1, V' = Y, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?;
  };
  transition t4 := {
    from   := f1;
    to     := f1;
    guard  := J > 0 && F1 >= 0 && G1 + 1 >= 0;
    action := K' = X, N' = Z, Q' = A1, R' = B1, S' = C1, T' = D1, U' = Y, V' = E1, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?;
  };
  transition t5 := {
    from   := f1;
    to     := f300;
    guard  := 1 >= Y && 0 > J && E1 > 0;
    action := K' = X, L' = Z, M' = A1, N' = B1, Q' = C1, W' = D1, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?;
  };
  transition t6 := {
    from   := f1;
    to     := f300;
    guard  := 0 > E1 && J > 0 && F1 + 1 >= 0;
    action := K' = X, N' = Z, Q' = A1, T' = B1, U' = C1, V' = D1, W' = Y, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?;
  };
  transition t7 := {
    from   := f1;
    to     := f300;
    guard  := J = 0;
    action := K' = X, T' = Z, W' = A1, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?;
  };
}
strategy dumb {
  Region init := { state = f2 };
}
