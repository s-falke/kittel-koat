model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1, N1, O1, P1, Q1, R1, S1, T1, U1, V1, W1, X1, Y1, Z1, A2, B2, C2, D2, E2, F2;
  states f67, f69, f140, f142, f144, f0, f49, f58, f77, f86, f89, f138, f102, f114, f124, f127, f152, f165, f178, f193, f202, f208, f223, f239, f247, f252, f260, f274, f294, f304, f313, f322, f332, f341, f349, f368, f353, f362, f372, f382, f391, f394, f403, f406, f419, f426, f430, f436, f443, f452, f458, f473, f486, f489, f502, f135;
  transition t0 := {
    from   := f67;
    to     := f69;
    guard  := 1871 >= A;
    action := D2' = ?, E2' = ?, F2' = ?;
  };
  transition t1 := {
    from   := f67;
    to     := f69;
    guard  := A > 1872;
    action := D2' = ?, E2' = ?, F2' = ?;
  };
  transition t2 := {
    from   := f140;
    to     := f142;
    guard  := 14 >= B;
    action := D2' = ?, E2' = ?, F2' = ?;
  };
  transition t3 := {
    from   := f140;
    to     := f142;
    guard  := B > 15;
    action := D2' = ?, E2' = ?, F2' = ?;
  };
  transition t4 := {
    from   := f142;
    to     := f144;
    guard  := 122 >= B;
    action := D2' = ?, E2' = ?, F2' = ?;
  };
  transition t5 := {
    from   := f142;
    to     := f144;
    guard  := B > 123;
    action := D2' = ?, E2' = ?, F2' = ?;
  };
  transition t6 := {
    from   := f0;
    to     := f49;
    guard  := true;
    action := C' = D2, D' = E2, E' = F2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t7 := {
    from   := f49;
    to     := f49;
    guard  := E >= 0;
    action := E' = E - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t8 := {
    from   := f58;
    to     := f58;
    guard  := F >= 0;
    action := F' = F - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t9 := {
    from   := f77;
    to     := f77;
    guard  := G >= 0;
    action := G' = G - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t10 := {
    from   := f86;
    to     := f89;
    guard  := H > 0;
    action := I' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t11 := {
    from   := f89;
    to     := f89;
    guard  := I >= 0;
    action := I' = I - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t12 := {
    from   := f86;
    to     := f138;
    guard  := 0 >= H;
    action := D2' = ?, E2' = ?, F2' = ?;
  };
  transition t13 := {
    from   := f102;
    to     := f102;
    guard  := J >= 0;
    action := J' = J - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t14 := {
    from   := f114;
    to     := f114;
    guard  := K >= 0;
    action := K' = K - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t15 := {
    from   := f69;
    to     := f124;
    guard  := A = 12;
    action := A' = 12, L' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t16 := {
    from   := f124;
    to     := f127;
    guard  := H > 0;
    action := M' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t17 := {
    from   := f127;
    to     := f127;
    guard  := M >= 0;
    action := M' = M - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t18 := {
    from   := f124;
    to     := f138;
    guard  := 0 >= H;
    action := D2' = ?, E2' = ?, F2' = ?;
  };
  transition t19 := {
    from   := f138;
    to     := f140;
    guard  := 11 >= B;
    action := D2' = ?, E2' = ?, F2' = ?;
  };
  transition t20 := {
    from   := f138;
    to     := f140;
    guard  := B > 12;
    action := D2' = ?, E2' = ?, F2' = ?;
  };
  transition t21 := {
    from   := f152;
    to     := f152;
    guard  := N >= 0;
    action := O' = D2, N' = N - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t22 := {
    from   := f165;
    to     := f165;
    guard  := P >= 0;
    action := Q' = D2, P' = P - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t23 := {
    from   := f178;
    to     := f178;
    guard  := R >= 0;
    action := S' = D2, R' = R - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t24 := {
    from   := f193;
    to     := f193;
    guard  := T >= 0;
    action := T' = T - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t25 := {
    from   := f202;
    to     := f202;
    guard  := U >= 0;
    action := U' = U - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t26 := {
    from   := f208;
    to     := f208;
    guard  := U >= 0;
    action := U' = U - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t27 := {
    from   := f223;
    to     := f223;
    guard  := V >= 0;
    action := W' = D2, V' = V - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t28 := {
    from   := f239;
    to     := f239;
    guard  := X >= 0;
    action := X' = X - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t29 := {
    from   := f247;
    to     := f252;
    guard  := Y > 7;
    action := Z' = D2, A1' = E2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t30 := {
    from   := f252;
    to     := f252;
    guard  := A1 >= 0;
    action := A1' = A1 - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t31 := {
    from   := f260;
    to     := f260;
    guard  := B1 > 7;
    action := B1' = B1 - 1, C1' = D2, D1' = E2, E1' = F2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t32 := {
    from   := f274;
    to     := f274;
    guard  := F1 >= 0;
    action := G1' = D2, F1' = F1 - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t33 := {
    from   := f294;
    to     := f294;
    guard  := H1 >= 0;
    action := H1' = H1 - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t34 := {
    from   := f304;
    to     := f304;
    guard  := I1 >= 0;
    action := I1' = I1 - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t35 := {
    from   := f313;
    to     := f313;
    guard  := 15 >= J1;
    action := K1' = D2, J1' = J1 + 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t36 := {
    from   := f322;
    to     := f322;
    guard  := 15 >= L1;
    action := K1' = K1 - 1, M1' = D2, L1' = L1 + 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t37 := {
    from   := f332;
    to     := f332;
    guard  := 15 >= J1;
    action := J1' = J1 + 1, N1' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t38 := {
    from   := f341;
    to     := f349;
    guard  := L1 > 15;
    action := D2' = ?, E2' = ?, F2' = ?;
  };
  transition t39 := {
    from   := f341;
    to     := f341;
    guard  := 15 >= L1;
    action := M1' = D2, L1' = L1 + 1, N1' = N1 - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t40 := {
    from   := f341;
    to     := f349;
    guard  := 15 >= L1;
    action := D2' = ?, E2' = ?, F2' = ?;
  };
  transition t41 := {
    from   := f349;
    to     := f368;
    guard  := 0 > N1;
    action := D2' = ?, E2' = ?, F2' = ?;
  };
  transition t42 := {
    from   := f349;
    to     := f368;
    guard  := N1 > 0;
    action := D2' = ?, E2' = ?, F2' = ?;
  };
  transition t43 := {
    from   := f349;
    to     := f353;
    guard  := N1 = 0;
    action := N1' = 0, O1' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t44 := {
    from   := f353;
    to     := f353;
    guard  := O1 >= 0;
    action := O1' = O1 - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t45 := {
    from   := f362;
    to     := f362;
    guard  := P1 >= 0;
    action := P1' = P1 - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t46 := {
    from   := f368;
    to     := f372;
    guard  := true;
    action := Q1' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t47 := {
    from   := f372;
    to     := f372;
    guard  := Q1 >= 0;
    action := Q1' = Q1 - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t48 := {
    from   := f382;
    to     := f382;
    guard  := R1 >= 0;
    action := R1' = R1 - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t49 := {
    from   := f368;
    to     := f391;
    guard  := true;
    action := J1' = K1 - N1, S1' = K1 - N1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t50 := {
    from   := f391;
    to     := f394;
    guard  := J1 > 16;
    action := L1' = 0, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t51 := {
    from   := f394;
    to     := f394;
    guard  := 14 >= L1;
    action := L1' = L1 + 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t52 := {
    from   := f403;
    to     := f406;
    guard  := J1 > 0;
    action := L1' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t53 := {
    from   := f406;
    to     := f406;
    guard  := L1 >= 0;
    action := M1' = 1, L1' = L1 - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t54 := {
    from   := f406;
    to     := f406;
    guard  := L1 >= 0;
    action := M1' = 0, L1' = L1 - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t55 := {
    from   := f419;
    to     := f419;
    guard  := T1 >= 0;
    action := T1' = T1 - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t56 := {
    from   := f426;
    to     := f430;
    guard  := S1 >= 0;
    action := J1' = D2, L1' = E2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t57 := {
    from   := f430;
    to     := f430;
    guard  := 14 >= J1;
    action := J1' = J1 + 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t58 := {
    from   := f430;
    to     := f436;
    guard  := J1 > 14;
    action := D2' = ?, E2' = ?, F2' = ?;
  };
  transition t59 := {
    from   := f430;
    to     := f436;
    guard  := D2 > E2;
    action := D2' = ?, E2' = ?, F2' = ?;
  };
  transition t60 := {
    from   := f430;
    to     := f436;
    guard  := true;
    action := D2' = ?, E2' = ?, F2' = ?;
  };
  transition t61 := {
    from   := f436;
    to     := f443;
    guard  := true;
    action := U1' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t62 := {
    from   := f443;
    to     := f443;
    guard  := U1 >= 0;
    action := U1' = U1 - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t63 := {
    from   := f452;
    to     := f452;
    guard  := V1 >= 0;
    action := V1' = V1 - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t64 := {
    from   := f458;
    to     := f458;
    guard  := V1 >= 0;
    action := V1' = V1 - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t65 := {
    from   := f473;
    to     := f473;
    guard  := W1 >= 0;
    action := X1' = D2, W1' = W1 - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t66 := {
    from   := f436;
    to     := f486;
    guard  := E2 > F2;
    action := L1' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t67 := {
    from   := f486;
    to     := f489;
    guard  := 0 > L1 && L1 >= 0;
    action := D2' = ?, E2' = ?, F2' = ?;
  };
  transition t68 := {
    from   := f486;
    to     := f489;
    guard  := L1 > 0;
    action := D2' = ?, E2' = ?, F2' = ?;
  };
  transition t69 := {
    from   := f489;
    to     := f486;
    guard  := true;
    action := M1' = D2, L1' = L1 - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t70 := {
    from   := f489;
    to     := f486;
    guard  := true;
    action := M1' = 0, L1' = L1 - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t71 := {
    from   := f486;
    to     := f486;
    guard  := L1 = 0;
    action := M1' = 0, L1' = -1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t72 := {
    from   := f502;
    to     := f502;
    guard  := Y1 >= 0;
    action := Y1' = Y1 - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t73 := {
    from   := f144;
    to     := f135;
    guard  := 19845 >= B;
    action := D2' = ?, E2' = ?, F2' = ?;
  };
  transition t74 := {
    from   := f144;
    to     := f135;
    guard  := B > 19846;
    action := D2' = ?, E2' = ?, F2' = ?;
  };
  transition t75 := {
    from   := f502;
    to     := f135;
    guard  := 0 > Y1;
    action := D2' = ?, E2' = ?, F2' = ?;
  };
  transition t76 := {
    from   := f486;
    to     := f426;
    guard  := 0 > L1;
    action := K1' = K1 - 1, S1' = S1 - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t77 := {
    from   := f473;
    to     := f486;
    guard  := 0 > W1;
    action := M1' = D2, L1' = E2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t78 := {
    from   := f458;
    to     := f473;
    guard  := 0 > V1;
    action := X1' = 0, W1' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t79 := {
    from   := f458;
    to     := f473;
    guard  := V1 >= 0;
    action := X1' = 0, W1' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t80 := {
    from   := f452;
    to     := f458;
    guard  := 0 > V1;
    action := V1' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t81 := {
    from   := f443;
    to     := f452;
    guard  := 0 > U1;
    action := V1' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t82 := {
    from   := f426;
    to     := f502;
    guard  := 0 > S1;
    action := Y1' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t83 := {
    from   := f419;
    to     := f426;
    guard  := 0 > T1;
    action := D2' = ?, E2' = ?, F2' = ?;
  };
  transition t84 := {
    from   := f406;
    to     := f403;
    guard  := 0 > L1;
    action := J1' = J1 - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t85 := {
    from   := f403;
    to     := f419;
    guard  := 0 >= J1;
    action := T1' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t86 := {
    from   := f394;
    to     := f391;
    guard  := L1 > 14;
    action := J1' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t87 := {
    from   := f391;
    to     := f403;
    guard  := 16 >= J1;
    action := M1' = 0, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t88 := {
    from   := f382;
    to     := f391;
    guard  := 0 > R1;
    action := J1' = K1 - N1, S1' = K1 - N1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t89 := {
    from   := f372;
    to     := f382;
    guard  := 0 > Q1;
    action := R1' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t90 := {
    from   := f362;
    to     := f368;
    guard  := 0 > P1;
    action := D2' = ?, E2' = ?, F2' = ?;
  };
  transition t91 := {
    from   := f353;
    to     := f362;
    guard  := 0 > O1;
    action := P1' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t92 := {
    from   := f332;
    to     := f341;
    guard  := J1 > 15;
    action := M1' = D2, L1' = 0, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t93 := {
    from   := f332;
    to     := f341;
    guard  := 15 >= J1 && 0 > E2;
    action := M1' = D2, L1' = 0, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t94 := {
    from   := f332;
    to     := f341;
    guard  := 15 >= J1;
    action := M1' = D2, L1' = 0, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t95 := {
    from   := f322;
    to     := f332;
    guard  := L1 > 15;
    action := J1' = 0, N1' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t96 := {
    from   := f322;
    to     := f332;
    guard  := 15 >= L1;
    action := J1' = 0, N1' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t97 := {
    from   := f313;
    to     := f322;
    guard  := J1 > 15;
    action := M1' = D2, L1' = 0, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t98 := {
    from   := f313;
    to     := f322;
    guard  := 15 >= J1 && 0 > E2;
    action := M1' = D2, L1' = 0, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t99 := {
    from   := f313;
    to     := f322;
    guard  := 15 >= J1;
    action := M1' = D2, L1' = 0, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t100 := {
    from   := f304;
    to     := f313;
    guard  := 0 > I1;
    action := K1' = D2, J1' = 0, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t101 := {
    from   := f294;
    to     := f304;
    guard  := 0 > H1;
    action := I1' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t102 := {
    from   := f274;
    to     := f247;
    guard  := 0 > F1;
    action := Y' = Y - 1, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t103 := {
    from   := f260;
    to     := f274;
    guard  := 7 >= B1;
    action := G1' = 0, F1' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t104 := {
    from   := f252;
    to     := f260;
    guard  := 0 > A1;
    action := B1' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t105 := {
    from   := f247;
    to     := f135;
    guard  := 7 >= Y;
    action := D2' = ?, E2' = ?, F2' = ?;
  };
  transition t106 := {
    from   := f239;
    to     := f247;
    guard  := 0 > X;
    action := Y' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t107 := {
    from   := f223;
    to     := f135;
    guard  := 0 > V;
    action := D2' = ?, E2' = ?, F2' = ?;
  };
  transition t108 := {
    from   := f208;
    to     := f223;
    guard  := 0 > U;
    action := W' = 0, V' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t109 := {
    from   := f208;
    to     := f223;
    guard  := U >= 0;
    action := W' = 0, V' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t110 := {
    from   := f202;
    to     := f208;
    guard  := 0 > U;
    action := U' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t111 := {
    from   := f193;
    to     := f202;
    guard  := 0 > T;
    action := U' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t112 := {
    from   := f178;
    to     := f135;
    guard  := 0 > R;
    action := D2' = ?, E2' = ?, F2' = ?;
  };
  transition t113 := {
    from   := f165;
    to     := f178;
    guard  := 0 > P;
    action := S' = 0, R' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t114 := {
    from   := f152;
    to     := f165;
    guard  := 0 > N;
    action := Q' = 0, P' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t115 := {
    from   := f144;
    to     := f294;
    guard  := B = 19846;
    action := B' = 19846, H1' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t116 := {
    from   := f142;
    to     := f239;
    guard  := B = 123;
    action := B' = 123, X' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t117 := {
    from   := f140;
    to     := f193;
    guard  := B = 15;
    action := B' = 15, T' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t118 := {
    from   := f138;
    to     := f152;
    guard  := B = 12;
    action := B' = 12, O' = 0, N' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t119 := {
    from   := f127;
    to     := f138;
    guard  := 0 > M;
    action := D2' = ?, E2' = ?, F2' = ?;
  };
  transition t120 := {
    from   := f114;
    to     := f124;
    guard  := 0 > K;
    action := L' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t121 := {
    from   := f102;
    to     := f114;
    guard  := 0 > J;
    action := Z1' = D2, K' = E2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t122 := {
    from   := f89;
    to     := f138;
    guard  := 0 > I;
    action := D2' = ?, E2' = ?, F2' = ?;
  };
  transition t123 := {
    from   := f77;
    to     := f86;
    guard  := 0 > G;
    action := A2' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t124 := {
    from   := f69;
    to     := f135;
    guard  := 11 >= A;
    action := D2' = ?, E2' = ?, F2' = ?;
  };
  transition t125 := {
    from   := f69;
    to     := f135;
    guard  := A > 12;
    action := D2' = ?, E2' = ?, F2' = ?;
  };
  transition t126 := {
    from   := f67;
    to     := f102;
    guard  := H > 0 && A = 1872;
    action := A' = 1872, B2' = D2, J' = E2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t127 := {
    from   := f67;
    to     := f114;
    guard  := 0 >= H && A = 1872;
    action := A' = 1872, B2' = D2, Z1' = E2, K' = F2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t128 := {
    from   := f58;
    to     := f67;
    guard  := 0 > F && 1131 >= A;
    action := D2' = ?, E2' = ?, F2' = ?;
  };
  transition t129 := {
    from   := f58;
    to     := f67;
    guard  := 0 > F && A > 1132;
    action := D2' = ?, E2' = ?, F2' = ?;
  };
  transition t130 := {
    from   := f58;
    to     := f77;
    guard  := 0 > F && H > 0 && A = 1132;
    action := A' = 1132, C2' = D2, G' = E2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t131 := {
    from   := f58;
    to     := f86;
    guard  := 0 > F && 0 >= H && A = 1132;
    action := A' = 1132, C2' = D2, A2' = E2, D2' = ?, E2' = ?, F2' = ?;
  };
  transition t132 := {
    from   := f49;
    to     := f58;
    guard  := 0 > E;
    action := F' = D2, D2' = ?, E2' = ?, F2' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
