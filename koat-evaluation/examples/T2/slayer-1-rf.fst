model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1, N1, O1, P1, Q1, R1, S1, T1, U1, V1, W1, X1, Y1, Z1, A2, B2, C2, D2, E2, F2, G2, H2, I2, J2, K2, L2, M2, N2, O2, P2, Q2;
  states f12, f116, f13, f300, f1, f7, f8, f10, f9;
  transition t0 := {
    from   := f12;
    to     := f116;
    guard  := A > 1 && Y1 >= A && B >= 0 && C = 1;
    action := D' = -1, E' = F, G' = Z1, H' = 1 + F, I' = A2, J' = Z1, C' = 1, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t1 := {
    from   := f13;
    to     := f116;
    guard  := E >= 0 && A > 1;
    action := E' = Z1, J' = A2, F' = -1 + Z1, C' = 2, K' = 2, L' = -1, M' = Y1, N' = B2, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t2 := {
    from   := f116;
    to     := f300;
    guard  := F >= O && P = 1;
    action := P' = 1, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t3 := {
    from   := f1;
    to     := f1;
    guard  := B >= 0 && Q > B;
    action := B' = 1 + B, R' = S, T' = S, S' = Z1, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t4 := {
    from   := f1;
    to     := f116;
    guard  := A > 1 && C2 >= A && F >= A && B >= Q && B >= 0 && C = 0;
    action := U' = R, B' = Z1, C' = 0, V' = R, Q' = A2, R' = Y1, T' = B2, S' = D2, W' = E2, X' = F2, Y' = G2, Z' = Z1, A1' = C2, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t5 := {
    from   := f7;
    to     := f8;
    guard  := B1 >= 0;
    action := C1' = D1, B1' = Z1, E1' = -1 + Z1, F1' = -1, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t6 := {
    from   := f7;
    to     := f10;
    guard  := B1 >= 0 && G1 = D1;
    action := H1' = Z1, I1' = A2, J1' = Y1, G1' = B2, D1' = D2, Y' = E2, C1' = F2, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t7 := {
    from   := f8;
    to     := f8;
    guard  := E1 >= 0 && A > 1 && I1 = 0 && H1 = V && G1 = 0 && U = 0 && J1 = V;
    action := I1' = 0, J1' = H1, G1' = 0, U' = 0, V' = H1, C1' = D1, E1' = -1 + E1, K1' = -1 + E1, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t8 := {
    from   := f8;
    to     := f10;
    guard  := E1 >= 0 && G1 = D1;
    action := H1' = Z1, I1' = A2, J1' = Y1, G1' = B2, D1' = D2, A' = E2, Y' = F2, C1' = G2, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t9 := {
    from   := f13;
    to     := f8;
    guard  := A > 1 && U = 0 && E = 0 && C = 1;
    action := H1' = V, I1' = 0, J1' = V, G1' = 0, D1' = V, U' = 0, E' = 0, C' = E1 + 1, C1' = V, L1' = -1, B1' = E1, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t10 := {
    from   := f116;
    to     := f116;
    guard  := A > 1 && C >= 0 && F >= 0 && P = 0 && U = M1;
    action := F' = -1 + F, C' = 1 + C, P' = 1, O' = F, N1' = 1 + C, O1' = -1 + F, M1' = U, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t11 := {
    from   := f116;
    to     := f8;
    guard  := Z1 >= 0 && A > 1 && C >= 0 && F >= 0 && U = 0 && P = 0;
    action := H1' = V, I1' = 0, J1' = V, G1' = 0, D1' = V, U' = 0, C' = E1 + 1, P1' = Z1, P' = 1, O' = F, C1' = V, L1' = -1, B1' = E1, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t12 := {
    from   := f9;
    to     := f1;
    guard  := Z1 > 1 && S = W;
    action := B' = 2, A' = Z1, Q1' = A2, P' = 0, R1' = Y1, Q' = Z1, R' = S, T' = S, S' = B2, S1' = D2, W' = S, T1' = 2, U1' = E2, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t13 := {
    from   := f9;
    to     := f10;
    guard  := 0 >= F2;
    action := H1' = Z1, I1' = A2, J1' = Y1, G1' = B2, D1' = D2, U' = 0, B' = E2, A' = F2, V' = 0, P' = 0, R1' = G2, Q' = C2, R' = H2, T' = I2, S' = J2, W' = K2, X' = L2, Y' = M2, C1' = N2, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t14 := {
    from   := f9;
    to     := f10;
    guard  := S = 0 && W = 0;
    action := H1' = Z1, I1' = A2, J1' = Y1, G1' = B2, D1' = D2, U' = 0, B' = E2, A' = 1, V' = 0, V1' = F2, Q1' = G2, W1' = G2, P' = 0, R1' = C2, Q' = H2, R' = I2, T' = J2, S' = K2, S1' = L2, W' = M2, X' = N2, Y' = O2, X1' = P2, C1' = Q2, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
}
strategy dumb {
  Region init := { state = f9 };
}
