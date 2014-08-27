model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1, N1, O1, P1, Q1, R1, S1, T1, U1, V1, W1, X1, Y1, Z1, A2, B2, C2, D2;
  states f0, f75;
  transition t0 := {
    from   := f0;
    to     := f75;
    guard  := true;
    action := A' = 2, B' = W1, C' = W1, D' = W1, E' = W1, F' = W1, G' = 2, H' = X1, I' = X1, J' = X1, K' = X1, L' = X1, M' = 2, N' = Y1, O' = Y1, P' = Y1, Q' = Y1, R' = Y1, S' = 2, T' = Z1, U' = Z1, V' = Z1, W' = Z1, X' = Z1, Y' = 2, Z' = A2, A1' = A2, B1' = A2, C1' = A2, D1' = A2, E1' = 2, F1' = B2, G1' = B2, H1' = B2, I1' = B2, J1' = B2, K1' = 2, L1' = C2, M1' = C2, N1' = C2, O1' = C2, P1' = C2, Q1' = 2, R1' = D2, S1' = D2, T1' = D2, U1' = D2, V1' = D2, W1' = ?, X1' = ?, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
