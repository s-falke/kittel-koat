model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1;
  states f300, f1, f2, f3;
  transition t0 := {
    from   := f300;
    to     := f1;
    guard  := true;
    action := A' = V, B' = W, C' = X, D' = Y, E' = Z, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t1 := {
    from   := f1;
    to     := f1;
    guard  := A1 > 0 && F + 1 = G && H = 256;
    action := I' = V, J' = W, K' = X, L' = Y, M' = Z, N' = B1, O' = C1, P' = D1, H' = 256, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t2 := {
    from   := f1;
    to     := f1;
    guard  := 0 >= H && F + 1 = G;
    action := I' = V, J' = W, K' = X, L' = Y, M' = Z, N' = B1, O' = C1, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t3 := {
    from   := f1;
    to     := f1;
    guard  := A1 > 0 && G > F && G > 1 + F && Q = 256;
    action := I' = V, J' = W, K' = X, L' = Y, M' = Z, N' = B1, O' = C1, P' = D1, Q' = 256, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t4 := {
    from   := f1;
    to     := f1;
    guard  := 0 >= Q && G > F && G > 1 + F;
    action := I' = V, J' = W, K' = X, L' = Y, M' = Z, N' = B1, O' = C1, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t5 := {
    from   := f1;
    to     := f2;
    guard  := F >= G;
    action := R' = 0, S' = 0, I' = V, J' = W, T' = 0, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t6 := {
    from   := f1;
    to     := f3;
    guard  := H > 0 && H > 256 && F + 1 = G;
    action := R' = H, S' = H, I' = V, J' = W, T' = H, K' = X, L' = Y, M' = Z, N' = B1, O' = C1, P' = D1, U' = A1, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t7 := {
    from   := f1;
    to     := f3;
    guard  := H > 0 && 255 >= H && F + 1 = G;
    action := R' = H, S' = H, I' = V, J' = W, T' = H, K' = X, L' = Y, M' = Z, N' = B1, O' = C1, P' = D1, U' = A1, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t8 := {
    from   := f1;
    to     := f3;
    guard  := Q > 0 && Q > 256 && G > F && G > 1 + F;
    action := R' = Q, S' = Q, I' = V, J' = W, T' = Q, K' = X, L' = Y, M' = Z, N' = B1, O' = C1, P' = D1, U' = A1, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t9 := {
    from   := f1;
    to     := f3;
    guard  := Q > 0 && 255 >= Q && G > F && G > 1 + F;
    action := R' = Q, S' = Q, I' = V, J' = W, T' = Q, K' = X, L' = Y, M' = Z, N' = B1, O' = C1, P' = D1, U' = A1, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
}
strategy dumb {
  Region init := { state = f300 };
}
