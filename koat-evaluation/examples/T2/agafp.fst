model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1, N1, O1, P1, Q1, R1, S1, T1, U1, V1, W1, X1, Y1, Z1, A2, B2, C2, D2, E2, F2, G2, H2, I2, J2, K2, L2, M2, N2, O2, P2, Q2, R2, S2, T2, U2, V2, W2, X2, Y2, Z2, A3, B3, C3, D3, E3, F3, G3, H3, I3, J3, K3, L3, M3, N3, O3, P3, Q3, R3, S3, T3, U3, V3, W3, X3, Y3, Z3, A4, B4, C4, D4, E4, F4, G4, H4, I4, J4, K4, L4, M4, N4, O4, P4, Q4, R4, S4, T4, U4, V4, W4, X4, Y4, Z4, A5, B5, C5, D5, E5, F5, G5, H5, I5, J5, K5, L5, M5, N5, O5, P5, Q5, R5, S5, T5, U5, V5, W5, X5, Y5, Z5, A6, B6, C6, D6, E6, F6, G6, H6, I6, J6, K6, L6;
  states f13, f14, f167, f168, f459, f460, f3, f155, f35, f26, f42, f63, f73, f81, f114, f122, f129, f138, f160, f176, f183, f296, f204, f214, f222, f255, f263, f270, f279, f304, f318, f327, f334, f447, f355, f365, f373, f399, f406, f414, f421, f430, f468, f475, f588, f496, f506, f514, f547, f555, f562, f571, f596, f666666;
  transition t0 := {
    from   := f13;
    to     := f14;
    guard  := true;
    action := A' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t1 := {
    from   := f167;
    to     := f168;
    guard  := true;
    action := B' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t2 := {
    from   := f459;
    to     := f460;
    guard  := true;
    action := B' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t3 := {
    from   := f3;
    to     := f14;
    guard  := true;
    action := C' = 0, D' = 0, E' = G6, F' = H6, A' = 0, G' = I6, H' = 0, I' = J6, J' = K6, K' = L6, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t4 := {
    from   := f155;
    to     := f35;
    guard  := L > 0;
    action := A' = 2, H' = H + 1, M' = E, N' = F, O' = 2, P' = G, Q' = H + 2, R' = I, S' = J, T' = K, U' = 0, V' = 0, W' = 0, X' = E, Y' = F, Z' = 2, A1' = G, B1' = H + 2, C1' = I, D1' = J, E1' = K, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t5 := {
    from   := f14;
    to     := f35;
    guard  := J > 0;
    action := A' = 2, H' = H + 1, M' = E, N' = F, O' = 2, P' = G, Q' = H + 2, R' = I, S' = J, T' = K, U' = 0, V' = 0, W' = 0, X' = E, Y' = F, Z' = 2, A1' = G, B1' = H + 2, C1' = I, D1' = J, E1' = K, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t6 := {
    from   := f26;
    to     := f35;
    guard  := S > 0;
    action := O' = 2, Q' = Q + 1, X' = M, Y' = N, Z' = 2, A1' = P, B1' = Q + 1, C1' = R, D1' = S, E1' = T, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t7 := {
    from   := f35;
    to     := f42;
    guard  := B1 > 0;
    action := F1' = 1, G1' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t8 := {
    from   := f35;
    to     := f42;
    guard  := 0 >= B1;
    action := F1' = 0, G1' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t9 := {
    from   := f42;
    to     := f155;
    guard  := F1 > 0;
    action := L' = 1, H1' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t10 := {
    from   := f42;
    to     := f155;
    guard  := W > 0 && 0 >= F1;
    action := L' = 0, H1' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t11 := {
    from   := f42;
    to     := f35;
    guard  := 0 >= F1 && 0 >= G6 && 0 >= W;
    action := O' = 2, Q' = Q + 1, X' = M, Y' = N, Z' = 2, A1' = P, B1' = Q + 1, C1' = R, D1' = S, E1' = T, I1' = G6, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t12 := {
    from   := f42;
    to     := f35;
    guard  := 0 >= F1 && G6 > 0 && 0 >= W;
    action := O' = 2, Q' = Q + 1, W' = 1, X' = M, Y' = N, Z' = 2, A1' = P, B1' = Q + 1, C1' = R, D1' = S, E1' = T, I1' = G6, J1' = M, K1' = N, L1' = O, M1' = P, N1' = Q, O1' = R, P1' = S, Q1' = T, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t13 := {
    from   := f63;
    to     := f73;
    guard  := Q > 0;
    action := X' = M, Y' = N, Z' = O, A1' = P, B1' = Q, C1' = R, D1' = S, E1' = T, F1' = 1, R1' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t14 := {
    from   := f63;
    to     := f73;
    guard  := 0 >= Q;
    action := X' = M, Y' = N, Z' = O, A1' = P, B1' = Q, C1' = R, D1' = S, E1' = T, F1' = 0, R1' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t15 := {
    from   := f73;
    to     := f155;
    guard  := F1 > 0;
    action := L' = 1, H1' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t16 := {
    from   := f26;
    to     := f81;
    guard  := 0 >= S;
    action := O' = 4, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t17 := {
    from   := f81;
    to     := f155;
    guard  := 0 >= R && V > 0;
    action := O' = 6, R' = R - 1, L' = 0, H1' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t18 := {
    from   := f81;
    to     := f81;
    guard  := 0 >= V && 0 >= R && 0 >= G6;
    action := O' = 4, R' = R - 1, S1' = G6, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t19 := {
    from   := f81;
    to     := f81;
    guard  := 0 >= V && 0 >= R && G6 > 0;
    action := O' = 4, R' = R - 1, V' = 1, S1' = G6, T1' = M, U1' = N, V1' = 6, W1' = P, X1' = Q, Y1' = R - 1, Z1' = S, A2' = T, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t20 := {
    from   := f81;
    to     := f114;
    guard  := 0 >= R;
    action := O' = 7, Q' = 1, F1' = 1, B2' = M, C2' = N, D2' = 7, E2' = P, F2' = 1, G2' = R, H2' = S, I2' = T, J2' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t21 := {
    from   := f114;
    to     := f155;
    guard  := F1 > 0;
    action := L' = 1, H1' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t22 := {
    from   := f73;
    to     := f122;
    guard  := 0 >= F1;
    action := K2' = M, L2' = N, M2' = O, N2' = P, O2' = Q, P2' = R, Q2' = S, R2' = T, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t23 := {
    from   := f114;
    to     := f122;
    guard  := 0 >= F1;
    action := K2' = M, L2' = N, M2' = O, N2' = P, O2' = Q, P2' = R, Q2' = S, R2' = T, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t24 := {
    from   := f122;
    to     := f129;
    guard  := O2 > 0;
    action := F1' = 1, S2' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t25 := {
    from   := f122;
    to     := f129;
    guard  := 0 >= O2;
    action := F1' = 0, S2' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t26 := {
    from   := f129;
    to     := f155;
    guard  := F1 > 0;
    action := L' = 1, H1' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t27 := {
    from   := f129;
    to     := f138;
    guard  := 0 >= F1;
    action := O' = 9, S' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t28 := {
    from   := f138;
    to     := f155;
    guard  := U > 0;
    action := L' = 0, H1' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t29 := {
    from   := f138;
    to     := f138;
    guard  := 0 >= G6 && 0 >= U;
    action := O' = 9, S' = 1, T2' = G6, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t30 := {
    from   := f138;
    to     := f138;
    guard  := G6 > 0 && 0 >= U;
    action := O' = 9, S' = 1, U' = 1, T2' = G6, U2' = M, V2' = N, W2' = O, X2' = P, Y2' = Q, Z2' = R, A3' = S, B3' = T, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t31 := {
    from   := f160;
    to     := f168;
    guard  := true;
    action := C3' = E, D3' = F, B' = A, E3' = G, F3' = H, G3' = I, H3' = J, I3' = K, J3' = 0, K3' = 0, L3' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t32 := {
    from   := f168;
    to     := f176;
    guard  := H3 > 0;
    action := X' = C3, Y' = D3, Z' = 2, A1' = E3, B1' = F3 + 1, C1' = G3, D1' = H3, E1' = I3, B' = 2, F3' = F3 + 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t33 := {
    from   := f176;
    to     := f183;
    guard  := B1 > 0;
    action := F1' = 1, G1' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t34 := {
    from   := f176;
    to     := f183;
    guard  := 0 >= B1;
    action := F1' = 0, G1' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t35 := {
    from   := f183;
    to     := f296;
    guard  := F1 > 0;
    action := L' = 1, M3' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t36 := {
    from   := f183;
    to     := f296;
    guard  := 0 >= F1 && L3 > 0;
    action := L' = 0, M3' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t37 := {
    from   := f183;
    to     := f176;
    guard  := 0 >= L3 && 0 >= G6 && 0 >= F1;
    action := X' = C3, Y' = D3, Z' = 2, A1' = E3, B1' = F3 + 1, C1' = G3, D1' = H3, E1' = I3, B' = 2, F3' = F3 + 1, N3' = G6, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t38 := {
    from   := f183;
    to     := f176;
    guard  := 0 >= L3 && G6 > 0 && 0 >= F1;
    action := X' = C3, Y' = D3, Z' = 2, A1' = E3, B1' = F3 + 1, C1' = G3, D1' = H3, E1' = I3, B' = 2, F3' = F3 + 1, L3' = 1, N3' = G6, O3' = C3, P3' = D3, Q3' = B, R3' = E3, S3' = F3, T3' = G3, U3' = H3, V3' = I3, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t39 := {
    from   := f204;
    to     := f214;
    guard  := F3 > 0;
    action := F1' = 1, K2' = C3, L2' = D3, M2' = B, N2' = E3, O2' = F3, P2' = G3, Q2' = H3, R2' = I3, W3' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t40 := {
    from   := f204;
    to     := f214;
    guard  := 0 >= F3;
    action := F1' = 0, K2' = C3, L2' = D3, M2' = B, N2' = E3, O2' = F3, P2' = G3, Q2' = H3, R2' = I3, W3' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t41 := {
    from   := f214;
    to     := f296;
    guard  := F1 > 0;
    action := L' = 1, M3' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t42 := {
    from   := f168;
    to     := f222;
    guard  := 0 >= H3;
    action := B' = 4, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t43 := {
    from   := f222;
    to     := f296;
    guard  := 0 >= G3 && K3 > 0;
    action := L' = 0, B' = 6, G3' = G3 - 1, M3' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t44 := {
    from   := f222;
    to     := f222;
    guard  := 0 >= K3 && 0 >= G6 && 0 >= G3;
    action := B' = 4, G3' = G3 - 1, X3' = G6, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t45 := {
    from   := f222;
    to     := f222;
    guard  := 0 >= K3 && G6 > 0 && 0 >= G3;
    action := B' = 4, G3' = G3 - 1, K3' = 1, X3' = G6, Y3' = C3, Z3' = D3, A4' = 6, B4' = E3, C4' = F3, D4' = G3 - 1, E4' = H3, F4' = I3, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t46 := {
    from   := f222;
    to     := f255;
    guard  := 0 >= G3;
    action := F1' = 1, B2' = C3, C2' = D3, D2' = 7, E2' = E3, F2' = 1, G2' = G3, H2' = H3, I2' = I3, J2' = 1, B' = 7, F3' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t47 := {
    from   := f255;
    to     := f296;
    guard  := F1 > 0;
    action := L' = 1, M3' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t48 := {
    from   := f214;
    to     := f263;
    guard  := 0 >= F1;
    action := K2' = C3, L2' = D3, M2' = B, N2' = E3, O2' = F3, P2' = G3, Q2' = H3, R2' = I3, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t49 := {
    from   := f255;
    to     := f263;
    guard  := 0 >= F1;
    action := K2' = C3, L2' = D3, M2' = B, N2' = E3, O2' = F3, P2' = G3, Q2' = H3, R2' = I3, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t50 := {
    from   := f263;
    to     := f270;
    guard  := O2 > 0;
    action := F1' = 1, S2' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t51 := {
    from   := f263;
    to     := f270;
    guard  := 0 >= O2;
    action := F1' = 0, S2' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t52 := {
    from   := f270;
    to     := f296;
    guard  := F1 > 0;
    action := L' = 1, M3' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t53 := {
    from   := f270;
    to     := f279;
    guard  := 0 >= F1;
    action := B' = 9, H3' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t54 := {
    from   := f279;
    to     := f296;
    guard  := J3 > 0;
    action := L' = 0, M3' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t55 := {
    from   := f279;
    to     := f279;
    guard  := 0 >= G6 && 0 >= J3;
    action := B' = 9, H3' = 1, G4' = G6, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t56 := {
    from   := f279;
    to     := f279;
    guard  := G6 > 0 && 0 >= J3;
    action := B' = 9, H3' = 1, J3' = 1, G4' = G6, H4' = C3, I4' = D3, J4' = B, K4' = E3, L4' = F3, M4' = G3, N4' = H3, O4' = I3, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t57 := {
    from   := f14;
    to     := f304;
    guard  := 0 >= J;
    action := A' = 4, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t58 := {
    from   := f304;
    to     := f304;
    guard  := 0 >= I;
    action := A' = 4, I' = I - 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t59 := {
    from   := f318;
    to     := f327;
    guard  := P4 > 0;
    action := X' = Q4, Y' = R4, Z' = 2, A1' = S4, B1' = T4 + 1, C1' = U4, D1' = P4, E1' = V4, W4' = 2, T4' = T4 + 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t60 := {
    from   := f327;
    to     := f334;
    guard  := B1 > 0;
    action := F1' = 1, G1' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t61 := {
    from   := f327;
    to     := f334;
    guard  := 0 >= B1;
    action := F1' = 0, G1' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t62 := {
    from   := f334;
    to     := f447;
    guard  := F1 > 0;
    action := L' = 1, X4' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t63 := {
    from   := f334;
    to     := f447;
    guard  := Y4 > 0 && 0 >= F1;
    action := L' = 0, X4' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t64 := {
    from   := f334;
    to     := f327;
    guard  := 0 >= F1 && 0 >= Y4 && 0 >= G6;
    action := X' = Q4, Y' = R4, Z' = 2, A1' = S4, B1' = T4 + 1, C1' = U4, D1' = P4, E1' = V4, W4' = 2, T4' = T4 + 1, Z4' = G6, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t65 := {
    from   := f334;
    to     := f327;
    guard  := 0 >= F1 && 0 >= Y4 && G6 > 0;
    action := X' = Q4, Y' = R4, Z' = 2, A1' = S4, B1' = T4 + 1, C1' = U4, D1' = P4, E1' = V4, W4' = 2, T4' = T4 + 1, Y4' = 1, Z4' = G6, A5' = Q4, B5' = R4, C5' = W4, D5' = S4, E5' = T4, F5' = U4, G5' = P4, H5' = V4, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t66 := {
    from   := f355;
    to     := f365;
    guard  := T4 > 0;
    action := F1' = 1, B2' = Q4, C2' = R4, D2' = W4, E2' = S4, F2' = T4, G2' = U4, H2' = P4, I2' = V4, I5' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t67 := {
    from   := f355;
    to     := f365;
    guard  := 0 >= T4;
    action := F1' = 0, B2' = Q4, C2' = R4, D2' = W4, E2' = S4, F2' = T4, G2' = U4, H2' = P4, I2' = V4, I5' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t68 := {
    from   := f365;
    to     := f447;
    guard  := F1 > 0;
    action := L' = 1, X4' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t69 := {
    from   := f318;
    to     := f373;
    guard  := 0 >= P4;
    action := W4' = 4, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t70 := {
    from   := f373;
    to     := f447;
    guard  := 0 >= U4 && J5 > 0;
    action := L' = 0, W4' = 6, U4' = U4 - 1, X4' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t71 := {
    from   := f373;
    to     := f373;
    guard  := 0 >= G6 && 0 >= U4 && 0 >= J5;
    action := W4' = 4, U4' = U4 - 1, K5' = G6, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t72 := {
    from   := f373;
    to     := f373;
    guard  := G6 > 0 && 0 >= U4 && 0 >= J5;
    action := W4' = 4, U4' = U4 - 1, J5' = 1, K5' = G6, L5' = Q4, M5' = R4, N5' = 6, O5' = S4, P5' = T4, Q5' = U4 - 1, R5' = P4, S5' = V4, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t73 := {
    from   := f304;
    to     := f399;
    guard  := 0 >= I;
    action := A' = 7, H' = 1, B2' = E, C2' = F, D2' = 7, E2' = G, F2' = 1, G2' = I, H2' = J, I2' = K, Q4' = E, R4' = F, W4' = 7, S4' = G, T4' = 1, U4' = I, P4' = J, V4' = K, T5' = 0, J5' = 0, Y4' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t74 := {
    from   := f373;
    to     := f399;
    guard  := 0 >= U4;
    action := B2' = Q4, C2' = R4, D2' = 7, E2' = S4, F2' = 1, G2' = U4, H2' = P4, I2' = V4, W4' = 7, T4' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t75 := {
    from   := f399;
    to     := f406;
    guard  := F2 > 0;
    action := F1' = 1, J2' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t76 := {
    from   := f399;
    to     := f406;
    guard  := 0 >= F2;
    action := F1' = 0, J2' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t77 := {
    from   := f406;
    to     := f447;
    guard  := F1 > 0;
    action := L' = 1, X4' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t78 := {
    from   := f365;
    to     := f414;
    guard  := 0 >= F1;
    action := K2' = Q4, L2' = R4, M2' = W4, N2' = S4, O2' = T4, P2' = U4, Q2' = P4, R2' = V4, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t79 := {
    from   := f406;
    to     := f414;
    guard  := 0 >= F1;
    action := K2' = Q4, L2' = R4, M2' = W4, N2' = S4, O2' = T4, P2' = U4, Q2' = P4, R2' = V4, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t80 := {
    from   := f414;
    to     := f421;
    guard  := O2 > 0;
    action := F1' = 1, S2' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t81 := {
    from   := f414;
    to     := f421;
    guard  := 0 >= O2;
    action := F1' = 0, S2' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t82 := {
    from   := f421;
    to     := f447;
    guard  := F1 > 0;
    action := L' = 1, X4' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t83 := {
    from   := f421;
    to     := f430;
    guard  := 0 >= F1;
    action := W4' = 9, P4' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t84 := {
    from   := f430;
    to     := f447;
    guard  := T5 > 0;
    action := L' = 0, X4' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t85 := {
    from   := f430;
    to     := f430;
    guard  := 0 >= T5 && 0 >= G6;
    action := W4' = 9, P4' = 1, U5' = G6, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t86 := {
    from   := f430;
    to     := f430;
    guard  := 0 >= T5 && G6 > 0;
    action := W4' = 9, P4' = 1, T5' = 1, U5' = G6, V5' = Q4, W5' = R4, X5' = W4, Y5' = S4, Z5' = T4, A6' = U4, B6' = P4, C6' = V4, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t87 := {
    from   := f296;
    to     := f460;
    guard  := L > 0;
    action := C3' = E, D3' = F, B' = A, E3' = G, F3' = H, G3' = I, H3' = J, I3' = K, J3' = 0, K3' = 0, L3' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t88 := {
    from   := f447;
    to     := f460;
    guard  := L > 0;
    action := C3' = E, D3' = F, B' = A, E3' = G, F3' = H, G3' = I, H3' = J, I3' = K, J3' = 0, K3' = 0, L3' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t89 := {
    from   := f460;
    to     := f468;
    guard  := H3 > 0;
    action := X' = C3, Y' = D3, Z' = 2, A1' = E3, B1' = F3 + 1, C1' = G3, D1' = H3, E1' = I3, B' = 2, F3' = F3 + 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t90 := {
    from   := f468;
    to     := f475;
    guard  := B1 > 0;
    action := F1' = 1, G1' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t91 := {
    from   := f468;
    to     := f475;
    guard  := 0 >= B1;
    action := F1' = 0, G1' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t92 := {
    from   := f475;
    to     := f588;
    guard  := F1 > 0;
    action := L' = 1, D6' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t93 := {
    from   := f475;
    to     := f588;
    guard  := 0 >= F1 && L3 > 0;
    action := L' = 0, D6' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t94 := {
    from   := f475;
    to     := f468;
    guard  := 0 >= L3 && 0 >= G6 && 0 >= F1;
    action := X' = C3, Y' = D3, Z' = 2, A1' = E3, B1' = F3 + 1, C1' = G3, D1' = H3, E1' = I3, B' = 2, F3' = F3 + 1, N3' = G6, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t95 := {
    from   := f475;
    to     := f468;
    guard  := 0 >= L3 && G6 > 0 && 0 >= F1;
    action := X' = C3, Y' = D3, Z' = 2, A1' = E3, B1' = F3 + 1, C1' = G3, D1' = H3, E1' = I3, B' = 2, F3' = F3 + 1, L3' = 1, N3' = G6, O3' = C3, P3' = D3, Q3' = B, R3' = E3, S3' = F3, T3' = G3, U3' = H3, V3' = I3, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t96 := {
    from   := f496;
    to     := f506;
    guard  := F3 > 0;
    action := F1' = 1, K2' = C3, L2' = D3, M2' = B, N2' = E3, O2' = F3, P2' = G3, Q2' = H3, R2' = I3, W3' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t97 := {
    from   := f496;
    to     := f506;
    guard  := 0 >= F3;
    action := F1' = 0, K2' = C3, L2' = D3, M2' = B, N2' = E3, O2' = F3, P2' = G3, Q2' = H3, R2' = I3, W3' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t98 := {
    from   := f506;
    to     := f588;
    guard  := F1 > 0;
    action := L' = 1, D6' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t99 := {
    from   := f460;
    to     := f514;
    guard  := 0 >= H3;
    action := B' = 4, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t100 := {
    from   := f514;
    to     := f588;
    guard  := 0 >= G3 && K3 > 0;
    action := L' = 0, B' = 6, G3' = G3 - 1, D6' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t101 := {
    from   := f514;
    to     := f514;
    guard  := 0 >= K3 && 0 >= G6 && 0 >= G3;
    action := B' = 4, G3' = G3 - 1, X3' = G6, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t102 := {
    from   := f514;
    to     := f514;
    guard  := 0 >= K3 && G6 > 0 && 0 >= G3;
    action := B' = 4, G3' = G3 - 1, K3' = 1, X3' = G6, Y3' = C3, Z3' = D3, A4' = 6, B4' = E3, C4' = F3, D4' = G3 - 1, E4' = H3, F4' = I3, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t103 := {
    from   := f514;
    to     := f547;
    guard  := 0 >= G3;
    action := F1' = 1, B2' = C3, C2' = D3, D2' = 7, E2' = E3, F2' = 1, G2' = G3, H2' = H3, I2' = I3, J2' = 1, B' = 7, F3' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t104 := {
    from   := f547;
    to     := f588;
    guard  := F1 > 0;
    action := L' = 1, D6' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t105 := {
    from   := f506;
    to     := f555;
    guard  := 0 >= F1;
    action := K2' = C3, L2' = D3, M2' = B, N2' = E3, O2' = F3, P2' = G3, Q2' = H3, R2' = I3, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t106 := {
    from   := f547;
    to     := f555;
    guard  := 0 >= F1;
    action := K2' = C3, L2' = D3, M2' = B, N2' = E3, O2' = F3, P2' = G3, Q2' = H3, R2' = I3, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t107 := {
    from   := f555;
    to     := f562;
    guard  := O2 > 0;
    action := F1' = 1, S2' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t108 := {
    from   := f555;
    to     := f562;
    guard  := 0 >= O2;
    action := F1' = 0, S2' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t109 := {
    from   := f562;
    to     := f588;
    guard  := F1 > 0;
    action := L' = 1, D6' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t110 := {
    from   := f562;
    to     := f571;
    guard  := 0 >= F1;
    action := B' = 9, H3' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t111 := {
    from   := f571;
    to     := f588;
    guard  := J3 > 0;
    action := L' = 0, D6' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t112 := {
    from   := f571;
    to     := f571;
    guard  := 0 >= G6 && 0 >= J3;
    action := B' = 9, H3' = 1, G4' = G6, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t113 := {
    from   := f571;
    to     := f571;
    guard  := G6 > 0 && 0 >= J3;
    action := B' = 9, H3' = 1, J3' = 1, G4' = G6, H4' = C3, I4' = D3, J4' = B, K4' = E3, L4' = F3, M4' = G3, N4' = H3, O4' = I3, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t114 := {
    from   := f596;
    to     := f596;
    guard  := true;
    action := A' = 9, J' = 1, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t115 := {
    from   := f588;
    to     := f596;
    guard  := L > 0;
    action := A' = 9, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t116 := {
    from   := f155;
    to     := f666666;
    guard  := 0 >= L;
    action := E6' = 0, F6' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t117 := {
    from   := f296;
    to     := f666666;
    guard  := 0 >= L;
    action := E6' = 0, F6' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t118 := {
    from   := f447;
    to     := f666666;
    guard  := 0 >= L;
    action := E6' = 0, F6' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
  transition t119 := {
    from   := f588;
    to     := f666666;
    guard  := 0 >= L;
    action := E6' = 0, F6' = 0, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?;
  };
}
strategy dumb {
  Region init := { state = f3 };
}
