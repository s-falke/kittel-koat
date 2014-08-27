model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1, N1, O1, P1, Q1, R1, S1, T1, U1, V1, W1, X1, Y1, Z1, A2, B2, C2, D2, E2, F2, G2, H2, I2, J2, K2, L2, M2, N2, O2, P2, Q2, R2, S2;
  states f1, f5, f7, f4, f6, f3;
  transition t0 := {
    from   := f1;
    to     := f1;
    guard  := A > B && B >= 0;
    action := C' = D, B' = 1 + B, E' = D, D' = C2, F' = D2, G' = B, H' = I, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t1 := {
    from   := f5;
    to     := f7;
    guard  := E2 > F2 && E2 > J && E2 > K && E2 > G2 && L >= 0 && C2 > 1 && M = 1;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, T' = H2, U' = V, W' = I, X' = K, Y' = I2, Z' = J2, A1' = K2, B1' = G2, C1' = J, D1' = E1, L' = 1 + E1, M' = 1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t2 := {
    from   := f5;
    to     := f7;
    guard  := E2 > F2 && E2 > J && E2 > K && G2 > E2 && L >= 0 && C2 > 1 && M = 1;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, T' = H2, U' = V, W' = I, X' = K, Y' = I2, Z' = J2, A1' = K2, B1' = G2, C1' = J, D1' = E1, L' = 1 + E1, M' = 1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t3 := {
    from   := f5;
    to     := f7;
    guard  := E2 > F2 && E2 > J && K > E2 && E2 > G2 && L >= 0 && C2 > 1 && M = 1;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, T' = H2, U' = V, W' = I, X' = K, Y' = I2, Z' = J2, A1' = K2, B1' = G2, C1' = J, D1' = E1, L' = 1 + E1, M' = 1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t4 := {
    from   := f5;
    to     := f7;
    guard  := E2 > F2 && E2 > J && K > E2 && G2 > E2 && L >= 0 && C2 > 1 && M = 1;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, T' = H2, U' = V, W' = I, X' = K, Y' = I2, Z' = J2, A1' = K2, B1' = G2, C1' = J, D1' = E1, L' = 1 + E1, M' = 1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t5 := {
    from   := f5;
    to     := f7;
    guard  := E2 > F2 && J > E2 && E2 > K && E2 > G2 && L >= 0 && C2 > 1 && M = 1;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, T' = H2, U' = V, W' = I, X' = K, Y' = I2, Z' = J2, A1' = K2, B1' = G2, C1' = J, D1' = E1, L' = 1 + E1, M' = 1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t6 := {
    from   := f5;
    to     := f7;
    guard  := E2 > F2 && J > E2 && E2 > K && G2 > E2 && L >= 0 && C2 > 1 && M = 1;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, T' = H2, U' = V, W' = I, X' = K, Y' = I2, Z' = J2, A1' = K2, B1' = G2, C1' = J, D1' = E1, L' = 1 + E1, M' = 1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t7 := {
    from   := f5;
    to     := f7;
    guard  := E2 > F2 && J > E2 && K > E2 && E2 > G2 && L >= 0 && C2 > 1 && M = 1;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, T' = H2, U' = V, W' = I, X' = K, Y' = I2, Z' = J2, A1' = K2, B1' = G2, C1' = J, D1' = E1, L' = 1 + E1, M' = 1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t8 := {
    from   := f5;
    to     := f7;
    guard  := E2 > F2 && J > E2 && K > E2 && G2 > E2 && L >= 0 && C2 > 1 && M = 1;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, T' = H2, U' = V, W' = I, X' = K, Y' = I2, Z' = J2, A1' = K2, B1' = G2, C1' = J, D1' = E1, L' = 1 + E1, M' = 1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t9 := {
    from   := f5;
    to     := f7;
    guard  := F2 > E2 && E2 > J && E2 > K && E2 > G2 && L >= 0 && C2 > 1 && M = 1;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, T' = H2, U' = V, W' = I, X' = K, Y' = I2, Z' = J2, A1' = K2, B1' = G2, C1' = J, D1' = E1, L' = 1 + E1, M' = 1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t10 := {
    from   := f5;
    to     := f7;
    guard  := F2 > E2 && E2 > J && E2 > K && G2 > E2 && L >= 0 && C2 > 1 && M = 1;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, T' = H2, U' = V, W' = I, X' = K, Y' = I2, Z' = J2, A1' = K2, B1' = G2, C1' = J, D1' = E1, L' = 1 + E1, M' = 1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t11 := {
    from   := f5;
    to     := f7;
    guard  := F2 > E2 && E2 > J && K > E2 && E2 > G2 && L >= 0 && C2 > 1 && M = 1;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, T' = H2, U' = V, W' = I, X' = K, Y' = I2, Z' = J2, A1' = K2, B1' = G2, C1' = J, D1' = E1, L' = 1 + E1, M' = 1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t12 := {
    from   := f5;
    to     := f7;
    guard  := F2 > E2 && E2 > J && K > E2 && G2 > E2 && L >= 0 && C2 > 1 && M = 1;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, T' = H2, U' = V, W' = I, X' = K, Y' = I2, Z' = J2, A1' = K2, B1' = G2, C1' = J, D1' = E1, L' = 1 + E1, M' = 1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t13 := {
    from   := f5;
    to     := f7;
    guard  := F2 > E2 && J > E2 && E2 > K && E2 > G2 && L >= 0 && C2 > 1 && M = 1;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, T' = H2, U' = V, W' = I, X' = K, Y' = I2, Z' = J2, A1' = K2, B1' = G2, C1' = J, D1' = E1, L' = 1 + E1, M' = 1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t14 := {
    from   := f5;
    to     := f7;
    guard  := F2 > E2 && J > E2 && E2 > K && G2 > E2 && L >= 0 && C2 > 1 && M = 1;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, T' = H2, U' = V, W' = I, X' = K, Y' = I2, Z' = J2, A1' = K2, B1' = G2, C1' = J, D1' = E1, L' = 1 + E1, M' = 1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t15 := {
    from   := f5;
    to     := f7;
    guard  := F2 > E2 && J > E2 && K > E2 && E2 > G2 && L >= 0 && C2 > 1 && M = 1;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, T' = H2, U' = V, W' = I, X' = K, Y' = I2, Z' = J2, A1' = K2, B1' = G2, C1' = J, D1' = E1, L' = 1 + E1, M' = 1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t16 := {
    from   := f5;
    to     := f7;
    guard  := F2 > E2 && J > E2 && K > E2 && G2 > E2 && L >= 0 && C2 > 1 && M = 1;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, T' = H2, U' = V, W' = I, X' = K, Y' = I2, Z' = J2, A1' = K2, B1' = G2, C1' = J, D1' = E1, L' = 1 + E1, M' = 1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t17 := {
    from   := f5;
    to     := f4;
    guard  := L >= 0 && D2 > F2 && C2 > 1 && J = P;
    action := N' = C2, O' = D2, J' = H2, F1' = I2, Q' = J2, P' = K2, R' = G2, C1' = E2, G1' = F2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t18 := {
    from   := f5;
    to     := f4;
    guard  := L >= 0 && F2 > D2 && C2 > 1 && J = P;
    action := N' = C2, O' = D2, J' = H2, F1' = I2, Q' = J2, P' = K2, R' = G2, C1' = E2, G1' = F2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t19 := {
    from   := f6;
    to     := f7;
    guard  := J2 > K && J2 > J && J2 > I2 && C2 > 1 && D1 >= 0;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, C1' = J, H1' = H2, I1' = I2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t20 := {
    from   := f6;
    to     := f7;
    guard  := J2 > K && J2 > J && I2 > J2 && C2 > 1 && D1 >= 0;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, C1' = J, H1' = H2, I1' = I2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t21 := {
    from   := f6;
    to     := f7;
    guard  := J2 > K && J > J2 && J2 > I2 && C2 > 1 && D1 >= 0;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, C1' = J, H1' = H2, I1' = I2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t22 := {
    from   := f6;
    to     := f7;
    guard  := J2 > K && J > J2 && I2 > J2 && C2 > 1 && D1 >= 0;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, C1' = J, H1' = H2, I1' = I2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t23 := {
    from   := f6;
    to     := f7;
    guard  := K > J2 && J2 > J && J2 > I2 && C2 > 1 && D1 >= 0;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, C1' = J, H1' = H2, I1' = I2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t24 := {
    from   := f6;
    to     := f7;
    guard  := K > J2 && J2 > J && I2 > J2 && C2 > 1 && D1 >= 0;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, C1' = J, H1' = H2, I1' = I2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t25 := {
    from   := f6;
    to     := f7;
    guard  := K > J2 && J > J2 && J2 > I2 && C2 > 1 && D1 >= 0;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, C1' = J, H1' = H2, I1' = I2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t26 := {
    from   := f6;
    to     := f7;
    guard  := K > J2 && J > J2 && I2 > J2 && C2 > 1 && D1 >= 0;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, C1' = J, H1' = H2, I1' = I2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t27 := {
    from   := f6;
    to     := f4;
    guard  := D1 >= 0 && C2 > 1 && D2 > F2 && D2 > K && J = P;
    action := N' = C2, O' = D2, J' = H2, F1' = I2, Q' = J2, P' = K2, R' = G2, C1' = E2, J1' = F2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t28 := {
    from   := f6;
    to     := f4;
    guard  := D1 >= 0 && C2 > 1 && D2 > F2 && K > D2 && J = P;
    action := N' = C2, O' = D2, J' = H2, F1' = I2, Q' = J2, P' = K2, R' = G2, C1' = E2, J1' = F2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t29 := {
    from   := f6;
    to     := f4;
    guard  := D1 >= 0 && C2 > 1 && F2 > D2 && D2 > K && J = P;
    action := N' = C2, O' = D2, J' = H2, F1' = I2, Q' = J2, P' = K2, R' = G2, C1' = E2, J1' = F2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t30 := {
    from   := f6;
    to     := f4;
    guard  := D1 >= 0 && C2 > 1 && F2 > D2 && K > D2 && J = P;
    action := N' = C2, O' = D2, J' = H2, F1' = I2, Q' = J2, P' = K2, R' = G2, C1' = E2, J1' = F2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t31 := {
    from   := f7;
    to     := f7;
    guard  := J2 > K2 && J2 > J && J2 > I2 && J2 > K && G2 >= 0 && C2 > 1 && E1 >= 0;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, C1' = J, E1' = -1 + E1, M' = M + 1, K1' = H2, L1' = I2, M1' = V, N1' = I, O1' = K, P1' = M + 1, Q1' = -1 + E1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t32 := {
    from   := f7;
    to     := f7;
    guard  := J2 > K2 && J2 > J && J2 > I2 && K > J2 && G2 >= 0 && C2 > 1 && E1 >= 0;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, C1' = J, E1' = -1 + E1, M' = M + 1, K1' = H2, L1' = I2, M1' = V, N1' = I, O1' = K, P1' = M + 1, Q1' = -1 + E1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t33 := {
    from   := f7;
    to     := f7;
    guard  := J2 > K2 && J2 > J && I2 > J2 && J2 > K && G2 >= 0 && C2 > 1 && E1 >= 0;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, C1' = J, E1' = -1 + E1, M' = M + 1, K1' = H2, L1' = I2, M1' = V, N1' = I, O1' = K, P1' = M + 1, Q1' = -1 + E1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t34 := {
    from   := f7;
    to     := f7;
    guard  := J2 > K2 && J2 > J && I2 > J2 && K > J2 && G2 >= 0 && C2 > 1 && E1 >= 0;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, C1' = J, E1' = -1 + E1, M' = M + 1, K1' = H2, L1' = I2, M1' = V, N1' = I, O1' = K, P1' = M + 1, Q1' = -1 + E1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t35 := {
    from   := f7;
    to     := f7;
    guard  := J2 > K2 && J > J2 && J2 > I2 && J2 > K && G2 >= 0 && C2 > 1 && E1 >= 0;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, C1' = J, E1' = -1 + E1, M' = M + 1, K1' = H2, L1' = I2, M1' = V, N1' = I, O1' = K, P1' = M + 1, Q1' = -1 + E1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t36 := {
    from   := f7;
    to     := f7;
    guard  := J2 > K2 && J > J2 && J2 > I2 && K > J2 && G2 >= 0 && C2 > 1 && E1 >= 0;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, C1' = J, E1' = -1 + E1, M' = M + 1, K1' = H2, L1' = I2, M1' = V, N1' = I, O1' = K, P1' = M + 1, Q1' = -1 + E1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t37 := {
    from   := f7;
    to     := f7;
    guard  := J2 > K2 && J > J2 && I2 > J2 && J2 > K && G2 >= 0 && C2 > 1 && E1 >= 0;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, C1' = J, E1' = -1 + E1, M' = M + 1, K1' = H2, L1' = I2, M1' = V, N1' = I, O1' = K, P1' = M + 1, Q1' = -1 + E1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t38 := {
    from   := f7;
    to     := f7;
    guard  := J2 > K2 && J > J2 && I2 > J2 && K > J2 && G2 >= 0 && C2 > 1 && E1 >= 0;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, C1' = J, E1' = -1 + E1, M' = M + 1, K1' = H2, L1' = I2, M1' = V, N1' = I, O1' = K, P1' = M + 1, Q1' = -1 + E1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t39 := {
    from   := f7;
    to     := f7;
    guard  := K2 > J2 && J2 > J && J2 > I2 && J2 > K && G2 >= 0 && C2 > 1 && E1 >= 0;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, C1' = J, E1' = -1 + E1, M' = M + 1, K1' = H2, L1' = I2, M1' = V, N1' = I, O1' = K, P1' = M + 1, Q1' = -1 + E1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t40 := {
    from   := f7;
    to     := f7;
    guard  := K2 > J2 && J2 > J && J2 > I2 && K > J2 && G2 >= 0 && C2 > 1 && E1 >= 0;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, C1' = J, E1' = -1 + E1, M' = M + 1, K1' = H2, L1' = I2, M1' = V, N1' = I, O1' = K, P1' = M + 1, Q1' = -1 + E1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t41 := {
    from   := f7;
    to     := f7;
    guard  := K2 > J2 && J2 > J && I2 > J2 && J2 > K && G2 >= 0 && C2 > 1 && E1 >= 0;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, C1' = J, E1' = -1 + E1, M' = M + 1, K1' = H2, L1' = I2, M1' = V, N1' = I, O1' = K, P1' = M + 1, Q1' = -1 + E1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t42 := {
    from   := f7;
    to     := f7;
    guard  := K2 > J2 && J2 > J && I2 > J2 && K > J2 && G2 >= 0 && C2 > 1 && E1 >= 0;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, C1' = J, E1' = -1 + E1, M' = M + 1, K1' = H2, L1' = I2, M1' = V, N1' = I, O1' = K, P1' = M + 1, Q1' = -1 + E1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t43 := {
    from   := f7;
    to     := f7;
    guard  := K2 > J2 && J > J2 && J2 > I2 && J2 > K && G2 >= 0 && C2 > 1 && E1 >= 0;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, C1' = J, E1' = -1 + E1, M' = M + 1, K1' = H2, L1' = I2, M1' = V, N1' = I, O1' = K, P1' = M + 1, Q1' = -1 + E1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t44 := {
    from   := f7;
    to     := f7;
    guard  := K2 > J2 && J > J2 && J2 > I2 && K > J2 && G2 >= 0 && C2 > 1 && E1 >= 0;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, C1' = J, E1' = -1 + E1, M' = M + 1, K1' = H2, L1' = I2, M1' = V, N1' = I, O1' = K, P1' = M + 1, Q1' = -1 + E1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t45 := {
    from   := f7;
    to     := f7;
    guard  := K2 > J2 && J > J2 && I2 > J2 && J2 > K && G2 >= 0 && C2 > 1 && E1 >= 0;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, C1' = J, E1' = -1 + E1, M' = M + 1, K1' = H2, L1' = I2, M1' = V, N1' = I, O1' = K, P1' = M + 1, Q1' = -1 + E1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t46 := {
    from   := f7;
    to     := f7;
    guard  := K2 > J2 && J > J2 && I2 > J2 && K > J2 && G2 >= 0 && C2 > 1 && E1 >= 0;
    action := N' = C2, O' = P, Q' = D2, R' = J, S' = D2, C1' = J, E1' = -1 + E1, M' = M + 1, K1' = H2, L1' = I2, M1' = V, N1' = I, O1' = K, P1' = M + 1, Q1' = -1 + E1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t47 := {
    from   := f7;
    to     := f4;
    guard  := M >= 0 && E1 >= 0 && C2 > 1 && D2 > F2 && D2 > K && J = P;
    action := N' = C2, O' = D2, J' = H2, F1' = I2, Q' = J2, P' = K2, R' = G2, C1' = E2, R1' = F2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t48 := {
    from   := f7;
    to     := f4;
    guard  := M >= 0 && E1 >= 0 && C2 > 1 && D2 > F2 && K > D2 && J = P;
    action := N' = C2, O' = D2, J' = H2, F1' = I2, Q' = J2, P' = K2, R' = G2, C1' = E2, R1' = F2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t49 := {
    from   := f7;
    to     := f4;
    guard  := M >= 0 && E1 >= 0 && C2 > 1 && F2 > D2 && D2 > K && J = P;
    action := N' = C2, O' = D2, J' = H2, F1' = I2, Q' = J2, P' = K2, R' = G2, C1' = E2, R1' = F2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t50 := {
    from   := f7;
    to     := f4;
    guard  := M >= 0 && E1 >= 0 && C2 > 1 && F2 > D2 && K > D2 && J = P;
    action := N' = C2, O' = D2, J' = H2, F1' = I2, Q' = J2, P' = K2, R' = G2, C1' = E2, R1' = F2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t51 := {
    from   := f3;
    to     := f4;
    guard  := 0 >= L2 && 0 >= N && 0 >= J2;
    action := A' = C2, S1' = D2, C' = H2, B' = I2, N' = J2, J' = K2, T1' = G2, F1' = E2, U1' = F2, E' = M2, D' = N2, Q' = O2, P' = P2, R' = Q2, C1' = R2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t52 := {
    from   := f3;
    to     := f1;
    guard  := N > 1;
    action := A' = N, S1' = C2, C' = D2, B' = 2, O' = C2, U1' = D2, E' = D2, D' = H2, V1' = I2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t53 := {
    from   := f1;
    to     := f7;
    guard  := Q2 > 1 && W1 >= Q2 && J2 > 1 && W1 >= J2 && O > K && B >= A && B >= 0 && W1 >= 0 && M = 0 && J = K;
    action := A' = C2, S1' = D2, C' = H2, B' = I2, N' = J2, T1' = K2, F1' = G2, U1' = E2, E' = F2, D' = M2, Q' = N2, P' = O, R' = J, S' = N2, W1' = E1 + 1, C1' = J, L' = E1, M' = 0, K' = J, X1' = V, Y1' = I, Z1' = O2, A2' = P2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t54 := {
    from   := f1;
    to     := f7;
    guard  := Q2 > 1 && W1 >= Q2 && J2 > 1 && W1 >= J2 && K > O && B >= A && B >= 0 && W1 >= 0 && M = 0 && J = K;
    action := A' = C2, S1' = D2, C' = H2, B' = I2, N' = J2, T1' = K2, F1' = G2, U1' = E2, E' = F2, D' = M2, Q' = N2, P' = O, R' = J, S' = N2, W1' = E1 + 1, C1' = J, L' = E1, M' = 0, K' = J, X1' = V, Y1' = I, Z1' = O2, A2' = P2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t55 := {
    from   := f1;
    to     := f4;
    guard  := L2 > 1 && W1 >= L2 && J2 > 1 && W1 >= J2 && B >= A && W1 >= 0 && B >= 0 && O = J;
    action := A' = C2, S1' = D2, C' = H2, B' = I2, N' = J2, J' = K2, T1' = G2, F1' = E2, U1' = F2, E' = M2, D' = N2, Q' = O2, P' = P2, R' = Q2, C1' = R2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t56 := {
    from   := f3;
    to     := f4;
    guard  := N = 1;
    action := A' = C2, S1' = D2, C' = H2, B' = I2, N' = 1, O' = J, J' = J2, T1' = K2, F1' = G2, U1' = E2, E' = F2, D' = M2, Q' = N2, P' = O2, R' = P2, C1' = Q2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t57 := {
    from   := f3;
    to     := f4;
    guard  := 0 > 0 && J2 > S2 && N = 1;
    action := A' = C2, S1' = D2, C' = H2, B' = I2, N' = 1, O' = J2, J' = K2, T1' = G2, F1' = E2, U1' = F2, E' = M2, D' = N2, Q' = O2, P' = P2, R' = Q2, S' = R2, C1' = L2, B2' = S2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t58 := {
    from   := f3;
    to     := f4;
    guard  := 0 > 0 && S2 > J2 && N = 1;
    action := A' = C2, S1' = D2, C' = H2, B' = I2, N' = 1, O' = J2, J' = K2, T1' = G2, F1' = E2, U1' = F2, E' = M2, D' = N2, Q' = O2, P' = P2, R' = Q2, S' = R2, C1' = L2, B2' = S2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t59 := {
    from   := f3;
    to     := f4;
    guard  := 0 > 0 && J2 > S2 && N = 1;
    action := A' = C2, S1' = D2, C' = H2, B' = I2, N' = 1, O' = J2, J' = K2, T1' = G2, F1' = E2, U1' = F2, E' = M2, D' = N2, Q' = O2, P' = P2, R' = Q2, S' = R2, C1' = L2, B2' = S2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
  transition t60 := {
    from   := f3;
    to     := f4;
    guard  := 0 > 0 && S2 > J2 && N = 1;
    action := A' = C2, S1' = D2, C' = H2, B' = I2, N' = 1, O' = J2, J' = K2, T1' = G2, F1' = E2, U1' = F2, E' = M2, D' = N2, Q' = O2, P' = P2, R' = Q2, S' = R2, C1' = L2, B2' = S2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?, S2' = ?;
  };
}
strategy dumb {
  Region init := { state = f3 };
}
