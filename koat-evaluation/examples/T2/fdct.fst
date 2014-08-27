model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1;
  states f0, f7, f62, f118;
  transition t0 := {
    from   := f0;
    to     := f7;
    guard  := true;
    action := A' = 8, B' = 0, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t1 := {
    from   := f7;
    to     := f7;
    guard  := 7 >= B;
    action := B' = B + 1, C' = U + V, D' = W, E' = X + Y, F' = Z, G' = A1 + B1, H' = C1, I' = D1 + E1, J' = F1, K' = U + V + D1 + E1, L' = U + V - D1 - E1, M' = X + Y + A1 + B1, N' = X + Y - A1 - B1, O' = -3196, P' = G1, Q' = H1, R' = I1 + J1, S' = K1 + J1, T' = J1, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t2 := {
    from   := f62;
    to     := f62;
    guard  := 7 >= B;
    action := B' = B + 1, C' = U + V, D' = W, E' = X + Y, F' = Z, G' = A1 + B1, H' = C1, I' = D1 + E1, J' = F1, K' = U + V + D1 + E1, L' = U + V - D1 - E1, M' = X + Y + A1 + B1, N' = X + Y - A1 - B1, O' = -3196, P' = G1, Q' = H1, R' = I1 + J1, S' = K1 + J1, T' = J1, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t3 := {
    from   := f62;
    to     := f118;
    guard  := B > 7;
    action := U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t4 := {
    from   := f7;
    to     := f62;
    guard  := B > 7;
    action := B' = 0, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
