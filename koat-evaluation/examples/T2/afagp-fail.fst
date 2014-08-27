model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1, N1, O1, P1, Q1, R1, S1, T1, U1, V1, W1, X1, Y1, Z1, A2, B2, C2, D2, E2, F2, G2, H2, I2, J2, K2, L2, M2, N2, O2, P2, Q2, R2, S2, T2, U2, V2, W2, X2, Y2, Z2, A3, B3, C3, D3, E3, F3, G3, H3, I3, J3, K3, L3, M3, N3, O3, P3, Q3, R3, S3, T3, U3, V3;
  states f15, f22, f3, f33, f53, f60, f67, f128, f83, f89, f96, f143, f149, f113, f121, f133, f160, f167, f228, f183, f196, f243, f249, f206, f213, f221, f233, f281, f258, f265, f326, f294, f341, f347, f311, f319, f331, f371, f378, f439, f394, f367, f407, f454, f460, f424, f432, f444, f666666;
  transition t0 := {
    from   := f15;
    to     := f22;
    guard  := true;
    action := A' = 3, B' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t1 := {
    from   := f3;
    to     := f22;
    guard  := true;
    action := C' = 0, D' = 0, E' = 0, F' = S3, G' = T3, A' = 3, B' = 0, H' = 0, I' = U3, J' = V3, K' = 0, L' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t2 := {
    from   := f22;
    to     := f33;
    guard  := 0 >= I && S3 > 0;
    action := G' = S3, A' = 7, I' = I - 1, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t3 := {
    from   := f22;
    to     := f33;
    guard  := 0 >= I && 0 >= S3;
    action := G' = S3, A' = 8, I' = I - 2, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t4 := {
    from   := f33;
    to     := f22;
    guard  := 0 >= L && 0 >= S3;
    action := A' = 3, M' = S3, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t5 := {
    from   := f33;
    to     := f22;
    guard  := 0 >= L && S3 > 0;
    action := A' = 3, L' = 1, M' = S3, N' = F, O' = G, P' = A, Q' = B, R' = H, S' = I, T' = J, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t6 := {
    from   := f22;
    to     := f53;
    guard  := 0 >= I;
    action := F' = S3, A' = 11, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t7 := {
    from   := f60;
    to     := f67;
    guard  := true;
    action := U' = 3, V' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t8 := {
    from   := f67;
    to     := f67;
    guard  := 0 >= W && S3 > 0;
    action := X' = S3, U' = 3, W' = W - 1, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t9 := {
    from   := f67;
    to     := f67;
    guard  := 0 >= W && 0 >= S3;
    action := X' = S3, U' = 3, W' = W - 2, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t10 := {
    from   := f128;
    to     := f83;
    guard  := Y > 0;
    action := Z' = S3, U' = 11, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t11 := {
    from   := f67;
    to     := f83;
    guard  := 0 >= W;
    action := Z' = S3, U' = 11, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t12 := {
    from   := f53;
    to     := f89;
    guard  := F > 0;
    action := A' = 12, H' = 1, Z' = F, X' = G, U' = 12, V' = B, A1' = 1, W' = I, B1' = J, C1' = F, D1' = G, E1' = 12, F1' = B, G1' = 1, H1' = I, I1' = J, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t13 := {
    from   := f83;
    to     := f89;
    guard  := Z > 0;
    action := U' = 12, A1' = 1, C1' = Z, D1' = X, E1' = 12, F1' = V, G1' = 1, H1' = W, I1' = B1, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t14 := {
    from   := f89;
    to     := f96;
    guard  := G1 > 0;
    action := Y' = 1, J1' = 1, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t15 := {
    from   := f89;
    to     := f96;
    guard  := 0 >= G1;
    action := Y' = 0, J1' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t16 := {
    from   := f143;
    to     := f149;
    guard  := Y > 0;
    action := K1' = L1, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t17 := {
    from   := f96;
    to     := f149;
    guard  := 0 >= Y;
    action := K1' = 0, L1' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t18 := {
    from   := f83;
    to     := f113;
    guard  := 0 >= Z;
    action := U' = 13, A1' = 0, Y' = 0, M1' = Z, N1' = X, O1' = 13, P1' = V, Q1' = 0, R1' = W, S1' = B1, T1' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t19 := {
    from   := f113;
    to     := f149;
    guard  := 0 >= Y;
    action := K1' = 0, L1' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t20 := {
    from   := f96;
    to     := f121;
    guard  := Y > 0;
    action := U1' = Z, V1' = X, W1' = U, X1' = V, Y1' = A1, Z1' = W, A2' = B1, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t21 := {
    from   := f113;
    to     := f121;
    guard  := Y > 0;
    action := U1' = Z, V1' = X, W1' = U, X1' = V, Y1' = A1, Z1' = W, A2' = B1, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t22 := {
    from   := f121;
    to     := f128;
    guard  := Y1 > 0;
    action := Y' = 1, B2' = 1, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t23 := {
    from   := f121;
    to     := f128;
    guard  := 0 >= Y1;
    action := Y' = 0, B2' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t24 := {
    from   := f128;
    to     := f149;
    guard  := 0 >= Y;
    action := K1' = 0, L1' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t25 := {
    from   := f133;
    to     := f143;
    guard  := A1 > 0;
    action := Y' = 1, C2' = Z, D2' = X, E2' = U, F2' = V, G2' = A1, H2' = W, I2' = B1, J2' = 1, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t26 := {
    from   := f133;
    to     := f143;
    guard  := 0 >= A1;
    action := Y' = 0, C2' = Z, D2' = X, E2' = U, F2' = V, G2' = A1, H2' = W, I2' = B1, J2' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t27 := {
    from   := f143;
    to     := f149;
    guard  := 0 >= Y;
    action := K1' = 0, L1' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t28 := {
    from   := f160;
    to     := f167;
    guard  := true;
    action := K2' = 3, L2' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t29 := {
    from   := f167;
    to     := f167;
    guard  := 0 >= M2 && S3 > 0;
    action := N2' = S3, K2' = 3, M2' = M2 - 1, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t30 := {
    from   := f167;
    to     := f167;
    guard  := 0 >= M2 && 0 >= S3;
    action := N2' = S3, K2' = 3, M2' = M2 - 2, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t31 := {
    from   := f228;
    to     := f183;
    guard  := Y > 0;
    action := O2' = S3, K2' = 11, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t32 := {
    from   := f167;
    to     := f183;
    guard  := 0 >= M2;
    action := O2' = S3, K2' = 11, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t33 := {
    from   := f183;
    to     := f196;
    guard  := O2 > 0;
    action := C1' = O2, D1' = N2, E1' = 12, F1' = L2, G1' = 1, H1' = M2, I1' = P2, Y' = 1, J1' = 1, K2' = 12, Q2' = 1, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t34 := {
    from   := f243;
    to     := f249;
    guard  := Y > 0;
    action := K1' = R2, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t35 := {
    from   := f196;
    to     := f249;
    guard  := 0 >= Y;
    action := K1' = 0, R2' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t36 := {
    from   := f53;
    to     := f206;
    guard  := 0 >= F;
    action := A' = 13, H' = 0, M1' = F, N1' = G, O1' = 13, P1' = B, Q1' = 0, R1' = I, S1' = J, O2' = F, N2' = G, K2' = 13, L2' = B, Q2' = 0, M2' = I, P2' = J, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t37 := {
    from   := f183;
    to     := f206;
    guard  := 0 >= O2;
    action := M1' = O2, N1' = N2, O1' = 13, P1' = L2, Q1' = 0, R1' = M2, S1' = P2, K2' = 13, Q2' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t38 := {
    from   := f206;
    to     := f213;
    guard  := Q1 > 0;
    action := Y' = 1, T1' = 1, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t39 := {
    from   := f206;
    to     := f213;
    guard  := 0 >= Q1;
    action := Y' = 0, T1' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t40 := {
    from   := f213;
    to     := f249;
    guard  := 0 >= Y;
    action := K1' = 0, R2' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t41 := {
    from   := f196;
    to     := f221;
    guard  := Y > 0;
    action := U1' = O2, V1' = N2, W1' = K2, X1' = L2, Y1' = Q2, Z1' = M2, A2' = P2, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t42 := {
    from   := f213;
    to     := f221;
    guard  := Y > 0;
    action := U1' = O2, V1' = N2, W1' = K2, X1' = L2, Y1' = Q2, Z1' = M2, A2' = P2, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t43 := {
    from   := f221;
    to     := f228;
    guard  := Y1 > 0;
    action := Y' = 1, B2' = 1, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t44 := {
    from   := f221;
    to     := f228;
    guard  := 0 >= Y1;
    action := Y' = 0, B2' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t45 := {
    from   := f228;
    to     := f249;
    guard  := 0 >= Y;
    action := K1' = 0, R2' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t46 := {
    from   := f233;
    to     := f243;
    guard  := Q2 > 0;
    action := Y' = 1, C2' = O2, D2' = N2, E2' = K2, F2' = L2, G2' = Q2, H2' = M2, I2' = P2, J2' = 1, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t47 := {
    from   := f233;
    to     := f243;
    guard  := 0 >= Q2;
    action := Y' = 0, C2' = O2, D2' = N2, E2' = K2, F2' = L2, G2' = Q2, H2' = M2, I2' = P2, J2' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t48 := {
    from   := f243;
    to     := f249;
    guard  := 0 >= Y;
    action := K1' = 0, R2' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t49 := {
    from   := f149;
    to     := f281;
    guard  := 0 >= K1;
    action := S2' = F, T2' = G, U2' = A, V2' = B, W2' = H, X2' = I, Y2' = J, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t50 := {
    from   := f249;
    to     := f281;
    guard  := 0 >= K1;
    action := S2' = F, T2' = G, U2' = A, V2' = B, W2' = H, X2' = I, Y2' = J, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t51 := {
    from   := f258;
    to     := f265;
    guard  := true;
    action := U2' = 3, V2' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t52 := {
    from   := f265;
    to     := f265;
    guard  := 0 >= X2 && S3 > 0;
    action := T2' = S3, U2' = 3, X2' = X2 - 1, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t53 := {
    from   := f265;
    to     := f265;
    guard  := 0 >= X2 && 0 >= S3;
    action := T2' = S3, U2' = 3, X2' = X2 - 2, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t54 := {
    from   := f326;
    to     := f281;
    guard  := Y > 0;
    action := S2' = S3, U2' = 11, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t55 := {
    from   := f265;
    to     := f281;
    guard  := 0 >= X2;
    action := S2' = S3, U2' = 11, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t56 := {
    from   := f281;
    to     := f294;
    guard  := S2 > 0;
    action := C1' = S2, D1' = T2, E1' = 12, F1' = V2, G1' = 1, H1' = X2, I1' = Y2, Y' = 1, J1' = 1, U2' = 12, W2' = 1, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t57 := {
    from   := f341;
    to     := f347;
    guard  := Y > 0;
    action := K1' = Z2, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t58 := {
    from   := f294;
    to     := f347;
    guard  := 0 >= Y;
    action := K1' = 0, Z2' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t59 := {
    from   := f281;
    to     := f311;
    guard  := 0 >= S2;
    action := Y' = 0, M1' = S2, N1' = T2, O1' = 13, P1' = V2, Q1' = 0, R1' = X2, S1' = Y2, T1' = 0, U2' = 13, W2' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t60 := {
    from   := f311;
    to     := f347;
    guard  := 0 >= Y;
    action := K1' = 0, Z2' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t61 := {
    from   := f294;
    to     := f319;
    guard  := Y > 0;
    action := U1' = S2, V1' = T2, W1' = U2, X1' = V2, Y1' = W2, Z1' = X2, A2' = Y2, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t62 := {
    from   := f311;
    to     := f319;
    guard  := Y > 0;
    action := U1' = S2, V1' = T2, W1' = U2, X1' = V2, Y1' = W2, Z1' = X2, A2' = Y2, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t63 := {
    from   := f319;
    to     := f326;
    guard  := Y1 > 0;
    action := Y' = 1, B2' = 1, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t64 := {
    from   := f319;
    to     := f326;
    guard  := 0 >= Y1;
    action := Y' = 0, B2' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t65 := {
    from   := f326;
    to     := f347;
    guard  := 0 >= Y;
    action := K1' = 0, Z2' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t66 := {
    from   := f331;
    to     := f341;
    guard  := W2 > 0;
    action := Y' = 1, C2' = S2, D2' = T2, E2' = U2, F2' = V2, G2' = W2, H2' = X2, I2' = Y2, J2' = 1, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t67 := {
    from   := f331;
    to     := f341;
    guard  := 0 >= W2;
    action := Y' = 0, C2' = S2, D2' = T2, E2' = U2, F2' = V2, G2' = W2, H2' = X2, I2' = Y2, J2' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t68 := {
    from   := f341;
    to     := f347;
    guard  := 0 >= Y;
    action := K1' = 0, Z2' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t69 := {
    from   := f347;
    to     := f53;
    guard  := 0 >= T3 && 0 >= K && 0 >= K1;
    action := F' = S3, A' = 11, A3' = T3, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t70 := {
    from   := f347;
    to     := f53;
    guard  := T3 > 0 && 0 >= K && 0 >= K1;
    action := F' = S3, A' = 11, K' = 1, A3' = T3, B3' = F, C3' = G, D3' = A, E3' = B, F3' = H, G3' = I, H3' = J, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t71 := {
    from   := f371;
    to     := f378;
    guard  := true;
    action := I3' = 3, J3' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t72 := {
    from   := f378;
    to     := f378;
    guard  := 0 >= K3 && S3 > 0;
    action := L3' = S3, I3' = 3, K3' = K3 - 1, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t73 := {
    from   := f378;
    to     := f378;
    guard  := 0 >= K3 && 0 >= S3;
    action := L3' = S3, I3' = 3, K3' = K3 - 2, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t74 := {
    from   := f439;
    to     := f394;
    guard  := Y > 0;
    action := M3' = S3, I3' = 11, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t75 := {
    from   := f367;
    to     := f394;
    guard  := true;
    action := M3' = S3, L3' = G, I3' = 11, J3' = B, N3' = H, K3' = I, O3' = J, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t76 := {
    from   := f378;
    to     := f394;
    guard  := 0 >= K3;
    action := M3' = S3, I3' = 11, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t77 := {
    from   := f394;
    to     := f407;
    guard  := M3 > 0;
    action := C1' = M3, D1' = L3, E1' = 12, F1' = J3, G1' = 1, H1' = K3, I1' = O3, Y' = 1, J1' = 1, I3' = 12, N3' = 1, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t78 := {
    from   := f454;
    to     := f460;
    guard  := Y > 0;
    action := K1' = P3, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t79 := {
    from   := f407;
    to     := f460;
    guard  := 0 >= Y;
    action := K1' = 0, P3' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t80 := {
    from   := f394;
    to     := f424;
    guard  := 0 >= M3;
    action := Y' = 0, M1' = M3, N1' = L3, O1' = 13, P1' = J3, Q1' = 0, R1' = K3, S1' = O3, T1' = 0, I3' = 13, N3' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t81 := {
    from   := f424;
    to     := f460;
    guard  := 0 >= Y;
    action := K1' = 0, P3' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t82 := {
    from   := f407;
    to     := f432;
    guard  := Y > 0;
    action := U1' = M3, V1' = L3, W1' = I3, X1' = J3, Y1' = N3, Z1' = K3, A2' = O3, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t83 := {
    from   := f424;
    to     := f432;
    guard  := Y > 0;
    action := U1' = M3, V1' = L3, W1' = I3, X1' = J3, Y1' = N3, Z1' = K3, A2' = O3, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t84 := {
    from   := f432;
    to     := f439;
    guard  := Y1 > 0;
    action := Y' = 1, B2' = 1, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t85 := {
    from   := f432;
    to     := f439;
    guard  := 0 >= Y1;
    action := Y' = 0, B2' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t86 := {
    from   := f439;
    to     := f460;
    guard  := 0 >= Y;
    action := K1' = 0, P3' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t87 := {
    from   := f444;
    to     := f454;
    guard  := N3 > 0;
    action := Y' = 1, C2' = M3, D2' = L3, E2' = I3, F2' = J3, G2' = N3, H2' = K3, I2' = O3, J2' = 1, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t88 := {
    from   := f444;
    to     := f454;
    guard  := 0 >= N3;
    action := Y' = 0, C2' = M3, D2' = L3, E2' = I3, F2' = J3, G2' = N3, H2' = K3, I2' = O3, J2' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t89 := {
    from   := f454;
    to     := f460;
    guard  := 0 >= Y;
    action := K1' = 0, P3' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t90 := {
    from   := f460;
    to     := f666666;
    guard  := Q3 > 1 && 0 >= K1;
    action := R3' = Q3, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t91 := {
    from   := f460;
    to     := f666666;
    guard  := 0 >= Q3 && 0 >= K1;
    action := R3' = Q3, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t92 := {
    from   := f33;
    to     := f666666;
    guard  := L > 0;
    action := Q3' = 0, R3' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
  transition t93 := {
    from   := f347;
    to     := f666666;
    guard  := K > 0 && 0 >= K1;
    action := Q3' = 0, R3' = 0, S3' = ?, T3' = ?, U3' = ?, V3' = ?;
  };
}
strategy dumb {
  Region init := { state = f3 };
}
