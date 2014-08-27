model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1, N1, O1, P1, Q1, R1, S1, T1, U1, V1, W1, X1, Y1, Z1, A2, B2, C2, D2, E2, F2, G2, H2, I2, J2, K2, L2, M2, N2, O2, P2, Q2, R2, S2, T2, U2, V2;
  states f15, f18, f3, f29, f48, f55, f58, f102, f74, f80, f87, f117, f123, f95, f107, f151, f132, f135, f179, f164, f194, f200, f172, f184, f223, f226, f270, f242, f219, f255, f285, f291, f263, f275, f666666;
  transition t0 := {
    from   := f15;
    to     := f18;
    guard  := true;
    action := A' = 1, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t1 := {
    from   := f3;
    to     := f18;
    guard  := true;
    action := B' = 0, C' = 0, D' = S2, E' = T2, A' = 1, F' = 0, G' = U2, H' = V2, I' = 0, J' = 0, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t2 := {
    from   := f18;
    to     := f29;
    guard  := 0 >= G && S2 > 0;
    action := E' = S2, A' = 5, G' = G + 1, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t3 := {
    from   := f18;
    to     := f29;
    guard  := 0 >= G && 0 >= S2;
    action := E' = S2, A' = 6, G' = G - 1, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t4 := {
    from   := f29;
    to     := f18;
    guard  := 0 >= S2 && 0 >= J;
    action := A' = 1, K' = S2, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t5 := {
    from   := f29;
    to     := f18;
    guard  := S2 > 0 && 0 >= J;
    action := A' = 1, J' = 1, K' = S2, L' = D, M' = E, N' = A, O' = F, P' = G, Q' = H, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t6 := {
    from   := f18;
    to     := f48;
    guard  := 0 >= G;
    action := D' = S2, A' = 9, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t7 := {
    from   := f55;
    to     := f58;
    guard  := true;
    action := R' = 1, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t8 := {
    from   := f58;
    to     := f58;
    guard  := 0 >= S && S2 > 0;
    action := T' = S2, R' = 1, S' = S + 1, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t9 := {
    from   := f58;
    to     := f58;
    guard  := 0 >= S && 0 >= S2;
    action := T' = S2, R' = 1, S' = S - 1, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t10 := {
    from   := f102;
    to     := f74;
    guard  := U > 0;
    action := V' = S2, R' = 9, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t11 := {
    from   := f58;
    to     := f74;
    guard  := 0 >= S;
    action := V' = S2, R' = 9, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t12 := {
    from   := f48;
    to     := f80;
    guard  := D > 0;
    action := A' = 10, F' = 0, V' = D, T' = E, R' = 10, W' = 0, S' = G, X' = H, Y' = D, Z' = E, A1' = 10, B1' = 0, C1' = G, D1' = H, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t13 := {
    from   := f74;
    to     := f80;
    guard  := V > 0;
    action := R' = 10, W' = 0, Y' = V, Z' = T, A1' = 10, B1' = 0, C1' = S, D1' = X, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t14 := {
    from   := f80;
    to     := f87;
    guard  := B1 > 0;
    action := U' = 1, E1' = 1, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t15 := {
    from   := f80;
    to     := f87;
    guard  := 0 >= B1;
    action := U' = 0, E1' = 0, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t16 := {
    from   := f117;
    to     := f123;
    guard  := U > 0;
    action := F1' = G1, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t17 := {
    from   := f87;
    to     := f123;
    guard  := 0 >= U;
    action := F1' = 0, G1' = 0, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t18 := {
    from   := f74;
    to     := f95;
    guard  := 0 >= V;
    action := H1' = V, I1' = T, J1' = R, K1' = W, L1' = S, M1' = X, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t19 := {
    from   := f87;
    to     := f95;
    guard  := U > 0;
    action := H1' = V, I1' = T, J1' = R, K1' = W, L1' = S, M1' = X, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t20 := {
    from   := f95;
    to     := f102;
    guard  := K1 > 0;
    action := U' = 1, N1' = 1, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t21 := {
    from   := f95;
    to     := f102;
    guard  := 0 >= K1;
    action := U' = 0, N1' = 0, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t22 := {
    from   := f102;
    to     := f123;
    guard  := 0 >= U;
    action := F1' = 0, G1' = 0, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t23 := {
    from   := f107;
    to     := f117;
    guard  := W > 0;
    action := U' = 1, O1' = V, P1' = T, Q1' = R, R1' = W, S1' = S, T1' = X, U1' = 1, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t24 := {
    from   := f107;
    to     := f117;
    guard  := 0 >= W;
    action := U' = 0, O1' = V, P1' = T, Q1' = R, R1' = W, S1' = S, T1' = X, U1' = 0, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t25 := {
    from   := f117;
    to     := f123;
    guard  := 0 >= U;
    action := F1' = 0, G1' = 0, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t26 := {
    from   := f48;
    to     := f151;
    guard  := 0 >= D;
    action := V1' = D, W1' = E, X1' = A, Y1' = F, Z1' = G, A2' = H, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t27 := {
    from   := f123;
    to     := f151;
    guard  := 0 >= F1;
    action := V1' = D, W1' = E, X1' = A, Y1' = F, Z1' = G, A2' = H, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t28 := {
    from   := f132;
    to     := f135;
    guard  := true;
    action := X1' = 1, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t29 := {
    from   := f135;
    to     := f135;
    guard  := 0 >= Z1 && S2 > 0;
    action := W1' = S2, X1' = 1, Z1' = Z1 + 1, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t30 := {
    from   := f135;
    to     := f135;
    guard  := 0 >= Z1 && 0 >= S2;
    action := W1' = S2, X1' = 1, Z1' = Z1 - 1, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t31 := {
    from   := f179;
    to     := f151;
    guard  := U > 0;
    action := V1' = S2, X1' = 9, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t32 := {
    from   := f135;
    to     := f151;
    guard  := 0 >= Z1;
    action := V1' = S2, X1' = 9, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t33 := {
    from   := f151;
    to     := f164;
    guard  := V1 > 0;
    action := Y' = V1, Z' = W1, A1' = 10, B1' = 0, C1' = Z1, D1' = A2, U' = 0, E1' = 0, X1' = 10, Y1' = 0, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t34 := {
    from   := f194;
    to     := f200;
    guard  := U > 0;
    action := F1' = B2, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t35 := {
    from   := f164;
    to     := f200;
    guard  := 0 >= U;
    action := F1' = 0, B2' = 0, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t36 := {
    from   := f151;
    to     := f172;
    guard  := 0 >= V1;
    action := H1' = V1, I1' = W1, J1' = X1, K1' = Y1, L1' = Z1, M1' = A2, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t37 := {
    from   := f164;
    to     := f172;
    guard  := U > 0;
    action := H1' = V1, I1' = W1, J1' = X1, K1' = Y1, L1' = Z1, M1' = A2, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t38 := {
    from   := f172;
    to     := f179;
    guard  := K1 > 0;
    action := U' = 1, N1' = 1, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t39 := {
    from   := f172;
    to     := f179;
    guard  := 0 >= K1;
    action := U' = 0, N1' = 0, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t40 := {
    from   := f179;
    to     := f200;
    guard  := 0 >= U;
    action := F1' = 0, B2' = 0, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t41 := {
    from   := f184;
    to     := f194;
    guard  := Y1 > 0;
    action := U' = 1, O1' = V1, P1' = W1, Q1' = X1, R1' = Y1, S1' = Z1, T1' = A2, U1' = 1, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t42 := {
    from   := f184;
    to     := f194;
    guard  := 0 >= Y1;
    action := U' = 0, O1' = V1, P1' = W1, Q1' = X1, R1' = Y1, S1' = Z1, T1' = A2, U1' = 0, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t43 := {
    from   := f194;
    to     := f200;
    guard  := 0 >= U;
    action := F1' = 0, B2' = 0, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t44 := {
    from   := f200;
    to     := f48;
    guard  := 0 >= I && 0 >= F1 && 0 >= T2;
    action := D' = S2, A' = 9, C2' = T2, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t45 := {
    from   := f200;
    to     := f48;
    guard  := 0 >= I && 0 >= F1 && T2 > 0;
    action := D' = S2, A' = 9, I' = 1, C2' = T2, D2' = D, E2' = E, F2' = A, G2' = F, H2' = G, I2' = H, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t46 := {
    from   := f223;
    to     := f226;
    guard  := true;
    action := J2' = 1, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t47 := {
    from   := f226;
    to     := f226;
    guard  := 0 >= K2 && S2 > 0;
    action := L2' = S2, J2' = 1, K2' = K2 + 1, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t48 := {
    from   := f226;
    to     := f226;
    guard  := 0 >= K2 && 0 >= S2;
    action := L2' = S2, J2' = 1, K2' = K2 - 1, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t49 := {
    from   := f270;
    to     := f242;
    guard  := U > 0;
    action := M2' = S2, J2' = 9, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t50 := {
    from   := f219;
    to     := f242;
    guard  := true;
    action := M2' = S2, L2' = E, J2' = 9, N2' = F, K2' = G, O2' = H, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t51 := {
    from   := f226;
    to     := f242;
    guard  := 0 >= K2;
    action := M2' = S2, J2' = 9, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t52 := {
    from   := f242;
    to     := f255;
    guard  := M2 > 0;
    action := Y' = M2, Z' = L2, A1' = 10, B1' = 0, C1' = K2, D1' = O2, U' = 0, E1' = 0, J2' = 10, N2' = 0, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t53 := {
    from   := f285;
    to     := f291;
    guard  := U > 0;
    action := F1' = P2, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t54 := {
    from   := f255;
    to     := f291;
    guard  := 0 >= U;
    action := F1' = 0, P2' = 0, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t55 := {
    from   := f242;
    to     := f263;
    guard  := 0 >= M2;
    action := H1' = M2, I1' = L2, J1' = J2, K1' = N2, L1' = K2, M1' = O2, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t56 := {
    from   := f255;
    to     := f263;
    guard  := U > 0;
    action := H1' = M2, I1' = L2, J1' = J2, K1' = N2, L1' = K2, M1' = O2, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t57 := {
    from   := f263;
    to     := f270;
    guard  := K1 > 0;
    action := U' = 1, N1' = 1, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t58 := {
    from   := f263;
    to     := f270;
    guard  := 0 >= K1;
    action := U' = 0, N1' = 0, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t59 := {
    from   := f270;
    to     := f291;
    guard  := 0 >= U;
    action := F1' = 0, P2' = 0, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t60 := {
    from   := f275;
    to     := f285;
    guard  := N2 > 0;
    action := U' = 1, O1' = M2, P1' = L2, Q1' = J2, R1' = N2, S1' = K2, T1' = O2, U1' = 1, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t61 := {
    from   := f275;
    to     := f285;
    guard  := 0 >= N2;
    action := U' = 0, O1' = M2, P1' = L2, Q1' = J2, R1' = N2, S1' = K2, T1' = O2, U1' = 0, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t62 := {
    from   := f285;
    to     := f291;
    guard  := 0 >= U;
    action := F1' = 0, P2' = 0, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t63 := {
    from   := f291;
    to     := f666666;
    guard  := Q2 > 1 && 0 >= F1;
    action := R2' = Q2, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t64 := {
    from   := f291;
    to     := f666666;
    guard  := 0 >= Q2 && 0 >= F1;
    action := R2' = Q2, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t65 := {
    from   := f29;
    to     := f666666;
    guard  := J > 0;
    action := Q2' = 0, R2' = 0, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
  transition t66 := {
    from   := f200;
    to     := f666666;
    guard  := 0 >= F1 && I > 0;
    action := Q2' = 0, R2' = 0, S2' = ?, T2' = ?, U2' = ?, V2' = ?;
  };
}
strategy dumb {
  Region init := { state = f3 };
}
