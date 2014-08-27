model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1, N1, O1, P1, Q1, R1, S1, T1, U1, V1, W1, X1;
  states f274, f283, f0, f41, f49, f56, f73, f75, f81, f88, f97, f99, f106, f123, f128, f130, f135, f142, f151, f156, f160, f165, f167, f172, f179, f191, f195, f202, f204, f210, f217, f223, f230, f232, f235, f247, f243, f250, f263, f277, f292, f300, f315, f331, f350;
  transition t0 := {
    from   := f274;
    to     := f283;
    guard  := A > B;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t1 := {
    from   := f274;
    to     := f283;
    guard  := B > A;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t2 := {
    from   := f0;
    to     := f41;
    guard  := true;
    action := C' = 0, D' = 0, E' = 0, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t3 := {
    from   := f41;
    to     := f49;
    guard  := F >= G && H >= G;
    action := D' = 0, E' = 0, B' = G + 1, I' = 0, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t4 := {
    from   := f49;
    to     := f49;
    guard  := H >= A;
    action := D' = D + R1, A' = A + 1, J' = R1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t5 := {
    from   := f56;
    to     := f56;
    guard  := H >= A;
    action := I' = R1, A' = A + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t6 := {
    from   := f73;
    to     := f75;
    guard  := F >= K;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t7 := {
    from   := f75;
    to     := f75;
    guard  := H >= A;
    action := I' = R1, A' = A + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t8 := {
    from   := f81;
    to     := f81;
    guard  := H >= A;
    action := A' = A + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t9 := {
    from   := f88;
    to     := f88;
    guard  := H >= A;
    action := A' = A + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t10 := {
    from   := f41;
    to     := f97;
    guard  := G > H && F >= G;
    action := D' = 0, E' = 0, B' = G + 1, I' = 0, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t11 := {
    from   := f97;
    to     := f99;
    guard  := F > G && H >= G;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t12 := {
    from   := f97;
    to     := f99;
    guard  := G > F && H >= G;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t13 := {
    from   := f99;
    to     := f99;
    guard  := F >= A;
    action := D' = D + R1, A' = A + 1, L' = R1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t14 := {
    from   := f106;
    to     := f106;
    guard  := F >= A;
    action := I' = R1, A' = A + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t15 := {
    from   := f123;
    to     := f123;
    guard  := F >= A;
    action := A' = A + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t16 := {
    from   := f128;
    to     := f130;
    guard  := H >= K;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t17 := {
    from   := f130;
    to     := f130;
    guard  := F >= A;
    action := I' = R1, A' = A + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t18 := {
    from   := f135;
    to     := f135;
    guard  := F >= A;
    action := A' = A + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t19 := {
    from   := f142;
    to     := f142;
    guard  := F >= A;
    action := A' = A + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t20 := {
    from   := f97;
    to     := f151;
    guard  := G > H;
    action := M' = C, N' = R1, O' = S1, P' = R1 + S1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t21 := {
    from   := f97;
    to     := f151;
    guard  := H >= F && G = F;
    action := F' = G, M' = C, N' = R1, O' = S1, P' = R1 + S1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t22 := {
    from   := f151;
    to     := f41;
    guard  := M > P;
    action := C' = M, G' = G + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t23 := {
    from   := f151;
    to     := f41;
    guard  := P >= M;
    action := C' = P, G' = G + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t24 := {
    from   := f156;
    to     := f160;
    guard  := F > G && 0 > E && G > 0;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t25 := {
    from   := f156;
    to     := f160;
    guard  := F > G && E > 0 && G > 0;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t26 := {
    from   := f160;
    to     := f160;
    guard  := F >= K;
    action := K' = K + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t27 := {
    from   := f165;
    to     := f167;
    guard  := F >= K;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t28 := {
    from   := f167;
    to     := f167;
    guard  := F >= A;
    action := I' = R1, A' = A + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t29 := {
    from   := f172;
    to     := f172;
    guard  := F >= A;
    action := A' = A + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t30 := {
    from   := f156;
    to     := f179;
    guard  := G > 0 && F > G && E = 0;
    action := E' = 0, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t31 := {
    from   := f179;
    to     := f179;
    guard  := F >= K;
    action := K' = K + 1, Q' = 0, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t32 := {
    from   := f156;
    to     := f156;
    guard  := G > 0 && G >= F;
    action := E' = R1, G' = G - 1, B' = G, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t33 := {
    from   := f191;
    to     := f195;
    guard  := G > 0;
    action := E' = R1, B' = G + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t34 := {
    from   := f195;
    to     := f195;
    guard  := F >= K;
    action := K' = K + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t35 := {
    from   := f202;
    to     := f204;
    guard  := F >= K;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t36 := {
    from   := f204;
    to     := f204;
    guard  := H >= A;
    action := I' = R1, A' = A + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t37 := {
    from   := f210;
    to     := f210;
    guard  := H >= A;
    action := A' = A + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t38 := {
    from   := f217;
    to     := f217;
    guard  := H >= K;
    action := K' = K + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t39 := {
    from   := f223;
    to     := f223;
    guard  := H >= K;
    action := K' = K + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t40 := {
    from   := f230;
    to     := f232;
    guard  := A > 0;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t41 := {
    from   := f232;
    to     := f235;
    guard  := 30 >= R;
    action := S' = 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t42 := {
    from   := f235;
    to     := f247;
    guard  := 0 >= B;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t43 := {
    from   := f235;
    to     := f247;
    guard  := B > 0;
    action := S' = 0, T' = B - 1, U' = C - R1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t44 := {
    from   := f235;
    to     := f243;
    guard  := 0 > R1 && B > 0;
    action := T' = B - 1, U' = R1, V' = S1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t45 := {
    from   := f235;
    to     := f243;
    guard  := R1 > 0 && B > 0;
    action := T' = B - 1, U' = R1, V' = S1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t46 := {
    from   := f243;
    to     := f247;
    guard  := true;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t47 := {
    from   := f243;
    to     := f235;
    guard  := 0 > V;
    action := B' = B - 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t48 := {
    from   := f243;
    to     := f235;
    guard  := V > 0;
    action := B' = B - 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t49 := {
    from   := f247;
    to     := f250;
    guard  := 0 > S;
    action := I' = 1, W' = 0, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t50 := {
    from   := f247;
    to     := f250;
    guard  := S > 0;
    action := I' = 1, W' = 0, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t51 := {
    from   := f250;
    to     := f263;
    guard  := 0 > T1 && A >= G;
    action := E' = R1, I' = S1, X' = U1, Y' = V1, W' = W1, Z' = T1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t52 := {
    from   := f250;
    to     := f263;
    guard  := T1 > 0 && A >= G;
    action := E' = R1, I' = S1, X' = U1, Y' = V1, W' = W1, Z' = T1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t53 := {
    from   := f263;
    to     := f263;
    guard  := H >= K;
    action := K' = K + 1, A1' = R1, B1' = S1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t54 := {
    from   := f247;
    to     := f274;
    guard  := S = 0;
    action := S' = 0, B1' = R1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t55 := {
    from   := f274;
    to     := f277;
    guard  := 0 > B1 && B = A;
    action := A' = B, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t56 := {
    from   := f277;
    to     := f277;
    guard  := F >= K;
    action := K' = K + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t57 := {
    from   := f283;
    to     := f292;
    guard  := 29 >= R;
    action := E' = R1, X' = S1, Y' = U1, T' = A - 1, A1' = V1, C1' = W1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t58 := {
    from   := f283;
    to     := f292;
    guard  := R > 30;
    action := E' = R1, X' = S1, Y' = U1, T' = A - 1, A1' = V1, C1' = W1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t59 := {
    from   := f283;
    to     := f292;
    guard  := R = 30;
    action := E' = R1, X' = S1, Y' = U1, R' = 30, T' = A - 1, A1' = V1, C1' = W1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t60 := {
    from   := f292;
    to     := f300;
    guard  := X >= 0;
    action := I' = 1, X' = R1, W' = 1, D1' = S1, E1' = S1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t61 := {
    from   := f292;
    to     := f300;
    guard  := 0 > X;
    action := I' = 1, X' = R1, W' = 1, E1' = -S1, F1' = S1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t62 := {
    from   := f300;
    to     := f315;
    guard  := T >= K;
    action := E' = R1, G' = K + 1, I' = S1, X' = U1, Y' = V1, W' = W1, A1' = T1, B1' = X1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t63 := {
    from   := f315;
    to     := f315;
    guard  := F >= G1;
    action := B1' = R1, C1' = S1, G1' = G1 + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t64 := {
    from   := f331;
    to     := f331;
    guard  := H >= G1;
    action := A1' = R1, B1' = S1, G1' = G1 + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t65 := {
    from   := f331;
    to     := f300;
    guard  := G1 > H;
    action := K' = K + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t66 := {
    from   := f315;
    to     := f331;
    guard  := G1 > F;
    action := X' = R1, B1' = 0, C1' = S1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t67 := {
    from   := f315;
    to     := f331;
    guard  := G1 > F && 0 > T1;
    action := I' = R1, X' = S1, W' = U1, B1' = V1, C1' = W1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t68 := {
    from   := f315;
    to     := f331;
    guard  := G1 > F && T1 > 0;
    action := I' = R1, X' = S1, W' = U1, B1' = V1, C1' = W1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t69 := {
    from   := f300;
    to     := f232;
    guard  := K > T;
    action := R' = R + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t70 := {
    from   := f232;
    to     := f230;
    guard  := R > 30;
    action := A' = A - 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t71 := {
    from   := f274;
    to     := f230;
    guard  := B1 >= 0 && B = A;
    action := A' = B - 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t72 := {
    from   := f277;
    to     := f230;
    guard  := K > F;
    action := A' = A - 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t73 := {
    from   := f263;
    to     := f250;
    guard  := K > H;
    action := G' = G + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t74 := {
    from   := f250;
    to     := f274;
    guard  := G > A;
    action := B1' = R1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t75 := {
    from   := f250;
    to     := f274;
    guard  := A >= G;
    action := X' = S1, Z' = C - R1, B1' = U1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t76 := {
    from   := f230;
    to     := f350;
    guard  := 0 >= A;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t77 := {
    from   := f223;
    to     := f191;
    guard  := K > H;
    action := G' = G - 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t78 := {
    from   := f217;
    to     := f191;
    guard  := K > H;
    action := G' = G - 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t79 := {
    from   := f210;
    to     := f202;
    guard  := A > H;
    action := K' = K + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t80 := {
    from   := f204;
    to     := f210;
    guard  := A > H;
    action := X' = R1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t81 := {
    from   := f202;
    to     := f217;
    guard  := K > F;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t82 := {
    from   := f195;
    to     := f202;
    guard  := K > F && 0 > E;
    action := E' = R1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t83 := {
    from   := f195;
    to     := f202;
    guard  := K > F && E > 0;
    action := E' = R1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t84 := {
    from   := f195;
    to     := f223;
    guard  := K > F && E = 0;
    action := E' = 0, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t85 := {
    from   := f191;
    to     := f230;
    guard  := 0 >= G;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t86 := {
    from   := f179;
    to     := f156;
    guard  := K > F;
    action := E' = R1, G' = G - 1, B' = G, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t87 := {
    from   := f172;
    to     := f165;
    guard  := A > F;
    action := K' = K + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t88 := {
    from   := f167;
    to     := f172;
    guard  := A > F;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t89 := {
    from   := f165;
    to     := f179;
    guard  := K > F;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t90 := {
    from   := f160;
    to     := f165;
    guard  := K > F;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t91 := {
    from   := f156;
    to     := f191;
    guard  := 0 >= G;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t92 := {
    from   := f142;
    to     := f151;
    guard  := A > F;
    action := M' = C, N' = R1, O' = S1, P' = R1 + S1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t93 := {
    from   := f135;
    to     := f128;
    guard  := A > F;
    action := K' = K + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t94 := {
    from   := f130;
    to     := f135;
    guard  := A > F;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t95 := {
    from   := f128;
    to     := f142;
    guard  := K > H;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t96 := {
    from   := f123;
    to     := f128;
    guard  := A > F;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t97 := {
    from   := f106;
    to     := f123;
    guard  := S1 >= 0 && A > F;
    action := E' = -R1, X' = S1, Y' = U1, H1' = V1, I1' = R1, J1' = R1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t98 := {
    from   := f106;
    to     := f123;
    guard  := 0 > S1 && A > F;
    action := E' = R1, X' = S1, Y' = U1, J1' = -R1, K1' = V1, L1' = R1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t99 := {
    from   := f99;
    to     := f106;
    guard  := 0 > D && A > F;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t100 := {
    from   := f99;
    to     := f106;
    guard  := D > 0 && A > F;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t101 := {
    from   := f99;
    to     := f151;
    guard  := A > F && D = 0;
    action := D' = 0, M' = C, N' = R1, O' = S1, P' = R1 + S1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t102 := {
    from   := f88;
    to     := f97;
    guard  := A > H;
    action := D' = 0, E' = 0, I' = 0, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t103 := {
    from   := f81;
    to     := f73;
    guard  := A > H;
    action := K' = K + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t104 := {
    from   := f75;
    to     := f81;
    guard  := A > H;
    action := X' = R1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t105 := {
    from   := f73;
    to     := f88;
    guard  := K > F;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t106 := {
    from   := f56;
    to     := f73;
    guard  := S1 >= 0 && A > H;
    action := E' = -R1, X' = S1, M1' = U1, N1' = R1, O1' = R1, Y' = V1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t107 := {
    from   := f56;
    to     := f73;
    guard  := 0 > S1 && A > H;
    action := E' = R1, X' = S1, O1' = -R1, P1' = U1, Q1' = R1, Y' = V1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t108 := {
    from   := f49;
    to     := f56;
    guard  := 0 > D && A > H;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t109 := {
    from   := f49;
    to     := f56;
    guard  := D > 0 && A > H;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t110 := {
    from   := f49;
    to     := f97;
    guard  := A > H && D = 0;
    action := D' = 0, E' = 0, I' = 0, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t111 := {
    from   := f41;
    to     := f156;
    guard  := G > F;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
