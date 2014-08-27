model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1;
  states f0, f6, f14, f57, f101;
  transition t0 := {
    from   := f0;
    to     := f6;
    guard  := true;
    action := A' = 0, B' = 0, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t1 := {
    from   := f6;
    to     := f6;
    guard  := 63 >= B;
    action := A' = U, B' = B + 1, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t2 := {
    from   := f14;
    to     := f14;
    guard  := C >= 0;
    action := C' = C - 1, D' = U + V, E' = W, F' = X + Y, G' = Z, H' = A1 + B1, I' = C1, J' = D1 + E1, K' = F1, L' = U + V + D1 + E1, M' = U + V - D1 - E1, N' = X + Y + A1 + B1, O' = X + Y - A1 - B1, P' = G1, Q' = H1, R' = I1 + J1, S' = K1 + J1, T' = J1, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t3 := {
    from   := f57;
    to     := f57;
    guard  := C >= 0;
    action := C' = C - 1, D' = U + V, E' = W, F' = X + Y, G' = Z, H' = A1 + B1, I' = C1, J' = D1 + E1, K' = F1, L' = U + V + D1 + E1, M' = U + V - D1 - E1, N' = X + Y + A1 + B1, O' = X + Y - A1 - B1, P' = G1, Q' = H1, R' = I1 + J1, S' = K1 + J1, T' = J1, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t4 := {
    from   := f57;
    to     := f101;
    guard  := 0 > C;
    action := U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t5 := {
    from   := f14;
    to     := f57;
    guard  := 0 > C;
    action := C' = 7, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t6 := {
    from   := f6;
    to     := f14;
    guard  := B > 63;
    action := C' = 7, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
