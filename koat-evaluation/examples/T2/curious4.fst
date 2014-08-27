model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1, N1, O1, P1, Q1, R1, S1, T1, U1, V1, W1, X1, Y1, Z1, A2, B2, C2, D2, E2, F2, G2, H2, I2, J2, K2, L2, M2, N2, O2, P2, Q2, R2, S2, T2, U2, V2, W2, X2, Y2, Z2, A3, B3, C3, D3, E3, F3, G3, H3, I3, J3;
  states f15, f20, f3, f24, f35, f55, f60, f119, f64, f80, f87, f134, f140, f95, f102, f124, f154, f149, f213, f158, f181, f228, f234, f189, f196, f218, f245, f250, f309, f254, f277, f324, f330, f285, f292, f302, f314, f353, f358, f417, f349, f362, f385, f432, f438, f393, f400, f422, f666666;
  transition t0 := {
    from   := f15;
    to     := f20;
    guard  := true;
    action := A' = G3, B' = 2, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t1 := {
    from   := f3;
    to     := f20;
    guard  := true;
    action := C' = 0, D' = 0, E' = G3, A' = H3, B' = 2, F' = 0, G' = I3, H' = J3, I' = 0, J' = 0, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t2 := {
    from   := f20;
    to     := f24;
    guard  := A > 0;
    action := B' = 4, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t3 := {
    from   := f24;
    to     := f35;
    guard  := 0 >= G && 0 >= G3;
    action := E' = G3, B' = 8, G' = G - 1, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t4 := {
    from   := f24;
    to     := f35;
    guard  := 0 >= G && G3 > 0;
    action := E' = G3, B' = 9, G' = G + 1, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t5 := {
    from   := f35;
    to     := f24;
    guard  := 0 >= I && 0 >= G3;
    action := B' = 4, K' = G3, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t6 := {
    from   := f35;
    to     := f24;
    guard  := 0 >= I && G3 > 0;
    action := B' = 4, I' = 1, K' = G3, L' = E, M' = A, N' = B, O' = F, P' = G, Q' = H, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t7 := {
    from   := f55;
    to     := f60;
    guard  := true;
    action := R' = G3, S' = 2, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t8 := {
    from   := f119;
    to     := f60;
    guard  := T > 0;
    action := R' = G3, S' = 2, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t9 := {
    from   := f60;
    to     := f64;
    guard  := R > 0;
    action := S' = 4, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t10 := {
    from   := f64;
    to     := f64;
    guard  := 0 >= U && 0 >= G3;
    action := V' = G3, S' = 4, U' = U - 1, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t11 := {
    from   := f64;
    to     := f64;
    guard  := 0 >= U && G3 > 0;
    action := V' = G3, S' = 4, U' = U + 1, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t12 := {
    from   := f24;
    to     := f80;
    guard  := 0 >= G;
    action := B' = 10, F' = 1, V' = E, R' = A, S' = 10, W' = 1, U' = G, X' = H, Y' = E, Z' = A, A1' = 10, B1' = 1, C1' = G, D1' = H, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t13 := {
    from   := f64;
    to     := f80;
    guard  := 0 >= U;
    action := S' = 10, W' = 1, Y' = V, Z' = R, A1' = 10, B1' = 1, C1' = U, D1' = X, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t14 := {
    from   := f80;
    to     := f87;
    guard  := B1 > 0;
    action := T' = 1, E1' = 1, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t15 := {
    from   := f80;
    to     := f87;
    guard  := 0 >= B1;
    action := T' = 0, E1' = 0, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t16 := {
    from   := f134;
    to     := f140;
    guard  := T > 0;
    action := F1' = G1, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t17 := {
    from   := f87;
    to     := f140;
    guard  := 0 >= T;
    action := F1' = 0, G1' = 0, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t18 := {
    from   := f60;
    to     := f95;
    guard  := 0 >= R;
    action := H1' = V, I1' = R, J1' = S, K1' = W, L1' = U, M1' = X, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t19 := {
    from   := f87;
    to     := f95;
    guard  := T > 0;
    action := H1' = V, I1' = R, J1' = S, K1' = W, L1' = U, M1' = X, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t20 := {
    from   := f95;
    to     := f102;
    guard  := K1 > 0;
    action := T' = 1, N1' = 1, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t21 := {
    from   := f95;
    to     := f102;
    guard  := 0 >= K1;
    action := T' = 0, N1' = 0, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t22 := {
    from   := f102;
    to     := f140;
    guard  := 0 >= T;
    action := F1' = 0, G1' = 0, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t23 := {
    from   := f102;
    to     := f119;
    guard  := T > 0;
    action := S' = 11, W' = 0, T' = 0, O1' = V, P1' = R, Q1' = 11, R1' = 0, S1' = U, T1' = X, U1' = 0, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t24 := {
    from   := f119;
    to     := f140;
    guard  := 0 >= T;
    action := F1' = 0, G1' = 0, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t25 := {
    from   := f124;
    to     := f134;
    guard  := W > 0;
    action := T' = 1, V1' = V, W1' = R, X1' = S, Y1' = W, Z1' = U, A2' = X, B2' = 1, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t26 := {
    from   := f124;
    to     := f134;
    guard  := 0 >= W;
    action := T' = 0, V1' = V, W1' = R, X1' = S, Y1' = W, Z1' = U, A2' = X, B2' = 0, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t27 := {
    from   := f134;
    to     := f140;
    guard  := 0 >= T;
    action := F1' = 0, G1' = 0, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t28 := {
    from   := f20;
    to     := f154;
    guard  := 0 >= A;
    action := C2' = E, D2' = A, E2' = B, F2' = F, G2' = G, H2' = H, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t29 := {
    from   := f140;
    to     := f154;
    guard  := 0 >= F1;
    action := C2' = E, D2' = A, E2' = B, F2' = F, G2' = G, H2' = H, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t30 := {
    from   := f149;
    to     := f154;
    guard  := true;
    action := D2' = G3, E2' = 2, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t31 := {
    from   := f213;
    to     := f154;
    guard  := T > 0;
    action := D2' = G3, E2' = 2, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t32 := {
    from   := f154;
    to     := f158;
    guard  := D2 > 0;
    action := E2' = 4, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t33 := {
    from   := f158;
    to     := f158;
    guard  := 0 >= G2 && 0 >= G3;
    action := C2' = G3, E2' = 4, G2' = G2 - 1, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t34 := {
    from   := f158;
    to     := f158;
    guard  := 0 >= G2 && G3 > 0;
    action := C2' = G3, E2' = 4, G2' = G2 + 1, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t35 := {
    from   := f158;
    to     := f181;
    guard  := 0 >= G2;
    action := Y' = C2, Z' = D2, A1' = 10, B1' = 1, C1' = G2, D1' = H2, T' = 1, E1' = 1, E2' = 10, F2' = 1, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t36 := {
    from   := f228;
    to     := f234;
    guard  := T > 0;
    action := F1' = I2, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t37 := {
    from   := f181;
    to     := f234;
    guard  := 0 >= T;
    action := F1' = 0, I2' = 0, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t38 := {
    from   := f154;
    to     := f189;
    guard  := 0 >= D2;
    action := H1' = C2, I1' = D2, J1' = E2, K1' = F2, L1' = G2, M1' = H2, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t39 := {
    from   := f181;
    to     := f189;
    guard  := T > 0;
    action := H1' = C2, I1' = D2, J1' = E2, K1' = F2, L1' = G2, M1' = H2, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t40 := {
    from   := f189;
    to     := f196;
    guard  := K1 > 0;
    action := T' = 1, N1' = 1, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t41 := {
    from   := f189;
    to     := f196;
    guard  := 0 >= K1;
    action := T' = 0, N1' = 0, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t42 := {
    from   := f196;
    to     := f234;
    guard  := 0 >= T;
    action := F1' = 0, I2' = 0, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t43 := {
    from   := f196;
    to     := f213;
    guard  := T > 0;
    action := T' = 0, O1' = C2, P1' = D2, Q1' = 11, R1' = 0, S1' = G2, T1' = H2, U1' = 0, E2' = 11, F2' = 0, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t44 := {
    from   := f213;
    to     := f234;
    guard  := 0 >= T;
    action := F1' = 0, I2' = 0, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t45 := {
    from   := f218;
    to     := f228;
    guard  := F2 > 0;
    action := T' = 1, V1' = C2, W1' = D2, X1' = E2, Y1' = F2, Z1' = G2, A2' = H2, B2' = 1, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t46 := {
    from   := f218;
    to     := f228;
    guard  := 0 >= F2;
    action := T' = 0, V1' = C2, W1' = D2, X1' = E2, Y1' = F2, Z1' = G2, A2' = H2, B2' = 0, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t47 := {
    from   := f228;
    to     := f234;
    guard  := 0 >= T;
    action := F1' = 0, I2' = 0, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t48 := {
    from   := f245;
    to     := f250;
    guard  := true;
    action := J2' = G3, K2' = 2, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t49 := {
    from   := f309;
    to     := f250;
    guard  := T > 0;
    action := J2' = G3, K2' = 2, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t50 := {
    from   := f250;
    to     := f254;
    guard  := J2 > 0;
    action := K2' = 4, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t51 := {
    from   := f254;
    to     := f254;
    guard  := 0 >= L2 && 0 >= G3;
    action := M2' = G3, K2' = 4, L2' = L2 - 1, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t52 := {
    from   := f254;
    to     := f254;
    guard  := 0 >= L2 && G3 > 0;
    action := M2' = G3, K2' = 4, L2' = L2 + 1, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t53 := {
    from   := f254;
    to     := f277;
    guard  := 0 >= L2;
    action := Y' = M2, Z' = J2, A1' = 10, B1' = 1, C1' = L2, D1' = N2, T' = 1, E1' = 1, K2' = 10, O2' = 1, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t54 := {
    from   := f324;
    to     := f330;
    guard  := T > 0;
    action := F1' = P2, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t55 := {
    from   := f277;
    to     := f330;
    guard  := 0 >= T;
    action := F1' = 0, P2' = 0, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t56 := {
    from   := f250;
    to     := f285;
    guard  := 0 >= J2;
    action := H1' = M2, I1' = J2, J1' = K2, K1' = O2, L1' = L2, M1' = N2, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t57 := {
    from   := f277;
    to     := f285;
    guard  := T > 0;
    action := H1' = M2, I1' = J2, J1' = K2, K1' = O2, L1' = L2, M1' = N2, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t58 := {
    from   := f285;
    to     := f292;
    guard  := K1 > 0;
    action := T' = 1, N1' = 1, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t59 := {
    from   := f285;
    to     := f292;
    guard  := 0 >= K1;
    action := T' = 0, N1' = 0, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t60 := {
    from   := f292;
    to     := f330;
    guard  := 0 >= T;
    action := F1' = 0, P2' = 0, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t61 := {
    from   := f234;
    to     := f302;
    guard  := 0 >= F1;
    action := B' = 11, F' = 0, O1' = E, P1' = A, Q1' = 11, R1' = 0, S1' = G, T1' = H, M2' = E, J2' = A, K2' = 11, O2' = 0, L2' = G, N2' = H, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t62 := {
    from   := f292;
    to     := f302;
    guard  := T > 0;
    action := O1' = M2, P1' = J2, Q1' = 11, R1' = 0, S1' = L2, T1' = N2, K2' = 11, O2' = 0, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t63 := {
    from   := f302;
    to     := f309;
    guard  := R1 > 0;
    action := T' = 1, U1' = 1, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t64 := {
    from   := f302;
    to     := f309;
    guard  := 0 >= R1;
    action := T' = 0, U1' = 0, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t65 := {
    from   := f309;
    to     := f330;
    guard  := 0 >= T;
    action := F1' = 0, P2' = 0, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t66 := {
    from   := f314;
    to     := f324;
    guard  := O2 > 0;
    action := T' = 1, V1' = M2, W1' = J2, X1' = K2, Y1' = O2, Z1' = L2, A2' = N2, B2' = 1, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t67 := {
    from   := f314;
    to     := f324;
    guard  := 0 >= O2;
    action := T' = 0, V1' = M2, W1' = J2, X1' = K2, Y1' = O2, Z1' = L2, A2' = N2, B2' = 0, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t68 := {
    from   := f324;
    to     := f330;
    guard  := 0 >= T;
    action := F1' = 0, P2' = 0, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t69 := {
    from   := f330;
    to     := f20;
    guard  := 0 >= J && 0 >= F1 && 0 >= H3;
    action := A' = G3, B' = 2, Q2' = H3, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t70 := {
    from   := f330;
    to     := f20;
    guard  := 0 >= J && 0 >= F1 && H3 > 0;
    action := A' = G3, B' = 2, J' = 1, Q2' = H3, R2' = E, S2' = A, T2' = B, U2' = F, V2' = G, W2' = H, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t71 := {
    from   := f353;
    to     := f358;
    guard  := true;
    action := X2' = G3, Y2' = 2, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t72 := {
    from   := f417;
    to     := f358;
    guard  := T > 0;
    action := X2' = G3, Y2' = 2, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t73 := {
    from   := f349;
    to     := f358;
    guard  := true;
    action := Z2' = E, X2' = G3, Y2' = 2, A3' = F, B3' = G, C3' = H, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t74 := {
    from   := f358;
    to     := f362;
    guard  := X2 > 0;
    action := Y2' = 4, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t75 := {
    from   := f362;
    to     := f362;
    guard  := 0 >= B3 && 0 >= G3;
    action := Z2' = G3, Y2' = 4, B3' = B3 - 1, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t76 := {
    from   := f362;
    to     := f362;
    guard  := 0 >= B3 && G3 > 0;
    action := Z2' = G3, Y2' = 4, B3' = B3 + 1, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t77 := {
    from   := f362;
    to     := f385;
    guard  := 0 >= B3;
    action := Y' = Z2, Z' = X2, A1' = 10, B1' = 1, C1' = B3, D1' = C3, T' = 1, E1' = 1, Y2' = 10, A3' = 1, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t78 := {
    from   := f432;
    to     := f438;
    guard  := T > 0;
    action := F1' = D3, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t79 := {
    from   := f385;
    to     := f438;
    guard  := 0 >= T;
    action := F1' = 0, D3' = 0, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t80 := {
    from   := f358;
    to     := f393;
    guard  := 0 >= X2;
    action := H1' = Z2, I1' = X2, J1' = Y2, K1' = A3, L1' = B3, M1' = C3, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t81 := {
    from   := f385;
    to     := f393;
    guard  := T > 0;
    action := H1' = Z2, I1' = X2, J1' = Y2, K1' = A3, L1' = B3, M1' = C3, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t82 := {
    from   := f393;
    to     := f400;
    guard  := K1 > 0;
    action := T' = 1, N1' = 1, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t83 := {
    from   := f393;
    to     := f400;
    guard  := 0 >= K1;
    action := T' = 0, N1' = 0, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t84 := {
    from   := f400;
    to     := f438;
    guard  := 0 >= T;
    action := F1' = 0, D3' = 0, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t85 := {
    from   := f400;
    to     := f417;
    guard  := T > 0;
    action := T' = 0, O1' = Z2, P1' = X2, Q1' = 11, R1' = 0, S1' = B3, T1' = C3, U1' = 0, Y2' = 11, A3' = 0, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t86 := {
    from   := f417;
    to     := f438;
    guard  := 0 >= T;
    action := F1' = 0, D3' = 0, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t87 := {
    from   := f422;
    to     := f432;
    guard  := A3 > 0;
    action := T' = 1, V1' = Z2, W1' = X2, X1' = Y2, Y1' = A3, Z1' = B3, A2' = C3, B2' = 1, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t88 := {
    from   := f422;
    to     := f432;
    guard  := 0 >= A3;
    action := T' = 0, V1' = Z2, W1' = X2, X1' = Y2, Y1' = A3, Z1' = B3, A2' = C3, B2' = 0, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t89 := {
    from   := f432;
    to     := f438;
    guard  := 0 >= T;
    action := F1' = 0, D3' = 0, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t90 := {
    from   := f438;
    to     := f666666;
    guard  := E3 > 1 && 0 >= F1;
    action := F3' = E3, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t91 := {
    from   := f438;
    to     := f666666;
    guard  := 0 >= E3 && 0 >= F1;
    action := F3' = E3, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t92 := {
    from   := f35;
    to     := f666666;
    guard  := I > 0;
    action := E3' = 0, F3' = 0, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
  transition t93 := {
    from   := f330;
    to     := f666666;
    guard  := 0 >= F1 && J > 0;
    action := E3' = 0, F3' = 0, G3' = ?, H3' = ?, I3' = ?, J3' = ?;
  };
}
strategy dumb {
  Region init := { state = f3 };
}
