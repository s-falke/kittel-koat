model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1, N1, O1, P1, Q1, R1, S1, T1, U1, V1, W1, X1, Y1, Z1, A2, B2, C2, D2, E2, F2, G2, H2, I2, J2, K2, L2, M2, N2, O2, P2, Q2, R2, S2, T2, U2, V2, W2, X2, Y2, Z2, A3, B3, C3, D3, E3, F3, G3, H3, I3, J3, K3, L3, M3, N3, O3, P3, Q3, R3, S3, T3, U3, V3, W3, X3, Y3, Z3, A4, B4, C4, D4, E4, F4, G4, H4, I4, J4, K4, L4, M4, N4, O4, P4, Q4, R4, S4, T4, U4, V4, W4, X4, Y4, Z4, A5, B5, C5, D5, E5, F5, G5, H5, I5, J5, K5, L5, M5, N5, O5, P5, Q5, R5, S5, T5, U5, V5, W5, X5, Y5, Z5, A6, B6, C6, D6, E6, F6, G6, H6, I6, J6, K6, L6, M6, N6, O6, P6, Q6, R6, S6, T6, U6, V6, W6, X6, Y6, Z6, A7, B7, C7, D7, E7, F7, G7, H7, I7, J7, K7, L7, M7, N7, O7, P7, Q7, R7, S7, T7, U7, V7, W7, X7, Y7, Z7;
  states f52, f65, f72, f85, f203, f210, f382, f244, f251, f264, f423, f430, f443, f619, f626, f639, f825, f832, f845, f936, f949, f17, f22, f3, f757, f38, f43, f142, f105, f152, f189, f201, f226, f217, f222, f321, f284, f331, f368, f380, f561, f401, f396, f500, f463, f510, f547, f559, f592, f597, f696, f659, f706, f743, f755, f767, f963, f798, f803, f902, f865, f912, f961, f975, f666666;
  transition t0 := {
    from   := f52;
    to     := f65;
    guard  := 0 >= A;
    action := W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t1 := {
    from   := f65;
    to     := f72;
    guard  := 0 >= B;
    action := W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t2 := {
    from   := f72;
    to     := f85;
    guard  := 0 >= A;
    action := W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t3 := {
    from   := f203;
    to     := f210;
    guard  := 0 >= C;
    action := W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t4 := {
    from   := f210;
    to     := f382;
    guard  := 0 >= A;
    action := W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t5 := {
    from   := f244;
    to     := f251;
    guard  := 0 >= B;
    action := W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t6 := {
    from   := f251;
    to     := f264;
    guard  := 0 >= A;
    action := W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t7 := {
    from   := f423;
    to     := f430;
    guard  := 0 >= B;
    action := W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t8 := {
    from   := f430;
    to     := f443;
    guard  := 0 >= A;
    action := W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t9 := {
    from   := f619;
    to     := f626;
    guard  := 0 >= B;
    action := W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t10 := {
    from   := f626;
    to     := f639;
    guard  := 0 >= A;
    action := W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t11 := {
    from   := f825;
    to     := f832;
    guard  := 0 >= B;
    action := W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t12 := {
    from   := f832;
    to     := f845;
    guard  := 0 >= A;
    action := W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t13 := {
    from   := f936;
    to     := f949;
    guard  := 0 >= A;
    action := W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t14 := {
    from   := f17;
    to     := f22;
    guard  := true;
    action := D' = W7, E' = 2, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t15 := {
    from   := f3;
    to     := f22;
    guard  := true;
    action := F' = 0, G' = 5, A' = 1, H' = 1, I' = 0, J' = W7, D' = X7, E' = 2, K' = 0, L' = Y7, M' = 5, N' = Z7, O' = 0, P' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t16 := {
    from   := f22;
    to     := f757;
    guard  := 0 > M && 0 >= A;
    action := E' = 3, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t17 := {
    from   := f22;
    to     := f210;
    guard  := M >= 0 && D > 0;
    action := E' = 5, M' = M - 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t18 := {
    from   := f22;
    to     := f203;
    guard  := 0 >= D && M >= 0 && 0 >= A;
    action := E' = 6, K' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t19 := {
    from   := f22;
    to     := f52;
    guard  := 0 >= D && M >= 0 && A > 0;
    action := E' = 6, K' = 0, Q' = J, R' = D, S' = 6, T' = 0, U' = L, V' = M, W' = N, X' = 0, Y' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t20 := {
    from   := f38;
    to     := f43;
    guard  := true;
    action := R' = W7, S' = 2, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t21 := {
    from   := f43;
    to     := f142;
    guard  := 0 > V && 0 >= A;
    action := S' = 3, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t22 := {
    from   := f43;
    to     := f52;
    guard  := 0 >= R && V >= 0;
    action := S' = 6, T' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t23 := {
    from   := f43;
    to     := f72;
    guard  := R > 0 && V >= 0;
    action := S' = 5, V' = V - 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t24 := {
    from   := f52;
    to     := f65;
    guard  := H > 0 && T > 0 && A > 0;
    action := Z' = Q, A1' = R, B1' = S, C1' = T, D1' = U, E1' = V, F1' = W, B' = 1, G1' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t25 := {
    from   := f52;
    to     := f65;
    guard  := H > 0 && 0 >= T && A > 0;
    action := Z' = Q, A1' = R, B1' = S, C1' = T, D1' = U, E1' = V, F1' = W, B' = 0, G1' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t26 := {
    from   := f65;
    to     := f203;
    guard  := H > 0 && B > 0;
    action := C' = 1, H1' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t27 := {
    from   := f72;
    to     := f85;
    guard  := H > 0 && T > 0 && A > 0;
    action := B' = 1, I1' = Q, J1' = R, K1' = S, L1' = T, M1' = U, N1' = V, O1' = W, P1' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t28 := {
    from   := f72;
    to     := f85;
    guard  := H > 0 && 0 >= T && A > 0;
    action := B' = 0, I1' = Q, J1' = R, K1' = S, L1' = T, M1' = U, N1' = V, O1' = W, P1' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t29 := {
    from   := f85;
    to     := f105;
    guard  := 0 >= A && 0 >= B;
    action := W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t30 := {
    from   := f85;
    to     := f203;
    guard  := H > 0 && B > 0;
    action := C' = 1, H1' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t31 := {
    from   := f85;
    to     := f105;
    guard  := 0 >= B && H > 0 && T > 0 && A > 0;
    action := B' = 1, Q1' = Q, R1' = R, S1' = S, T1' = T, U1' = U, V1' = V, W1' = W, X1' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t32 := {
    from   := f85;
    to     := f105;
    guard  := 0 >= B && H > 0 && 0 >= T && A > 0;
    action := B' = 0, Q1' = Q, R1' = R, S1' = S, T1' = T, U1' = U, V1' = V, W1' = W, X1' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t33 := {
    from   := f105;
    to     := f203;
    guard  := H > 0 && B > 0;
    action := C' = 1, H1' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t34 := {
    from   := f105;
    to     := f203;
    guard  := 0 >= B && Y > 0 && H > 0;
    action := C' = 0, H1' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t35 := {
    from   := f105;
    to     := f43;
    guard  := 0 >= B && 0 >= X7 && 0 >= Y;
    action := R' = W7, S' = 2, Y1' = X7, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t36 := {
    from   := f105;
    to     := f43;
    guard  := 0 >= B && X7 > 0 && 0 >= Y;
    action := R' = W7, S' = 2, Y' = 1, Y1' = X7, Z1' = Q, A2' = R, B2' = S, C2' = T, D2' = U, E2' = V, F2' = W, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t37 := {
    from   := f43;
    to     := f142;
    guard  := H > 0 && A > 0 && T > 0 && 0 > V;
    action := S' = 3, B' = 1, G2' = Q, H2' = R, I2' = 3, J2' = T, K2' = U, L2' = V, M2' = W, N2' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t38 := {
    from   := f43;
    to     := f142;
    guard  := H > 0 && A > 0 && 0 >= T && 0 > V;
    action := S' = 3, B' = 0, G2' = Q, H2' = R, I2' = 3, J2' = T, K2' = U, L2' = V, M2' = W, N2' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t39 := {
    from   := f142;
    to     := f203;
    guard  := H > 0 && B > 0;
    action := C' = 1, H1' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t40 := {
    from   := f142;
    to     := f152;
    guard  := 0 >= B;
    action := S' = 8, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t41 := {
    from   := f152;
    to     := f203;
    guard  := H > 0 && U >= 0 && X > 0;
    action := S' = 10, U' = U - 1, C' = 0, H1' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t42 := {
    from   := f152;
    to     := f152;
    guard  := 0 >= X && U >= 0 && 0 >= W7;
    action := S' = 8, U' = U - 1, O2' = W7, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t43 := {
    from   := f152;
    to     := f152;
    guard  := 0 >= X && U >= 0 && W7 > 0;
    action := S' = 8, U' = U - 1, X' = 1, O2' = W7, P2' = Q, Q2' = R, R2' = 10, S2' = T, T2' = U - 1, U2' = V, V2' = W, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t44 := {
    from   := f152;
    to     := f189;
    guard  := 0 > U && 0 >= A;
    action := S' = 11, T' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t45 := {
    from   := f152;
    to     := f189;
    guard  := H > 0 && 0 > U && A > 0;
    action := S' = 11, T' = 1, B' = 1, W2' = Q, X2' = R, Y2' = 11, Z2' = 1, A3' = U, B3' = V, C3' = W, D3' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t46 := {
    from   := f189;
    to     := f203;
    guard  := H > 0 && B > 0;
    action := C' = 1, H1' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t47 := {
    from   := f201;
    to     := f201;
    guard  := true;
    action := S' = 14, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t48 := {
    from   := f189;
    to     := f201;
    guard  := 0 >= B;
    action := S' = 14, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t49 := {
    from   := f210;
    to     := f226;
    guard  := A > 0;
    action := E3' = J, F3' = D, G3' = E, H3' = K, I3' = L, J3' = M, K3' = N, L3' = 0, M3' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t50 := {
    from   := f217;
    to     := f222;
    guard  := true;
    action := F3' = W7, G3' = 2, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t51 := {
    from   := f222;
    to     := f226;
    guard  := J3 >= 0;
    action := G3' = 4, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t52 := {
    from   := f222;
    to     := f321;
    guard  := 0 >= A && 0 > J3;
    action := G3' = 3, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t53 := {
    from   := f226;
    to     := f251;
    guard  := F3 > 0;
    action := G3' = 5, J3' = J3 - 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t54 := {
    from   := f226;
    to     := f244;
    guard  := 0 >= A && 0 >= F3;
    action := G3' = 6, H3' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t55 := {
    from   := f226;
    to     := f244;
    guard  := 0 >= F3 && A > 0 && H > 0;
    action := Z' = E3, A1' = F3, B1' = 6, C1' = 0, D1' = I3, E1' = J3, F1' = K3, B' = 0, G1' = 0, G3' = 6, H3' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t56 := {
    from   := f244;
    to     := f382;
    guard  := H > 0 && B > 0;
    action := C' = 1, N3' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t57 := {
    from   := f251;
    to     := f264;
    guard  := H3 > 0 && A > 0 && H > 0;
    action := B' = 1, I1' = E3, J1' = F3, K1' = G3, L1' = H3, M1' = I3, N1' = J3, O1' = K3, P1' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t58 := {
    from   := f251;
    to     := f264;
    guard  := 0 >= H3 && A > 0 && H > 0;
    action := B' = 0, I1' = E3, J1' = F3, K1' = G3, L1' = H3, M1' = I3, N1' = J3, O1' = K3, P1' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t59 := {
    from   := f264;
    to     := f284;
    guard  := 0 >= A && 0 >= B;
    action := W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t60 := {
    from   := f264;
    to     := f382;
    guard  := H > 0 && B > 0;
    action := C' = 1, N3' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t61 := {
    from   := f264;
    to     := f284;
    guard  := H3 > 0 && 0 >= B && A > 0 && H > 0;
    action := B' = 1, Q1' = E3, R1' = F3, S1' = G3, T1' = H3, U1' = I3, V1' = J3, W1' = K3, X1' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t62 := {
    from   := f264;
    to     := f284;
    guard  := 0 >= H3 && 0 >= B && A > 0 && H > 0;
    action := B' = 0, Q1' = E3, R1' = F3, S1' = G3, T1' = H3, U1' = I3, V1' = J3, W1' = K3, X1' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t63 := {
    from   := f284;
    to     := f382;
    guard  := H > 0 && B > 0;
    action := C' = 1, N3' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t64 := {
    from   := f284;
    to     := f382;
    guard  := M3 > 0 && H > 0 && 0 >= B;
    action := C' = 0, N3' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t65 := {
    from   := f284;
    to     := f222;
    guard  := 0 >= M3 && 0 >= X7 && 0 >= B;
    action := F3' = W7, G3' = 2, O3' = X7, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t66 := {
    from   := f284;
    to     := f222;
    guard  := 0 >= M3 && X7 > 0 && 0 >= B;
    action := F3' = W7, G3' = 2, M3' = 1, O3' = X7, P3' = E3, Q3' = F3, R3' = G3, S3' = H3, T3' = I3, U3' = J3, V3' = K3, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t67 := {
    from   := f222;
    to     := f321;
    guard  := 0 > J3 && H3 > 0 && A > 0 && H > 0;
    action := B' = 1, G2' = E3, H2' = F3, I2' = 3, J2' = H3, K2' = I3, L2' = J3, M2' = K3, N2' = 1, G3' = 3, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t68 := {
    from   := f222;
    to     := f321;
    guard  := 0 > J3 && 0 >= H3 && A > 0 && H > 0;
    action := B' = 0, G2' = E3, H2' = F3, I2' = 3, J2' = H3, K2' = I3, L2' = J3, M2' = K3, N2' = 0, G3' = 3, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t69 := {
    from   := f321;
    to     := f382;
    guard  := H > 0 && B > 0;
    action := C' = 1, N3' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t70 := {
    from   := f321;
    to     := f331;
    guard  := 0 >= B;
    action := G3' = 8, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t71 := {
    from   := f331;
    to     := f382;
    guard  := L3 > 0 && H > 0 && I3 >= 0;
    action := C' = 0, G3' = 10, I3' = I3 - 1, N3' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t72 := {
    from   := f331;
    to     := f331;
    guard  := 0 >= L3 && 0 >= W7 && I3 >= 0;
    action := G3' = 8, I3' = I3 - 1, W3' = W7, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t73 := {
    from   := f331;
    to     := f331;
    guard  := 0 >= L3 && W7 > 0 && I3 >= 0;
    action := G3' = 8, I3' = I3 - 1, L3' = 1, W3' = W7, X3' = E3, Y3' = F3, Z3' = 10, A4' = H3, B4' = I3 - 1, C4' = J3, D4' = K3, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t74 := {
    from   := f331;
    to     := f368;
    guard  := 0 >= A && 0 > I3;
    action := G3' = 11, H3' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t75 := {
    from   := f331;
    to     := f368;
    guard  := 0 > I3 && A > 0 && H > 0;
    action := B' = 1, W2' = E3, X2' = F3, Y2' = 11, Z2' = 1, A3' = I3, B3' = J3, C3' = K3, D3' = 1, G3' = 11, H3' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t76 := {
    from   := f368;
    to     := f382;
    guard  := H > 0 && B > 0;
    action := C' = 1, N3' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t77 := {
    from   := f380;
    to     := f380;
    guard  := true;
    action := G3' = 14, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t78 := {
    from   := f368;
    to     := f380;
    guard  := 0 >= B;
    action := G3' = 14, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t79 := {
    from   := f382;
    to     := f561;
    guard  := 0 >= A && 0 >= C;
    action := W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t80 := {
    from   := f382;
    to     := f401;
    guard  := A > 0 && 0 >= C;
    action := E4' = J, F4' = D, G4' = E, H4' = K, I4' = L, J4' = M, K4' = N, L4' = 0, M4' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t81 := {
    from   := f396;
    to     := f401;
    guard  := true;
    action := F4' = W7, G4' = 2, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t82 := {
    from   := f401;
    to     := f500;
    guard  := 0 > J4 && 0 >= A;
    action := G4' = 3, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t83 := {
    from   := f401;
    to     := f430;
    guard  := F4 > 0 && J4 >= 0;
    action := G4' = 5, J4' = J4 - 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t84 := {
    from   := f401;
    to     := f423;
    guard  := 0 >= A && 0 >= F4 && J4 >= 0;
    action := G4' = 6, H4' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t85 := {
    from   := f401;
    to     := f423;
    guard  := H > 0 && A > 0 && 0 >= F4 && J4 >= 0;
    action := Z' = E4, A1' = F4, B1' = 6, C1' = 0, D1' = I4, E1' = J4, F1' = K4, B' = 0, G1' = 0, G4' = 6, H4' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t86 := {
    from   := f423;
    to     := f561;
    guard  := H > 0 && B > 0;
    action := C' = 1, N4' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t87 := {
    from   := f430;
    to     := f443;
    guard  := H > 0 && H4 > 0 && A > 0;
    action := B' = 1, I1' = E4, J1' = F4, K1' = G4, L1' = H4, M1' = I4, N1' = J4, O1' = K4, P1' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t88 := {
    from   := f430;
    to     := f443;
    guard  := H > 0 && 0 >= H4 && A > 0;
    action := B' = 0, I1' = E4, J1' = F4, K1' = G4, L1' = H4, M1' = I4, N1' = J4, O1' = K4, P1' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t89 := {
    from   := f443;
    to     := f463;
    guard  := 0 >= A && 0 >= B;
    action := W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t90 := {
    from   := f443;
    to     := f561;
    guard  := H > 0 && B > 0;
    action := C' = 1, N4' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t91 := {
    from   := f443;
    to     := f463;
    guard  := 0 >= B && H > 0 && H4 > 0 && A > 0;
    action := B' = 1, Q1' = E4, R1' = F4, S1' = G4, T1' = H4, U1' = I4, V1' = J4, W1' = K4, X1' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t92 := {
    from   := f443;
    to     := f463;
    guard  := 0 >= B && H > 0 && 0 >= H4 && A > 0;
    action := B' = 0, Q1' = E4, R1' = F4, S1' = G4, T1' = H4, U1' = I4, V1' = J4, W1' = K4, X1' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t93 := {
    from   := f463;
    to     := f561;
    guard  := H > 0 && B > 0;
    action := C' = 1, N4' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t94 := {
    from   := f463;
    to     := f561;
    guard  := 0 >= B && M4 > 0 && H > 0;
    action := C' = 0, N4' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t95 := {
    from   := f463;
    to     := f401;
    guard  := 0 >= B && 0 >= M4 && 0 >= X7;
    action := F4' = W7, G4' = 2, O4' = X7, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t96 := {
    from   := f463;
    to     := f401;
    guard  := 0 >= B && 0 >= M4 && X7 > 0;
    action := F4' = W7, G4' = 2, M4' = 1, O4' = X7, P4' = E4, Q4' = F4, R4' = G4, S4' = H4, T4' = I4, U4' = J4, V4' = K4, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t97 := {
    from   := f401;
    to     := f500;
    guard  := H > 0 && A > 0 && H4 > 0 && 0 > J4;
    action := B' = 1, G2' = E4, H2' = F4, I2' = 3, J2' = H4, K2' = I4, L2' = J4, M2' = K4, N2' = 1, G4' = 3, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t98 := {
    from   := f401;
    to     := f500;
    guard  := H > 0 && A > 0 && 0 >= H4 && 0 > J4;
    action := B' = 0, G2' = E4, H2' = F4, I2' = 3, J2' = H4, K2' = I4, L2' = J4, M2' = K4, N2' = 0, G4' = 3, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t99 := {
    from   := f500;
    to     := f561;
    guard  := H > 0 && B > 0;
    action := C' = 1, N4' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t100 := {
    from   := f500;
    to     := f510;
    guard  := 0 >= B;
    action := G4' = 8, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t101 := {
    from   := f510;
    to     := f561;
    guard  := H > 0 && I4 >= 0 && L4 > 0;
    action := C' = 0, G4' = 10, I4' = I4 - 1, N4' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t102 := {
    from   := f510;
    to     := f510;
    guard  := 0 >= W7 && I4 >= 0 && 0 >= L4;
    action := G4' = 8, I4' = I4 - 1, W4' = W7, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t103 := {
    from   := f510;
    to     := f510;
    guard  := W7 > 0 && I4 >= 0 && 0 >= L4;
    action := G4' = 8, I4' = I4 - 1, L4' = 1, W4' = W7, X4' = E4, Y4' = F4, Z4' = 10, A5' = H4, B5' = I4 - 1, C5' = J4, D5' = K4, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t104 := {
    from   := f510;
    to     := f547;
    guard  := 0 > I4 && 0 >= A;
    action := G4' = 11, H4' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t105 := {
    from   := f510;
    to     := f547;
    guard  := H > 0 && 0 > I4 && A > 0;
    action := B' = 1, W2' = E4, X2' = F4, Y2' = 11, Z2' = 1, A3' = I4, B3' = J4, C3' = K4, D3' = 1, G4' = 11, H4' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t106 := {
    from   := f547;
    to     := f561;
    guard  := H > 0 && B > 0;
    action := C' = 1, N4' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t107 := {
    from   := f559;
    to     := f559;
    guard  := true;
    action := G4' = 14, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t108 := {
    from   := f547;
    to     := f559;
    guard  := 0 >= B;
    action := G4' = 14, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t109 := {
    from   := f561;
    to     := f22;
    guard  := 0 >= C && 0 >= P && 0 >= X7;
    action := D' = W7, E' = 2, E5' = X7, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t110 := {
    from   := f561;
    to     := f22;
    guard  := 0 >= C && 0 >= P && X7 > 0;
    action := D' = W7, E' = 2, P' = 1, E5' = X7, F5' = J, G5' = D, H5' = E, I5' = K, J5' = L, K5' = M, L5' = N, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t111 := {
    from   := f592;
    to     := f597;
    guard  := true;
    action := M5' = W7, N5' = 2, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t112 := {
    from   := f22;
    to     := f597;
    guard  := 0 > M && A > 0;
    action := E' = 3, O5' = J, M5' = W7, N5' = 2, P5' = K, Q5' = L, R5' = M, S5' = N, T5' = 0, U5' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t113 := {
    from   := f597;
    to     := f696;
    guard  := 0 > R5 && 0 >= A;
    action := N5' = 3, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t114 := {
    from   := f597;
    to     := f626;
    guard  := M5 > 0 && R5 >= 0;
    action := N5' = 5, R5' = R5 - 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t115 := {
    from   := f597;
    to     := f619;
    guard  := 0 >= A && 0 >= M5 && R5 >= 0;
    action := N5' = 6, P5' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t116 := {
    from   := f597;
    to     := f619;
    guard  := H > 0 && A > 0 && 0 >= M5 && R5 >= 0;
    action := Z' = O5, A1' = M5, B1' = 6, C1' = 0, D1' = Q5, E1' = R5, F1' = S5, B' = 0, G1' = 0, N5' = 6, P5' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t117 := {
    from   := f619;
    to     := f757;
    guard  := H > 0 && B > 0;
    action := C' = 1, V5' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t118 := {
    from   := f626;
    to     := f639;
    guard  := H > 0 && P5 > 0 && A > 0;
    action := B' = 1, I1' = O5, J1' = M5, K1' = N5, L1' = P5, M1' = Q5, N1' = R5, O1' = S5, P1' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t119 := {
    from   := f626;
    to     := f639;
    guard  := H > 0 && 0 >= P5 && A > 0;
    action := B' = 0, I1' = O5, J1' = M5, K1' = N5, L1' = P5, M1' = Q5, N1' = R5, O1' = S5, P1' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t120 := {
    from   := f639;
    to     := f659;
    guard  := 0 >= A && 0 >= B;
    action := W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t121 := {
    from   := f639;
    to     := f757;
    guard  := H > 0 && B > 0;
    action := C' = 1, V5' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t122 := {
    from   := f639;
    to     := f659;
    guard  := 0 >= B && H > 0 && P5 > 0 && A > 0;
    action := B' = 1, Q1' = O5, R1' = M5, S1' = N5, T1' = P5, U1' = Q5, V1' = R5, W1' = S5, X1' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t123 := {
    from   := f639;
    to     := f659;
    guard  := 0 >= B && H > 0 && 0 >= P5 && A > 0;
    action := B' = 0, Q1' = O5, R1' = M5, S1' = N5, T1' = P5, U1' = Q5, V1' = R5, W1' = S5, X1' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t124 := {
    from   := f659;
    to     := f757;
    guard  := H > 0 && B > 0;
    action := C' = 1, V5' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t125 := {
    from   := f659;
    to     := f757;
    guard  := 0 >= B && U5 > 0 && H > 0;
    action := C' = 0, V5' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t126 := {
    from   := f659;
    to     := f597;
    guard  := 0 >= B && 0 >= U5 && 0 >= X7;
    action := M5' = W7, N5' = 2, W5' = X7, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t127 := {
    from   := f659;
    to     := f597;
    guard  := 0 >= B && 0 >= U5 && X7 > 0;
    action := M5' = W7, N5' = 2, U5' = 1, W5' = X7, X5' = O5, Y5' = M5, Z5' = N5, A6' = P5, B6' = Q5, C6' = R5, D6' = S5, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t128 := {
    from   := f597;
    to     := f696;
    guard  := H > 0 && A > 0 && P5 > 0 && 0 > R5;
    action := B' = 1, G2' = O5, H2' = M5, I2' = 3, J2' = P5, K2' = Q5, L2' = R5, M2' = S5, N2' = 1, N5' = 3, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t129 := {
    from   := f597;
    to     := f696;
    guard  := H > 0 && A > 0 && 0 >= P5 && 0 > R5;
    action := B' = 0, G2' = O5, H2' = M5, I2' = 3, J2' = P5, K2' = Q5, L2' = R5, M2' = S5, N2' = 0, N5' = 3, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t130 := {
    from   := f696;
    to     := f757;
    guard  := H > 0 && B > 0;
    action := C' = 1, V5' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t131 := {
    from   := f696;
    to     := f706;
    guard  := 0 >= B;
    action := N5' = 8, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t132 := {
    from   := f706;
    to     := f757;
    guard  := H > 0 && Q5 >= 0 && T5 > 0;
    action := C' = 0, N5' = 10, Q5' = Q5 - 1, V5' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t133 := {
    from   := f706;
    to     := f706;
    guard  := 0 >= W7 && Q5 >= 0 && 0 >= T5;
    action := N5' = 8, Q5' = Q5 - 1, E6' = W7, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t134 := {
    from   := f706;
    to     := f706;
    guard  := W7 > 0 && Q5 >= 0 && 0 >= T5;
    action := N5' = 8, Q5' = Q5 - 1, T5' = 1, E6' = W7, F6' = O5, G6' = M5, H6' = 10, I6' = P5, J6' = Q5 - 1, K6' = R5, L6' = S5, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t135 := {
    from   := f706;
    to     := f743;
    guard  := 0 > Q5 && 0 >= A;
    action := N5' = 11, P5' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t136 := {
    from   := f706;
    to     := f743;
    guard  := H > 0 && 0 > Q5 && A > 0;
    action := B' = 1, W2' = O5, X2' = M5, Y2' = 11, Z2' = 1, A3' = Q5, B3' = R5, C3' = S5, D3' = 1, N5' = 11, P5' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t137 := {
    from   := f743;
    to     := f757;
    guard  := H > 0 && B > 0;
    action := C' = 1, V5' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t138 := {
    from   := f755;
    to     := f755;
    guard  := true;
    action := N5' = 14, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t139 := {
    from   := f743;
    to     := f755;
    guard  := 0 >= B;
    action := N5' = 14, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t140 := {
    from   := f757;
    to     := f767;
    guard  := 0 >= C;
    action := E' = 8, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t141 := {
    from   := f767;
    to     := f767;
    guard  := L >= 0 && 0 >= O && 0 >= W7;
    action := E' = 8, L' = L - 1, M6' = W7, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t142 := {
    from   := f767;
    to     := f767;
    guard  := L >= 0 && 0 >= O && W7 > 0;
    action := E' = 8, L' = L - 1, O' = 1, M6' = W7, N6' = J, O6' = D, P6' = 10, Q6' = K, R6' = L - 1, S6' = M, T6' = N, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t143 := {
    from   := f767;
    to     := f963;
    guard  := 0 >= A && 0 > L;
    action := E' = 11, K' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t144 := {
    from   := f767;
    to     := f936;
    guard  := A > 0 && 0 > L;
    action := E' = 11, K' = 1, U6' = J, V6' = D, W6' = 11, X6' = 1, Y6' = L, Z6' = M, A7' = N, B7' = 0, C7' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t145 := {
    from   := f798;
    to     := f803;
    guard  := true;
    action := V6' = W7, W6' = 2, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t146 := {
    from   := f803;
    to     := f902;
    guard  := 0 > Z6 && 0 >= A;
    action := W6' = 3, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t147 := {
    from   := f803;
    to     := f832;
    guard  := V6 > 0 && Z6 >= 0;
    action := W6' = 5, Z6' = Z6 - 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t148 := {
    from   := f803;
    to     := f825;
    guard  := 0 >= A && 0 >= V6 && Z6 >= 0;
    action := W6' = 6, X6' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t149 := {
    from   := f803;
    to     := f825;
    guard  := H > 0 && A > 0 && 0 >= V6 && Z6 >= 0;
    action := Z' = U6, A1' = V6, B1' = 6, C1' = 0, D1' = Y6, E1' = Z6, F1' = A7, B' = 0, G1' = 0, W6' = 6, X6' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t150 := {
    from   := f825;
    to     := f963;
    guard  := H > 0 && B > 0;
    action := C' = 1, D7' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t151 := {
    from   := f832;
    to     := f845;
    guard  := H > 0 && X6 > 0 && A > 0;
    action := B' = 1, I1' = U6, J1' = V6, K1' = W6, L1' = X6, M1' = Y6, N1' = Z6, O1' = A7, P1' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t152 := {
    from   := f832;
    to     := f845;
    guard  := H > 0 && 0 >= X6 && A > 0;
    action := B' = 0, I1' = U6, J1' = V6, K1' = W6, L1' = X6, M1' = Y6, N1' = Z6, O1' = A7, P1' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t153 := {
    from   := f845;
    to     := f865;
    guard  := 0 >= A && 0 >= B;
    action := W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t154 := {
    from   := f845;
    to     := f963;
    guard  := H > 0 && B > 0;
    action := C' = 1, D7' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t155 := {
    from   := f845;
    to     := f865;
    guard  := 0 >= B && H > 0 && X6 > 0 && A > 0;
    action := B' = 1, Q1' = U6, R1' = V6, S1' = W6, T1' = X6, U1' = Y6, V1' = Z6, W1' = A7, X1' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t156 := {
    from   := f845;
    to     := f865;
    guard  := 0 >= B && H > 0 && 0 >= X6 && A > 0;
    action := B' = 0, Q1' = U6, R1' = V6, S1' = W6, T1' = X6, U1' = Y6, V1' = Z6, W1' = A7, X1' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t157 := {
    from   := f865;
    to     := f963;
    guard  := H > 0 && B > 0;
    action := C' = 1, D7' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t158 := {
    from   := f865;
    to     := f963;
    guard  := 0 >= B && C7 > 0 && H > 0;
    action := C' = 0, D7' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t159 := {
    from   := f865;
    to     := f803;
    guard  := 0 >= B && 0 >= C7 && 0 >= X7;
    action := V6' = W7, W6' = 2, E7' = X7, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t160 := {
    from   := f865;
    to     := f803;
    guard  := 0 >= B && 0 >= C7 && X7 > 0;
    action := V6' = W7, W6' = 2, C7' = 1, E7' = X7, F7' = U6, G7' = V6, H7' = W6, I7' = X6, J7' = Y6, K7' = Z6, L7' = A7, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t161 := {
    from   := f803;
    to     := f902;
    guard  := H > 0 && A > 0 && X6 > 0 && 0 > Z6;
    action := B' = 1, G2' = U6, H2' = V6, I2' = 3, J2' = X6, K2' = Y6, L2' = Z6, M2' = A7, N2' = 1, W6' = 3, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t162 := {
    from   := f803;
    to     := f902;
    guard  := H > 0 && A > 0 && 0 >= X6 && 0 > Z6;
    action := B' = 0, G2' = U6, H2' = V6, I2' = 3, J2' = X6, K2' = Y6, L2' = Z6, M2' = A7, N2' = 0, W6' = 3, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t163 := {
    from   := f902;
    to     := f963;
    guard  := H > 0 && B > 0;
    action := C' = 1, D7' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t164 := {
    from   := f902;
    to     := f912;
    guard  := 0 >= B;
    action := W6' = 8, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t165 := {
    from   := f912;
    to     := f936;
    guard  := 0 > Y6;
    action := W6' = 11, X6' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t166 := {
    from   := f912;
    to     := f963;
    guard  := H > 0 && Y6 >= 0 && B7 > 0;
    action := C' = 0, W6' = 10, Y6' = Y6 - 1, D7' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t167 := {
    from   := f912;
    to     := f912;
    guard  := 0 >= W7 && Y6 >= 0 && 0 >= B7;
    action := W6' = 8, Y6' = Y6 - 1, M7' = W7, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t168 := {
    from   := f912;
    to     := f912;
    guard  := W7 > 0 && Y6 >= 0 && 0 >= B7;
    action := W6' = 8, Y6' = Y6 - 1, B7' = 1, M7' = W7, N7' = U6, O7' = V6, P7' = 10, Q7' = X6, R7' = Y6 - 1, S7' = Z6, T7' = A7, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t169 := {
    from   := f936;
    to     := f949;
    guard  := H > 0 && X6 > 0 && A > 0;
    action := B' = 1, W2' = U6, X2' = V6, Y2' = W6, Z2' = X6, A3' = Y6, B3' = Z6, C3' = A7, D3' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t170 := {
    from   := f936;
    to     := f949;
    guard  := H > 0 && 0 >= X6 && A > 0;
    action := B' = 0, W2' = U6, X2' = V6, Y2' = W6, Z2' = X6, A3' = Y6, B3' = Z6, C3' = A7, D3' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t171 := {
    from   := f949;
    to     := f963;
    guard  := H > 0 && B > 0;
    action := C' = 1, D7' = 1, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t172 := {
    from   := f961;
    to     := f961;
    guard  := true;
    action := W6' = 14, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t173 := {
    from   := f949;
    to     := f961;
    guard  := 0 >= B;
    action := W6' = 14, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t174 := {
    from   := f975;
    to     := f975;
    guard  := true;
    action := E' = 14, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t175 := {
    from   := f963;
    to     := f975;
    guard  := 0 >= C;
    action := E' = 14, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t176 := {
    from   := f561;
    to     := f666666;
    guard  := 0 >= C && P > 0 && H > 0;
    action := U7' = 0, V7' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
  transition t177 := {
    from   := f767;
    to     := f666666;
    guard  := L >= 0 && O > 0 && H > 0;
    action := E' = 10, L' = L - 1, U7' = 0, V7' = 0, W7' = ?, X7' = ?, Y7' = ?, Z7' = ?;
  };
}
strategy dumb {
  Region init := { state = f3 };
}
