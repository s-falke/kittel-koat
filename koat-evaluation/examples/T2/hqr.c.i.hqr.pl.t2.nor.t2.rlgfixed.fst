model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1, N1, O1, P1, Q1, R1, S1, T1, U1, V1, W1, X1, Y1, Z1, A2, B2, C2, D2, E2, F2, G2, H2, I2, J2, K2, L2, M2, N2, O2, P2, Q2, R2;
  states f44, f73, f75, f77, f144, f148, f152, f156, f2, f4, f7, f18, f23, f34, f31, f41, f61, f80, f93, f119, f124, f132, f138, f167, f181, f1;
  transition t0 := {
    from   := f44;
    to     := f73;
    guard  := A > 1 + B;
    action := C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t1 := {
    from   := f44;
    to     := f73;
    guard  := B >= A;
    action := C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t2 := {
    from   := f73;
    to     := f75;
    guard  := 29 >= C;
    action := C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t3 := {
    from   := f73;
    to     := f75;
    guard  := C > 30;
    action := C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t4 := {
    from   := f75;
    to     := f77;
    guard  := 9 >= C;
    action := C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t5 := {
    from   := f75;
    to     := f77;
    guard  := C > 10;
    action := C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t6 := {
    from   := f144;
    to     := f148;
    guard  := D = 0;
    action := D' = 0, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t7 := {
    from   := f152;
    to     := f156;
    guard  := 0 > E;
    action := C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t8 := {
    from   := f152;
    to     := f156;
    guard  := E > 0;
    action := C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t9 := {
    from   := f2;
    to     := f4;
    guard  := true;
    action := F' = 0, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t10 := {
    from   := f4;
    to     := f7;
    guard  := G >= H;
    action := C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t11 := {
    from   := f7;
    to     := f7;
    guard  := G >= I;
    action := F' = F + C2, I' = I + 1, J' = C2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t12 := {
    from   := f18;
    to     := f23;
    guard  := A > 0;
    action := C' = 0, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t13 := {
    from   := f23;
    to     := f34;
    guard  := 1 >= B;
    action := C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t14 := {
    from   := f23;
    to     := f31;
    guard  := 0 > C2 + D2 && B > 1;
    action := K' = C2, L' = D2, E' = C2 + D2, M' = E2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t15 := {
    from   := f23;
    to     := f31;
    guard  := C2 + D2 > 0 && B > 1;
    action := K' = C2, L' = D2, E' = C2 + D2, M' = E2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t16 := {
    from   := f23;
    to     := f31;
    guard  := B > 1;
    action := K' = -C2, L' = C2, E' = F, M' = D2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t17 := {
    from   := f31;
    to     := f34;
    guard  := true;
    action := C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t18 := {
    from   := f31;
    to     := f23;
    guard  := 0 > M;
    action := B' = B - 1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t19 := {
    from   := f31;
    to     := f23;
    guard  := M > 0;
    action := B' = B - 1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t20 := {
    from   := f34;
    to     := f41;
    guard  := A = B;
    action := A' = A - 1, B' = A, D' = C2, N' = A, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t21 := {
    from   := f34;
    to     := f44;
    guard  := A > B;
    action := D' = C2, O' = D2, P' = E2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t22 := {
    from   := f34;
    to     := f44;
    guard  := B > A;
    action := D' = C2, O' = D2, P' = E2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t23 := {
    from   := f44;
    to     := f61;
    guard  := C2 >= 0 && D2 >= 0 && B + 1 = A;
    action := B' = A - 1, D' = D + Q, R' = C2, S' = D2, T' = E2, U' = F2, V' = C2 + G2, W' = G2, X' = G2, Y' = D + Q + C2 + G2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t24 := {
    from   := f44;
    to     := f61;
    guard  := 0 > C2 && D2 >= 0 && B + 1 = A;
    action := B' = A - 1, D' = D + Q, R' = C2, S' = D2, T' = E2, U' = F2, V' = C2 - G2, X' = -G2, Z' = G2, Y' = D + Q + C2 - G2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t25 := {
    from   := f61;
    to     := f41;
    guard  := V = 0;
    action := A' = A - 2, V' = 0, A1' = 0, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t26 := {
    from   := f61;
    to     := f41;
    guard  := 0 > V;
    action := A' = A - 2, A1' = 0, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t27 := {
    from   := f61;
    to     := f41;
    guard  := V > 0;
    action := A' = A - 2, A1' = 0, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t28 := {
    from   := f44;
    to     := f41;
    guard  := 0 > D2 && B + 1 = A;
    action := A' = A - 2, B' = A - 1, D' = D + Q, R' = C2, S' = D2, T' = E2, U' = F2, V' = F2, B1' = D + Q + C2, C1' = F2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t29 := {
    from   := f73;
    to     := f75;
    guard  := C = 30;
    action := C' = 30, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t30 := {
    from   := f77;
    to     := f80;
    guard  := C = 20;
    action := Q' = Q + D, C' = 20, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t31 := {
    from   := f75;
    to     := f80;
    guard  := C = 10;
    action := Q' = Q + D, C' = 10, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t32 := {
    from   := f80;
    to     := f80;
    guard  := A >= H;
    action := H' = H + 1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t33 := {
    from   := f77;
    to     := f93;
    guard  := 19 >= C;
    action := C' = C + 1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t34 := {
    from   := f77;
    to     := f93;
    guard  := C > 20;
    action := C' = C + 1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t35 := {
    from   := f93;
    to     := f119;
    guard  := D1 >= B && B > D1;
    action := E' = C2 + D2 + E2, R' = F2, S' = G2, V' = H2, E1' = I2, F1' = C2, G1' = D2, H1' = E2, I1' = J2, J1' = K2, K1' = L2, L1' = M2, M1' = N2, N1' = O2, O1' = P2, P1' = Q2, Q1' = R2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t36 := {
    from   := f93;
    to     := f119;
    guard  := D1 > B;
    action := E' = C2 + D2 + E2, R' = F2, S' = G2, V' = H2, E1' = I2, F1' = C2, G1' = D2, H1' = E2, I1' = J2, J1' = K2, K1' = L2, L1' = M2, M1' = N2, N1' = O2, O1' = P2, P1' = Q2, Q1' = R2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t37 := {
    from   := f119;
    to     := f93;
    guard  := 0 > L1;
    action := D1' = D1 - 1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t38 := {
    from   := f119;
    to     := f93;
    guard  := L1 > 0;
    action := D1' = D1 - 1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t39 := {
    from   := f124;
    to     := f124;
    guard  := A > D1 + 1 && H = D1 + 2;
    action := H' = D1 + 3, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t40 := {
    from   := f124;
    to     := f124;
    guard  := D1 + 1 >= H && A >= H;
    action := H' = H + 1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t41 := {
    from   := f124;
    to     := f124;
    guard  := H > 2 + D1 && A >= H;
    action := H' = H + 1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t42 := {
    from   := f132;
    to     := f148;
    guard  := A > R1 && D1 = R1;
    action := R1' = D1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t43 := {
    from   := f132;
    to     := f138;
    guard  := D1 > R1 && A > R1;
    action := R' = C2, S' = D2, E1' = 0, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t44 := {
    from   := f132;
    to     := f138;
    guard  := R1 > D1 && A > R1;
    action := R' = C2, S' = D2, E1' = 0, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t45 := {
    from   := f138;
    to     := f144;
    guard  := R1 + 1 = A;
    action := D' = C2 + D2 + E2, R1' = A - 1, S1' = C2, T1' = D2, U1' = E2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t46 := {
    from   := f138;
    to     := f144;
    guard  := A > 1 + R1;
    action := D' = C2 + D2 + E2, E1' = F2, S1' = C2, T1' = D2, U1' = E2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t47 := {
    from   := f138;
    to     := f144;
    guard  := R1 >= A;
    action := D' = C2 + D2 + E2, E1' = F2, S1' = C2, T1' = D2, U1' = E2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t48 := {
    from   := f144;
    to     := f148;
    guard  := 0 > D;
    action := R' = C2, S' = D2, E1' = E2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t49 := {
    from   := f144;
    to     := f148;
    guard  := D > 0;
    action := R' = C2, S' = D2, E1' = E2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t50 := {
    from   := f148;
    to     := f152;
    guard  := R >= 0;
    action := E' = C2, V1' = D2, W1' = C2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t51 := {
    from   := f148;
    to     := f152;
    guard  := 0 > R;
    action := E' = -C2, X1' = D2, Y1' = C2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t52 := {
    from   := f156;
    to     := f167;
    guard  := B = R1 && D1 = R1;
    action := D' = C2, O' = D2, R' = R + E, S' = E2, V' = F2, D1' = B, E1' = G2, R1' = B, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t53 := {
    from   := f156;
    to     := f167;
    guard  := R1 > B && D1 = R1;
    action := D' = C2, O' = D2, R' = R + E, S' = E2, V' = F2, E1' = G2, R1' = D1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t54 := {
    from   := f156;
    to     := f167;
    guard  := B > R1 && D1 = R1;
    action := D' = C2, O' = D2, R' = R + E, S' = E2, V' = F2, E1' = G2, R1' = D1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t55 := {
    from   := f156;
    to     := f167;
    guard  := D1 > R1;
    action := D' = C2, O' = D2, R' = R + E, S' = E2, V' = F2, E1' = G2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t56 := {
    from   := f156;
    to     := f167;
    guard  := R1 > D1;
    action := D' = C2, O' = D2, R' = R + E, S' = E2, V' = F2, E1' = G2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t57 := {
    from   := f167;
    to     := f167;
    guard  := A >= I && R1 + 1 = A;
    action := I' = I + 1, R' = C2, R1' = A - 1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t58 := {
    from   := f167;
    to     := f167;
    guard  := A > 1 + R1 && A >= I;
    action := I' = I + 1, R' = C2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t59 := {
    from   := f167;
    to     := f167;
    guard  := R1 >= A && A >= I;
    action := I' = I + 1, R' = C2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t60 := {
    from   := f181;
    to     := f181;
    guard  := Z1 >= H && R1 + 1 = A;
    action := H' = H + 1, R' = C2, R1' = A - 1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t61 := {
    from   := f181;
    to     := f181;
    guard  := A > 1 + R1 && Z1 >= H;
    action := H' = H + 1, R' = C2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t62 := {
    from   := f181;
    to     := f181;
    guard  := R1 >= A && Z1 >= H;
    action := H' = H + 1, R' = C2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t63 := {
    from   := f152;
    to     := f132;
    guard  := E = 0;
    action := E' = 0, R1' = R1 + 1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t64 := {
    from   := f41;
    to     := f23;
    guard  := 30 >= C && A > 1 + B;
    action := C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t65 := {
    from   := f41;
    to     := f18;
    guard  := C > 30 && A > 1 + B;
    action := C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t66 := {
    from   := f41;
    to     := f18;
    guard  := B + 1 >= A;
    action := C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t67 := {
    from   := f181;
    to     := f132;
    guard  := H > Z1;
    action := R1' = R1 + 1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t68 := {
    from   := f167;
    to     := f181;
    guard  := I > A && R1 + 2 >= A;
    action := Z1' = A, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t69 := {
    from   := f167;
    to     := f181;
    guard  := I > A && A > R1 + 2;
    action := Z1' = R1 + 3, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t70 := {
    from   := f132;
    to     := f41;
    guard  := R1 >= A;
    action := C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t71 := {
    from   := f124;
    to     := f132;
    guard  := H > A;
    action := C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t72 := {
    from   := f93;
    to     := f124;
    guard  := B > D1;
    action := C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t73 := {
    from   := f93;
    to     := f124;
    guard  := B = D1;
    action := E' = C2 + D2 + E2, R' = F2, S' = G2, V' = H2, D1' = B, E1' = I2, F1' = C2, G1' = D2, H1' = E2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t74 := {
    from   := f119;
    to     := f124;
    guard  := true;
    action := C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t75 := {
    from   := f80;
    to     := f93;
    guard  := H > A;
    action := C' = C + 1, E' = C2 + D2, D' = E2, O' = E2, P' = F2, A2' = C2, B2' = D2, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t76 := {
    from   := f18;
    to     := f1;
    guard  := 0 >= A;
    action := C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t77 := {
    from   := f7;
    to     := f4;
    guard  := I > G;
    action := H' = H + 1, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
  transition t78 := {
    from   := f4;
    to     := f18;
    guard  := H > G;
    action := A' = G, Q' = 0, C2' = ?, D2' = ?, E2' = ?, F2' = ?, G2' = ?, H2' = ?, I2' = ?, J2' = ?, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?, Q2' = ?, R2' = ?;
  };
}
strategy dumb {
  Region init := { state = f2 };
}
