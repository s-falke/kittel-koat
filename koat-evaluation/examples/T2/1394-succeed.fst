model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1, N1, O1, P1, Q1, R1, S1, T1, U1, V1, W1, X1, Y1, Z1, A2, B2, C2, D2, E2, F2, G2, H2, I2, J2, K2, L2, M2, N2, O2, P2;
  states f81, f83, f31, f42, f67, f77, f235, f237, f240, f211, f144, f172, f104, f0;
  transition t0 := {
    from   := f81;
    to     := f83;
    guard  := 0 >= A;
    action := L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t1 := {
    from   := f31;
    to     := f31;
    guard  := 0 >= L2 && B > 0;
    action := B' = B - 1, C' = L2, D' = L2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t2 := {
    from   := f31;
    to     := f42;
    guard  := B > 0 && L2 > 0 && 0 >= M2;
    action := B' = B - 1, C' = L2, D' = L2, E' = M2, F' = N2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t3 := {
    from   := f83;
    to     := f67;
    guard  := 0 >= G;
    action := L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t4 := {
    from   := f67;
    to     := f77;
    guard  := H > 0 && 0 >= M2;
    action := H' = H - 1, G' = L2, I' = M2, J' = N2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t5 := {
    from   := f77;
    to     := f81;
    guard  := 0 >= J;
    action := A' = L2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t6 := {
    from   := f235;
    to     := f235;
    guard  := true;
    action := L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t7 := {
    from   := f237;
    to     := f240;
    guard  := true;
    action := L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t8 := {
    from   := f211;
    to     := f211;
    guard  := K > 0;
    action := K' = K - 1, L' = 0, M' = L2, N' = 0, O' = 0, P' = 2, Q' = L2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t9 := {
    from   := f211;
    to     := f235;
    guard  := 0 >= K;
    action := R' = 0, S' = L2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t10 := {
    from   := f144;
    to     := f211;
    guard  := 0 >= T;
    action := U' = 0, R' = 0, V' = L2, W' = M2, K' = M2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t11 := {
    from   := f172;
    to     := f144;
    guard  := X > 0;
    action := U' = 0, Y' = 0, Z' = X, A1' = X, B1' = 0, C1' = D1, E1' = X, F1' = 0, G1' = X, H1' = D1, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t12 := {
    from   := f172;
    to     := f144;
    guard  := 0 >= X;
    action := U' = 0, Z' = X, I1' = D1, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t13 := {
    from   := f144;
    to     := f144;
    guard  := T > 0 && 0 >= L2;
    action := U' = 0, R' = 0, T' = T - 1, J1' = L2, K1' = L2, L1' = M2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t14 := {
    from   := f144;
    to     := f144;
    guard  := T > 0 && L2 > 0;
    action := U' = 0, R' = 0, T' = T - 1, J1' = L2, K1' = L2, L1' = M2, Z' = N2, D1' = 0, M1' = O2, N1' = O2, O1' = 0, P1' = 0, Q1' = 0, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t15 := {
    from   := f144;
    to     := f172;
    guard  := 0 > O2 && T > 0 && L2 > 0;
    action := R' = 0, T' = T - 1, J1' = L2, K1' = L2, L1' = M2, Z' = N2, D1' = O2, M1' = P2, N1' = P2, O1' = 0, P1' = O2, Q1' = O2, R1' = 1, S1' = 0, X' = 0, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t16 := {
    from   := f144;
    to     := f172;
    guard  := O2 > 0 && T > 0 && L2 > 0;
    action := R' = 0, T' = T - 1, J1' = L2, K1' = L2, L1' = M2, Z' = N2, D1' = O2, M1' = P2, N1' = P2, O1' = 0, P1' = O2, Q1' = O2, R1' = 1, S1' = 0, X' = 0, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t17 := {
    from   := f104;
    to     := f144;
    guard  := 0 >= L2;
    action := U' = 0, R' = 0, T1' = L2, U1' = L2, V1' = M2, W1' = N2, T' = N2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t18 := {
    from   := f104;
    to     := f104;
    guard  := L2 > 0;
    action := U' = 0, R' = 0, T1' = L2, U1' = L2 - 1, X1' = M2, Y1' = N2, Z1' = O2, A2' = M2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t19 := {
    from   := f83;
    to     := f67;
    guard  := G > 0;
    action := L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t20 := {
    from   := f81;
    to     := f83;
    guard  := A > 0;
    action := L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t21 := {
    from   := f77;
    to     := f81;
    guard  := J > 0;
    action := A' = L2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t22 := {
    from   := f67;
    to     := f77;
    guard  := H > 0 && M2 > 0;
    action := H' = H - 1, G' = L2, I' = M2, J' = N2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t23 := {
    from   := f67;
    to     := f104;
    guard  := 0 >= H;
    action := U' = 0, R' = 0, B2' = L2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t24 := {
    from   := f42;
    to     := f31;
    guard  := 0 >= F;
    action := C2' = D, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t25 := {
    from   := f42;
    to     := f31;
    guard  := F > 0;
    action := C2' = D, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t26 := {
    from   := f31;
    to     := f42;
    guard  := B > 0 && L2 > 0 && M2 > 0;
    action := B' = B - 1, C' = L2, D' = L2, E' = M2, F' = N2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t27 := {
    from   := f31;
    to     := f67;
    guard  := 0 >= B;
    action := U' = 0, R' = 0, D2' = L2, E2' = M2, H' = M2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t28 := {
    from   := f0;
    to     := f31;
    guard  := 0 >= L2;
    action := U' = 0, R' = 0, F2' = L2, Y' = 0, G2' = 0, H2' = M2, B' = M2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t29 := {
    from   := f0;
    to     := f31;
    guard  := L2 > 0;
    action := U' = 0, R' = 0, F2' = L2, I2' = M2, J2' = N2, K2' = 0, Y' = 0, G2' = 0, H2' = O2, B' = O2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
