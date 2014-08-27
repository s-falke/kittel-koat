model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1, N1, O1, P1, Q1, R1, S1, T1, U1, V1, W1, X1, Y1, Z1, A2, B2, C2, D2, E2, F2, G2, H2, I2, J2, K2, L2, M2, N2, O2, P2, Q2;
  states f81, f83, f31, f42, f67, f77, f237, f239, f242, f211, f144, f172, f104, f0;
  transition t0 := {
    from   := f81;
    to     := f83;
    guard  := 0 >= A;
    action := M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t1 := {
    from   := f31;
    to     := f31;
    guard  := 0 >= M2 && B > 0;
    action := B' = B - 1, C' = M2, D' = M2, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t2 := {
    from   := f31;
    to     := f42;
    guard  := B > 0 && M2 > 0 && 0 >= N2;
    action := B' = B - 1, C' = M2, D' = M2, E' = N2, F' = O2, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t3 := {
    from   := f83;
    to     := f67;
    guard  := 0 >= G;
    action := M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t4 := {
    from   := f67;
    to     := f77;
    guard  := H > 0 && 0 >= N2;
    action := H' = H - 1, G' = M2, I' = N2, J' = O2, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t5 := {
    from   := f77;
    to     := f81;
    guard  := 0 >= J;
    action := A' = M2, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t6 := {
    from   := f237;
    to     := f237;
    guard  := true;
    action := M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t7 := {
    from   := f239;
    to     := f242;
    guard  := true;
    action := M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t8 := {
    from   := f211;
    to     := f211;
    guard  := K > 0 && 0 >= N2;
    action := L' = 0, M' = M2, N' = N2, O' = 0, P' = 0, Q' = 2, R' = M2, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t9 := {
    from   := f211;
    to     := f211;
    guard  := K > 0 && N2 > 0;
    action := K' = K - 1, L' = 0, M' = M2, N' = N2, O' = 0, P' = 0, Q' = 2, R' = M2, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t10 := {
    from   := f211;
    to     := f237;
    guard  := 0 >= K;
    action := S' = 0, T' = M2, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t11 := {
    from   := f144;
    to     := f211;
    guard  := 0 >= U;
    action := V' = 0, S' = 0, W' = M2, X' = N2, K' = N2, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t12 := {
    from   := f172;
    to     := f144;
    guard  := Y > 0;
    action := V' = 0, Z' = 0, A1' = Y, B1' = Y, C1' = 0, D1' = E1, F1' = Y, G1' = 0, H1' = Y, I1' = E1, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t13 := {
    from   := f172;
    to     := f144;
    guard  := 0 >= Y;
    action := V' = 0, A1' = Y, J1' = E1, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t14 := {
    from   := f144;
    to     := f144;
    guard  := U > 0 && 0 >= M2;
    action := V' = 0, S' = 0, U' = U - 1, K1' = M2, L1' = M2, M1' = N2, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t15 := {
    from   := f144;
    to     := f144;
    guard  := U > 0 && M2 > 0;
    action := V' = 0, S' = 0, U' = U - 1, K1' = M2, L1' = M2, M1' = N2, A1' = O2, E1' = 0, N1' = P2, O1' = P2, P1' = 0, Q1' = 0, R1' = 0, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t16 := {
    from   := f144;
    to     := f172;
    guard  := 0 > P2 && U > 0 && M2 > 0;
    action := S' = 0, U' = U - 1, K1' = M2, L1' = M2, M1' = N2, A1' = O2, E1' = P2, N1' = Q2, O1' = Q2, P1' = 0, Q1' = P2, R1' = P2, S1' = 1, T1' = 0, Y' = 0, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t17 := {
    from   := f144;
    to     := f172;
    guard  := P2 > 0 && U > 0 && M2 > 0;
    action := S' = 0, U' = U - 1, K1' = M2, L1' = M2, M1' = N2, A1' = O2, E1' = P2, N1' = Q2, O1' = Q2, P1' = 0, Q1' = P2, R1' = P2, S1' = 1, T1' = 0, Y' = 0, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t18 := {
    from   := f104;
    to     := f144;
    guard  := 0 >= M2;
    action := V' = 0, S' = 0, U1' = M2, V1' = M2, W1' = N2, X1' = O2, U' = O2, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t19 := {
    from   := f104;
    to     := f104;
    guard  := M2 > 0;
    action := V' = 0, S' = 0, U1' = M2, V1' = M2 - 1, Y1' = N2, Z1' = O2, A2' = P2, B2' = N2, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t20 := {
    from   := f83;
    to     := f67;
    guard  := G > 0;
    action := M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t21 := {
    from   := f81;
    to     := f83;
    guard  := A > 0;
    action := M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t22 := {
    from   := f77;
    to     := f81;
    guard  := J > 0;
    action := A' = M2, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t23 := {
    from   := f67;
    to     := f77;
    guard  := H > 0 && N2 > 0;
    action := H' = H - 1, G' = M2, I' = N2, J' = O2, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t24 := {
    from   := f67;
    to     := f104;
    guard  := 0 >= H;
    action := V' = 0, S' = 0, C2' = M2, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t25 := {
    from   := f42;
    to     := f31;
    guard  := 0 >= F;
    action := D2' = D, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t26 := {
    from   := f42;
    to     := f31;
    guard  := F > 0;
    action := D2' = D, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t27 := {
    from   := f31;
    to     := f42;
    guard  := B > 0 && M2 > 0 && N2 > 0;
    action := B' = B - 1, C' = M2, D' = M2, E' = N2, F' = O2, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t28 := {
    from   := f31;
    to     := f67;
    guard  := 0 >= B;
    action := V' = 0, S' = 0, E2' = M2, F2' = N2, H' = N2, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t29 := {
    from   := f0;
    to     := f31;
    guard  := 0 >= M2;
    action := V' = 0, S' = 0, G2' = M2, Z' = 0, H2' = 0, I2' = N2, B' = N2, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
  transition t30 := {
    from   := f0;
    to     := f31;
    guard  := M2 > 0;
    action := V' = 0, S' = 0, G2' = M2, J2' = N2, K2' = O2, L2' = 0, Z' = 0, H2' = 0, I2' = P2, B' = P2, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
