model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1, N1, O1, P1, Q1, R1, S1, T1, U1, V1, W1, X1;
  states f271, f281, f2, f7, f16, f24, f42, f45, f52, f60, f69, f72, f80, f98, f104, f107, f113, f121, f130, f136, f141, f147, f150, f156, f164, f177, f182, f190, f193, f200, f208, f215, f223, f226, f230, f241, f238, f246, f260, f275, f290, f299, f315, f332, f1;
  transition t0 := {
    from   := f271;
    to     := f281;
    guard  := A > B;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t1 := {
    from   := f271;
    to     := f281;
    guard  := B > A;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t2 := {
    from   := f2;
    to     := f7;
    guard  := true;
    action := C' = 0, D' = 0, E' = 0, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t3 := {
    from   := f7;
    to     := f16;
    guard  := F >= G && H >= G;
    action := D' = 0, E' = 0, B' = G + 1, I' = 0, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t4 := {
    from   := f16;
    to     := f16;
    guard  := H >= A;
    action := D' = D + R1, A' = A + 1, J' = R1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t5 := {
    from   := f24;
    to     := f24;
    guard  := H >= A;
    action := I' = R1, A' = A + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t6 := {
    from   := f42;
    to     := f45;
    guard  := F >= K;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t7 := {
    from   := f45;
    to     := f45;
    guard  := H >= A;
    action := I' = R1, A' = A + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t8 := {
    from   := f52;
    to     := f52;
    guard  := H >= A;
    action := A' = A + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t9 := {
    from   := f60;
    to     := f60;
    guard  := H >= A;
    action := A' = A + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t10 := {
    from   := f7;
    to     := f69;
    guard  := G > H && F >= G;
    action := D' = 0, E' = 0, B' = G + 1, I' = 0, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t11 := {
    from   := f69;
    to     := f72;
    guard  := F > G && H >= G;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t12 := {
    from   := f69;
    to     := f72;
    guard  := G > F && H >= G;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t13 := {
    from   := f72;
    to     := f72;
    guard  := F >= A;
    action := D' = D + R1, A' = A + 1, L' = R1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t14 := {
    from   := f80;
    to     := f80;
    guard  := F >= A;
    action := I' = R1, A' = A + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t15 := {
    from   := f98;
    to     := f98;
    guard  := F >= A;
    action := A' = A + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t16 := {
    from   := f104;
    to     := f107;
    guard  := H >= K;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t17 := {
    from   := f107;
    to     := f107;
    guard  := F >= A;
    action := I' = R1, A' = A + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t18 := {
    from   := f113;
    to     := f113;
    guard  := F >= A;
    action := A' = A + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t19 := {
    from   := f121;
    to     := f121;
    guard  := F >= A;
    action := A' = A + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t20 := {
    from   := f69;
    to     := f130;
    guard  := G > H;
    action := M' = C, N' = R1, O' = S1, P' = R1 + S1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t21 := {
    from   := f69;
    to     := f130;
    guard  := H >= F && G = F;
    action := F' = G, M' = C, N' = R1, O' = S1, P' = R1 + S1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t22 := {
    from   := f130;
    to     := f7;
    guard  := M > P;
    action := C' = M, G' = G + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t23 := {
    from   := f130;
    to     := f7;
    guard  := P >= M;
    action := C' = P, G' = G + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t24 := {
    from   := f136;
    to     := f141;
    guard  := F > G && 0 > E && G > 0;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t25 := {
    from   := f136;
    to     := f141;
    guard  := F > G && E > 0 && G > 0;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t26 := {
    from   := f141;
    to     := f141;
    guard  := F >= K;
    action := K' = K + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t27 := {
    from   := f147;
    to     := f150;
    guard  := F >= K;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t28 := {
    from   := f150;
    to     := f150;
    guard  := F >= A;
    action := I' = R1, A' = A + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t29 := {
    from   := f156;
    to     := f156;
    guard  := F >= A;
    action := A' = A + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t30 := {
    from   := f136;
    to     := f164;
    guard  := G > 0 && F > G && E = 0;
    action := E' = 0, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t31 := {
    from   := f164;
    to     := f164;
    guard  := F >= K;
    action := K' = K + 1, Q' = 0, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t32 := {
    from   := f136;
    to     := f136;
    guard  := G > 0 && G >= F;
    action := E' = R1, G' = G - 1, B' = G, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t33 := {
    from   := f177;
    to     := f182;
    guard  := G > 0;
    action := E' = R1, B' = G + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t34 := {
    from   := f182;
    to     := f182;
    guard  := F >= K;
    action := K' = K + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t35 := {
    from   := f190;
    to     := f193;
    guard  := F >= K;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t36 := {
    from   := f193;
    to     := f193;
    guard  := H >= A;
    action := I' = R1, A' = A + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t37 := {
    from   := f200;
    to     := f200;
    guard  := H >= A;
    action := A' = A + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t38 := {
    from   := f208;
    to     := f208;
    guard  := H >= K;
    action := K' = K + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t39 := {
    from   := f215;
    to     := f215;
    guard  := H >= K;
    action := K' = K + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t40 := {
    from   := f223;
    to     := f226;
    guard  := A > 0;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t41 := {
    from   := f226;
    to     := f230;
    guard  := 30 >= R;
    action := S' = 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t42 := {
    from   := f230;
    to     := f241;
    guard  := 0 >= B;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t43 := {
    from   := f230;
    to     := f241;
    guard  := B > 0;
    action := S' = 0, T' = B - 1, U' = C - R1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t44 := {
    from   := f230;
    to     := f238;
    guard  := 0 > R1 && B > 0;
    action := T' = B - 1, U' = R1, V' = S1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t45 := {
    from   := f230;
    to     := f238;
    guard  := R1 > 0 && B > 0;
    action := T' = B - 1, U' = R1, V' = S1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t46 := {
    from   := f238;
    to     := f241;
    guard  := true;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t47 := {
    from   := f238;
    to     := f230;
    guard  := 0 > V;
    action := B' = B - 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t48 := {
    from   := f238;
    to     := f230;
    guard  := V > 0;
    action := B' = B - 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t49 := {
    from   := f241;
    to     := f246;
    guard  := 0 > S;
    action := I' = 1, W' = 0, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t50 := {
    from   := f241;
    to     := f246;
    guard  := S > 0;
    action := I' = 1, W' = 0, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t51 := {
    from   := f246;
    to     := f260;
    guard  := 0 > T1 && A >= G;
    action := E' = R1, I' = S1, X' = U1, Y' = V1, W' = W1, Z' = T1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t52 := {
    from   := f246;
    to     := f260;
    guard  := T1 > 0 && A >= G;
    action := E' = R1, I' = S1, X' = U1, Y' = V1, W' = W1, Z' = T1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t53 := {
    from   := f260;
    to     := f260;
    guard  := H >= K;
    action := K' = K + 1, A1' = R1, B1' = S1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t54 := {
    from   := f241;
    to     := f271;
    guard  := S = 0;
    action := S' = 0, B1' = R1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t55 := {
    from   := f271;
    to     := f275;
    guard  := 0 > B1 && B = A;
    action := A' = B, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t56 := {
    from   := f275;
    to     := f275;
    guard  := F >= K;
    action := K' = K + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t57 := {
    from   := f281;
    to     := f290;
    guard  := 29 >= R;
    action := E' = R1, X' = S1, Y' = U1, T' = A - 1, A1' = V1, C1' = W1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t58 := {
    from   := f281;
    to     := f290;
    guard  := R > 30;
    action := E' = R1, X' = S1, Y' = U1, T' = A - 1, A1' = V1, C1' = W1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t59 := {
    from   := f281;
    to     := f290;
    guard  := R = 30;
    action := E' = R1, X' = S1, Y' = U1, R' = 30, T' = A - 1, A1' = V1, C1' = W1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t60 := {
    from   := f290;
    to     := f299;
    guard  := X >= 0;
    action := I' = 1, X' = R1, W' = 1, D1' = S1, E1' = S1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t61 := {
    from   := f290;
    to     := f299;
    guard  := 0 > X;
    action := I' = 1, X' = R1, W' = 1, E1' = -S1, F1' = S1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t62 := {
    from   := f299;
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
    from   := f332;
    to     := f332;
    guard  := H >= G1;
    action := A1' = R1, B1' = S1, G1' = G1 + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t65 := {
    from   := f332;
    to     := f299;
    guard  := G1 > H;
    action := K' = K + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t66 := {
    from   := f315;
    to     := f332;
    guard  := G1 > F;
    action := X' = R1, B1' = 0, C1' = S1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t67 := {
    from   := f315;
    to     := f332;
    guard  := G1 > F && 0 > T1;
    action := I' = R1, X' = S1, W' = U1, B1' = V1, C1' = W1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t68 := {
    from   := f315;
    to     := f332;
    guard  := G1 > F && T1 > 0;
    action := I' = R1, X' = S1, W' = U1, B1' = V1, C1' = W1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t69 := {
    from   := f299;
    to     := f226;
    guard  := K > T;
    action := R' = R + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t70 := {
    from   := f226;
    to     := f223;
    guard  := R > 30;
    action := A' = A - 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t71 := {
    from   := f271;
    to     := f223;
    guard  := B1 >= 0 && B = A;
    action := A' = B - 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t72 := {
    from   := f275;
    to     := f223;
    guard  := K > F;
    action := A' = A - 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t73 := {
    from   := f260;
    to     := f246;
    guard  := K > H;
    action := G' = G + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t74 := {
    from   := f246;
    to     := f271;
    guard  := G > A;
    action := B1' = R1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t75 := {
    from   := f246;
    to     := f271;
    guard  := A >= G;
    action := X' = S1, Z' = C - R1, B1' = U1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t76 := {
    from   := f223;
    to     := f1;
    guard  := 0 >= A;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t77 := {
    from   := f215;
    to     := f177;
    guard  := K > H;
    action := G' = G - 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t78 := {
    from   := f208;
    to     := f177;
    guard  := K > H;
    action := G' = G - 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t79 := {
    from   := f200;
    to     := f190;
    guard  := A > H;
    action := K' = K + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t80 := {
    from   := f193;
    to     := f200;
    guard  := A > H;
    action := X' = R1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t81 := {
    from   := f190;
    to     := f208;
    guard  := K > F;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t82 := {
    from   := f182;
    to     := f190;
    guard  := K > F && 0 > E;
    action := E' = R1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t83 := {
    from   := f182;
    to     := f190;
    guard  := K > F && E > 0;
    action := E' = R1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t84 := {
    from   := f182;
    to     := f215;
    guard  := K > F && E = 0;
    action := E' = 0, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t85 := {
    from   := f177;
    to     := f223;
    guard  := 0 >= G;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t86 := {
    from   := f164;
    to     := f136;
    guard  := K > F;
    action := E' = R1, G' = G - 1, B' = G, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t87 := {
    from   := f156;
    to     := f147;
    guard  := A > F;
    action := K' = K + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t88 := {
    from   := f150;
    to     := f156;
    guard  := A > F;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t89 := {
    from   := f147;
    to     := f164;
    guard  := K > F;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t90 := {
    from   := f141;
    to     := f147;
    guard  := K > F;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t91 := {
    from   := f136;
    to     := f177;
    guard  := 0 >= G;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t92 := {
    from   := f121;
    to     := f130;
    guard  := A > F;
    action := M' = C, N' = R1, O' = S1, P' = R1 + S1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t93 := {
    from   := f113;
    to     := f104;
    guard  := A > F;
    action := K' = K + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t94 := {
    from   := f107;
    to     := f113;
    guard  := A > F;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t95 := {
    from   := f104;
    to     := f121;
    guard  := K > H;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t96 := {
    from   := f98;
    to     := f104;
    guard  := A > F;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t97 := {
    from   := f80;
    to     := f98;
    guard  := S1 >= 0 && A > F;
    action := E' = -R1, X' = S1, Y' = U1, H1' = V1, I1' = R1, J1' = R1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t98 := {
    from   := f80;
    to     := f98;
    guard  := 0 > S1 && A > F;
    action := E' = R1, X' = S1, Y' = U1, J1' = -R1, K1' = V1, L1' = R1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t99 := {
    from   := f72;
    to     := f80;
    guard  := 0 > D && A > F;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t100 := {
    from   := f72;
    to     := f80;
    guard  := D > 0 && A > F;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t101 := {
    from   := f72;
    to     := f130;
    guard  := A > F && D = 0;
    action := D' = 0, M' = C, N' = R1, O' = S1, P' = R1 + S1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t102 := {
    from   := f60;
    to     := f69;
    guard  := A > H;
    action := D' = 0, E' = 0, I' = 0, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t103 := {
    from   := f52;
    to     := f42;
    guard  := A > H;
    action := K' = K + 1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t104 := {
    from   := f45;
    to     := f52;
    guard  := A > H;
    action := X' = R1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t105 := {
    from   := f42;
    to     := f60;
    guard  := K > F;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t106 := {
    from   := f24;
    to     := f42;
    guard  := S1 >= 0 && A > H;
    action := E' = -R1, X' = S1, M1' = U1, N1' = R1, O1' = R1, Y' = V1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t107 := {
    from   := f24;
    to     := f42;
    guard  := 0 > S1 && A > H;
    action := E' = R1, X' = S1, O1' = -R1, P1' = U1, Q1' = R1, Y' = V1, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t108 := {
    from   := f16;
    to     := f24;
    guard  := 0 > D && A > H;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t109 := {
    from   := f16;
    to     := f24;
    guard  := D > 0 && A > H;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t110 := {
    from   := f16;
    to     := f69;
    guard  := A > H && D = 0;
    action := D' = 0, E' = 0, I' = 0, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t111 := {
    from   := f7;
    to     := f136;
    guard  := G > F;
    action := R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
}
strategy dumb {
  Region init := { state = f2 };
}
