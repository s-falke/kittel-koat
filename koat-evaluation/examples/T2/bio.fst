model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1, N1, O1, P1, Q1, R1, S1, T1, U1, V1, W1, X1, Y1, Z1, A2, B2, C2, D2, E2, F2, G2, H2, I2, J2, K2, L2, M2, N2, O2, P2, Q2, R2, S2, T2, U2, V2, W2, X2, Y2, Z2, A3, B3, C3, D3, E3, F3, G3, H3, I3, J3, K3, L3, M3, N3, O3, P3, Q3, R3, S3, T3, U3, V3, W3, X3, Y3, Z3, A4, B4, C4, D4, E4, F4, G4, H4, I4, J4, K4, L4, M4, N4, O4, P4;
  states f0, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15, f16, f17, f18, f19, f20, f21, f22, f23, f24, f25, f26, f27, f28, f29, f30, f31, f32, f33, f34, f35, f36, f37, f38, f39, f40, f41, f42, f43, f44, f45, f46, f47, f48, f49, f50, f51, f52, f53, f54, f55, f56, f57, f58, f59, f60;
  transition t0 := {
    from   := f0;
    to     := f1;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := f1;
    to     := f2;
    guard  := A > B;
    action := C' = B + 1;
  };
  transition t2 := {
    from   := f1;
    to     := f2;
    guard  := B > A;
    action := C' = B - 1;
  };
  transition t3 := {
    from   := f1;
    to     := f2;
    guard  := B = A;
    action := C' = B, A' = B;
  };
  transition t4 := {
    from   := f2;
    to     := f3;
    guard  := B > D;
    action := E' = D + 1;
  };
  transition t5 := {
    from   := f2;
    to     := f3;
    guard  := D > B;
    action := E' = D - 1;
  };
  transition t6 := {
    from   := f2;
    to     := f3;
    guard  := B = D;
    action := E' = B, D' = B;
  };
  transition t7 := {
    from   := f3;
    to     := f4;
    guard  := 2 >= D + F;
    action := G' = F + 1;
  };
  transition t8 := {
    from   := f3;
    to     := f4;
    guard  := F + D > 3;
    action := G' = F - 1;
  };
  transition t9 := {
    from   := f3;
    to     := f4;
    guard  := F + D = 3;
    action := G' = 3 - D, F' = 3 - D;
  };
  transition t10 := {
    from   := f4;
    to     := f5;
    guard  := 2 >= F + H;
    action := I' = H + 1;
  };
  transition t11 := {
    from   := f4;
    to     := f5;
    guard  := H + F > 3;
    action := I' = H - 1;
  };
  transition t12 := {
    from   := f4;
    to     := f5;
    guard  := H + F = 3;
    action := I' = 3 - F, H' = 3 - F;
  };
  transition t13 := {
    from   := f5;
    to     := f6;
    guard  := H > J;
    action := K' = J + 1;
  };
  transition t14 := {
    from   := f5;
    to     := f6;
    guard  := J > H;
    action := K' = J - 1;
  };
  transition t15 := {
    from   := f5;
    to     := f6;
    guard  := H = J;
    action := K' = H, J' = H;
  };
  transition t16 := {
    from   := f6;
    to     := f7;
    guard  := 0 > L && M > L;
    action := N' = L + 1;
  };
  transition t17 := {
    from   := f6;
    to     := f7;
    guard  := L > 0;
    action := N' = L - 1;
  };
  transition t18 := {
    from   := f6;
    to     := f7;
    guard  := L > M;
    action := N' = L - 1;
  };
  transition t19 := {
    from   := f6;
    to     := f7;
    guard  := M >= 0 && L = 0;
    action := N' = 0, L' = 0;
  };
  transition t20 := {
    from   := f6;
    to     := f7;
    guard  := 0 > M && L = M;
    action := N' = L, M' = L;
  };
  transition t21 := {
    from   := f7;
    to     := f8;
    guard  := L > O;
    action := P' = O + 1;
  };
  transition t22 := {
    from   := f7;
    to     := f8;
    guard  := O > L;
    action := P' = O - 1;
  };
  transition t23 := {
    from   := f7;
    to     := f8;
    guard  := L = O;
    action := P' = L, O' = L;
  };
  transition t24 := {
    from   := f8;
    to     := f9;
    guard  := J + O > 2*Q;
    action := R' = Q + 1;
  };
  transition t25 := {
    from   := f8;
    to     := f9;
    guard  := 2*Q > 1 + J + O;
    action := R' = Q - 1;
  };
  transition t26 := {
    from   := f8;
    to     := f9;
    guard  := 2*Q >= J + O && J + O + 1 >= 2*Q;
    action := R' = Q;
  };
  transition t27 := {
    from   := f9;
    to     := f10;
    guard  := L > S;
    action := T' = S + 1;
  };
  transition t28 := {
    from   := f9;
    to     := f10;
    guard  := S > L;
    action := T' = S - 1;
  };
  transition t29 := {
    from   := f9;
    to     := f10;
    guard  := L = S;
    action := T' = L, S' = L;
  };
  transition t30 := {
    from   := f10;
    to     := f11;
    guard  := 2 >= S + U;
    action := V' = U + 1;
  };
  transition t31 := {
    from   := f10;
    to     := f11;
    guard  := U + S > 3;
    action := V' = U - 1;
  };
  transition t32 := {
    from   := f10;
    to     := f11;
    guard  := U + S = 3;
    action := V' = 3 - S, U' = 3 - S;
  };
  transition t33 := {
    from   := f11;
    to     := f12;
    guard  := 1 + W >= 2*A;
    action := X' = A + 1;
  };
  transition t34 := {
    from   := f11;
    to     := f12;
    guard  := 2*A > 3 + W;
    action := X' = A - 1;
  };
  transition t35 := {
    from   := f11;
    to     := f12;
    guard  := 2*A > 1 + W && 3 + W >= 2*A;
    action := X' = A;
  };
  transition t36 := {
    from   := f12;
    to     := f13;
    guard  := 1 + Y >= 2*M;
    action := Z' = M + 1;
  };
  transition t37 := {
    from   := f12;
    to     := f13;
    guard  := 2*M > 3 + Y;
    action := Z' = M - 1;
  };
  transition t38 := {
    from   := f12;
    to     := f13;
    guard  := 3 + Y >= 2*M && 2*M > 1 + Y;
    action := Z' = M;
  };
  transition t39 := {
    from   := f13;
    to     := f14;
    guard  := A1 > B1;
    action := C1' = B1 + 1;
  };
  transition t40 := {
    from   := f13;
    to     := f14;
    guard  := B1 > A1;
    action := C1' = B1 - 1;
  };
  transition t41 := {
    from   := f13;
    to     := f14;
    guard  := B1 = A1;
    action := C1' = B1, A1' = B1;
  };
  transition t42 := {
    from   := f14;
    to     := f15;
    guard  := B1 > D1;
    action := E1' = D1 + 1;
  };
  transition t43 := {
    from   := f14;
    to     := f15;
    guard  := D1 > B1;
    action := E1' = D1 - 1;
  };
  transition t44 := {
    from   := f14;
    to     := f15;
    guard  := B1 = D1;
    action := E1' = B1, D1' = B1;
  };
  transition t45 := {
    from   := f15;
    to     := f16;
    guard  := 2 >= D1 + F1;
    action := G1' = F1 + 1;
  };
  transition t46 := {
    from   := f15;
    to     := f16;
    guard  := F1 + D1 > 3;
    action := G1' = F1 - 1;
  };
  transition t47 := {
    from   := f15;
    to     := f16;
    guard  := F1 + D1 = 3;
    action := G1' = 3 - D1, F1' = 3 - D1;
  };
  transition t48 := {
    from   := f16;
    to     := f17;
    guard  := 2 >= F1 + H1;
    action := I1' = H1 + 1;
  };
  transition t49 := {
    from   := f16;
    to     := f17;
    guard  := H1 + F1 > 3;
    action := I1' = H1 - 1;
  };
  transition t50 := {
    from   := f16;
    to     := f17;
    guard  := H1 + F1 = 3;
    action := I1' = 3 - F1, H1' = 3 - F1;
  };
  transition t51 := {
    from   := f17;
    to     := f18;
    guard  := H1 > J1;
    action := K1' = J1 + 1;
  };
  transition t52 := {
    from   := f17;
    to     := f18;
    guard  := J1 > H1;
    action := K1' = J1 - 1;
  };
  transition t53 := {
    from   := f17;
    to     := f18;
    guard  := H1 = J1;
    action := K1' = H1, J1' = H1;
  };
  transition t54 := {
    from   := f18;
    to     := f19;
    guard  := 1 >= L1 && M1 > L1;
    action := N1' = L1 + 1;
  };
  transition t55 := {
    from   := f18;
    to     := f19;
    guard  := L1 > 2;
    action := N1' = L1 - 1;
  };
  transition t56 := {
    from   := f18;
    to     := f19;
    guard  := L1 > M1;
    action := N1' = L1 - 1;
  };
  transition t57 := {
    from   := f18;
    to     := f19;
    guard  := M1 > 1 && L1 = 2;
    action := N1' = 2, L1' = 2;
  };
  transition t58 := {
    from   := f18;
    to     := f19;
    guard  := 1 >= M1 && L1 = M1;
    action := N1' = L1, M1' = L1;
  };
  transition t59 := {
    from   := f19;
    to     := f20;
    guard  := L1 > O1;
    action := P1' = O1 + 1;
  };
  transition t60 := {
    from   := f19;
    to     := f20;
    guard  := O1 > L1;
    action := P1' = O1 - 1;
  };
  transition t61 := {
    from   := f19;
    to     := f20;
    guard  := L1 = O1;
    action := P1' = L1, O1' = L1;
  };
  transition t62 := {
    from   := f20;
    to     := f21;
    guard  := J1 + O1 > 2*Y;
    action := Q1' = Y + 1;
  };
  transition t63 := {
    from   := f20;
    to     := f21;
    guard  := 2*Y > 1 + J1 + O1;
    action := Q1' = Y - 1;
  };
  transition t64 := {
    from   := f20;
    to     := f21;
    guard  := 2*Y >= J1 + O1 && J1 + O1 + 1 >= 2*Y;
    action := Q1' = Y;
  };
  transition t65 := {
    from   := f21;
    to     := f22;
    guard  := L1 > R1;
    action := S1' = R1 + 1;
  };
  transition t66 := {
    from   := f21;
    to     := f22;
    guard  := R1 > L1;
    action := S1' = R1 - 1;
  };
  transition t67 := {
    from   := f21;
    to     := f22;
    guard  := L1 = R1;
    action := S1' = L1, R1' = L1;
  };
  transition t68 := {
    from   := f22;
    to     := f23;
    guard  := 2 >= R1 + W;
    action := T1' = W + 1;
  };
  transition t69 := {
    from   := f22;
    to     := f23;
    guard  := W + R1 > 3;
    action := T1' = W - 1;
  };
  transition t70 := {
    from   := f22;
    to     := f23;
    guard  := W + R1 = 3;
    action := W' = 3 - R1, T1' = 3 - R1;
  };
  transition t71 := {
    from   := f23;
    to     := f24;
    guard  := U + U1 > 2*A1 + 1;
    action := V1' = A1 + 1;
  };
  transition t72 := {
    from   := f23;
    to     := f24;
    guard  := 2*A1 > U + U1;
    action := V1' = A1 - 1;
  };
  transition t73 := {
    from   := f23;
    to     := f24;
    guard  := 2*A1 + 1 >= U + U1 && U + U1 >= 2*A1;
    action := V1' = A1;
  };
  transition t74 := {
    from   := f24;
    to     := f25;
    guard  := Q + W1 > 2*M1;
    action := X1' = M1 + 1;
  };
  transition t75 := {
    from   := f24;
    to     := f25;
    guard  := 2*M1 > 1 + Q + W1;
    action := X1' = M1 - 1;
  };
  transition t76 := {
    from   := f24;
    to     := f25;
    guard  := Q + W1 + 1 >= 2*M1 && 2*M1 >= Q + W1;
    action := X1' = M1;
  };
  transition t77 := {
    from   := f25;
    to     := f26;
    guard  := Y1 > Z1;
    action := A2' = Z1 + 1;
  };
  transition t78 := {
    from   := f25;
    to     := f26;
    guard  := Z1 > Y1;
    action := A2' = Z1 - 1;
  };
  transition t79 := {
    from   := f25;
    to     := f26;
    guard  := Z1 = Y1;
    action := A2' = Z1, Y1' = Z1;
  };
  transition t80 := {
    from   := f26;
    to     := f27;
    guard  := Z1 > B2;
    action := C2' = B2 + 1;
  };
  transition t81 := {
    from   := f26;
    to     := f27;
    guard  := B2 > Z1;
    action := C2' = B2 - 1;
  };
  transition t82 := {
    from   := f26;
    to     := f27;
    guard  := Z1 = B2;
    action := C2' = Z1, B2' = Z1;
  };
  transition t83 := {
    from   := f27;
    to     := f28;
    guard  := 2 >= B2 + D2;
    action := E2' = D2 + 1;
  };
  transition t84 := {
    from   := f27;
    to     := f28;
    guard  := D2 + B2 > 3;
    action := E2' = D2 - 1;
  };
  transition t85 := {
    from   := f27;
    to     := f28;
    guard  := D2 + B2 = 3;
    action := E2' = 3 - B2, D2' = 3 - B2;
  };
  transition t86 := {
    from   := f28;
    to     := f29;
    guard  := 2 >= D2 + F2;
    action := G2' = F2 + 1;
  };
  transition t87 := {
    from   := f28;
    to     := f29;
    guard  := F2 + D2 > 3;
    action := G2' = F2 - 1;
  };
  transition t88 := {
    from   := f28;
    to     := f29;
    guard  := F2 + D2 = 3;
    action := G2' = 3 - D2, F2' = 3 - D2;
  };
  transition t89 := {
    from   := f29;
    to     := f30;
    guard  := F2 > H2;
    action := I2' = H2 + 1;
  };
  transition t90 := {
    from   := f29;
    to     := f30;
    guard  := H2 > F2;
    action := I2' = H2 - 1;
  };
  transition t91 := {
    from   := f29;
    to     := f30;
    guard  := F2 = H2;
    action := I2' = F2, H2' = F2;
  };
  transition t92 := {
    from   := f30;
    to     := f31;
    guard  := 2 >= J2 && K2 > J2;
    action := L2' = J2 + 1;
  };
  transition t93 := {
    from   := f30;
    to     := f31;
    guard  := J2 > 3;
    action := L2' = J2 - 1;
  };
  transition t94 := {
    from   := f30;
    to     := f31;
    guard  := J2 > K2;
    action := L2' = J2 - 1;
  };
  transition t95 := {
    from   := f30;
    to     := f31;
    guard  := K2 > 2 && J2 = 3;
    action := L2' = 3, J2' = 3;
  };
  transition t96 := {
    from   := f30;
    to     := f31;
    guard  := 2 >= K2 && J2 = K2;
    action := L2' = J2, K2' = J2;
  };
  transition t97 := {
    from   := f31;
    to     := f32;
    guard  := J2 > M2;
    action := N2' = M2 + 1;
  };
  transition t98 := {
    from   := f31;
    to     := f32;
    guard  := M2 > J2;
    action := N2' = M2 - 1;
  };
  transition t99 := {
    from   := f31;
    to     := f32;
    guard  := J2 = M2;
    action := N2' = J2, M2' = J2;
  };
  transition t100 := {
    from   := f32;
    to     := f33;
    guard  := H2 + M2 > 2*W1;
    action := O2' = W1 + 1;
  };
  transition t101 := {
    from   := f32;
    to     := f33;
    guard  := 2*W1 > 1 + H2 + M2;
    action := O2' = W1 - 1;
  };
  transition t102 := {
    from   := f32;
    to     := f33;
    guard  := 2*W1 >= H2 + M2 && H2 + M2 + 1 >= 2*W1;
    action := O2' = W1;
  };
  transition t103 := {
    from   := f33;
    to     := f34;
    guard  := J2 > P2;
    action := Q2' = P2 + 1;
  };
  transition t104 := {
    from   := f33;
    to     := f34;
    guard  := P2 > J2;
    action := Q2' = P2 - 1;
  };
  transition t105 := {
    from   := f33;
    to     := f34;
    guard  := J2 = P2;
    action := Q2' = J2, P2' = J2;
  };
  transition t106 := {
    from   := f34;
    to     := f35;
    guard  := 2 >= P2 + U1;
    action := R2' = U1 + 1;
  };
  transition t107 := {
    from   := f34;
    to     := f35;
    guard  := U1 + P2 > 3;
    action := R2' = U1 - 1;
  };
  transition t108 := {
    from   := f34;
    to     := f35;
    guard  := U1 + P2 = 3;
    action := U1' = 3 - P2, R2' = 3 - P2;
  };
  transition t109 := {
    from   := f35;
    to     := f36;
    guard  := W + S2 > 2*Y1 + 1;
    action := T2' = Y1 + 1;
  };
  transition t110 := {
    from   := f35;
    to     := f36;
    guard  := 2*Y1 > W + S2;
    action := T2' = Y1 - 1;
  };
  transition t111 := {
    from   := f35;
    to     := f36;
    guard  := 2*Y1 + 1 >= W + S2 && W + S2 >= 2*Y1;
    action := T2' = Y1;
  };
  transition t112 := {
    from   := f36;
    to     := f37;
    guard  := Y + U2 > 2*K2;
    action := V2' = K2 + 1;
  };
  transition t113 := {
    from   := f36;
    to     := f37;
    guard  := 2*K2 > 1 + Y + U2;
    action := V2' = K2 - 1;
  };
  transition t114 := {
    from   := f36;
    to     := f37;
    guard  := Y + U2 + 1 >= 2*K2 && 2*K2 >= Y + U2;
    action := V2' = K2;
  };
  transition t115 := {
    from   := f37;
    to     := f38;
    guard  := W2 > X2;
    action := Y2' = X2 + 1;
  };
  transition t116 := {
    from   := f37;
    to     := f38;
    guard  := X2 > W2;
    action := Y2' = X2 - 1;
  };
  transition t117 := {
    from   := f37;
    to     := f38;
    guard  := X2 = W2;
    action := Y2' = X2, W2' = X2;
  };
  transition t118 := {
    from   := f38;
    to     := f39;
    guard  := X2 > Z2;
    action := A3' = Z2 + 1;
  };
  transition t119 := {
    from   := f38;
    to     := f39;
    guard  := Z2 > X2;
    action := A3' = Z2 - 1;
  };
  transition t120 := {
    from   := f38;
    to     := f39;
    guard  := X2 = Z2;
    action := A3' = X2, Z2' = X2;
  };
  transition t121 := {
    from   := f39;
    to     := f40;
    guard  := 2 >= Z2 + B3;
    action := C3' = B3 + 1;
  };
  transition t122 := {
    from   := f39;
    to     := f40;
    guard  := B3 + Z2 > 3;
    action := C3' = B3 - 1;
  };
  transition t123 := {
    from   := f39;
    to     := f40;
    guard  := B3 + Z2 = 3;
    action := C3' = 3 - Z2, B3' = 3 - Z2;
  };
  transition t124 := {
    from   := f40;
    to     := f41;
    guard  := 2 >= B3 + D3;
    action := E3' = D3 + 1;
  };
  transition t125 := {
    from   := f40;
    to     := f41;
    guard  := D3 + B3 > 3;
    action := E3' = D3 - 1;
  };
  transition t126 := {
    from   := f40;
    to     := f41;
    guard  := D3 + B3 = 3;
    action := E3' = 3 - B3, D3' = 3 - B3;
  };
  transition t127 := {
    from   := f41;
    to     := f42;
    guard  := D3 > F3;
    action := G3' = F3 + 1;
  };
  transition t128 := {
    from   := f41;
    to     := f42;
    guard  := F3 > D3;
    action := G3' = F3 - 1;
  };
  transition t129 := {
    from   := f41;
    to     := f42;
    guard  := D3 = F3;
    action := G3' = D3, F3' = D3;
  };
  transition t130 := {
    from   := f42;
    to     := f43;
    guard  := 2 >= H3 && I3 > H3;
    action := J3' = H3 + 1;
  };
  transition t131 := {
    from   := f42;
    to     := f43;
    guard  := H3 > 3;
    action := J3' = H3 - 1;
  };
  transition t132 := {
    from   := f42;
    to     := f43;
    guard  := H3 > I3;
    action := J3' = H3 - 1;
  };
  transition t133 := {
    from   := f42;
    to     := f43;
    guard  := I3 > 2 && H3 = 3;
    action := J3' = 3, H3' = 3;
  };
  transition t134 := {
    from   := f42;
    to     := f43;
    guard  := 2 >= I3 && H3 = I3;
    action := J3' = H3, I3' = H3;
  };
  transition t135 := {
    from   := f43;
    to     := f44;
    guard  := H3 > K3;
    action := L3' = K3 + 1;
  };
  transition t136 := {
    from   := f43;
    to     := f44;
    guard  := K3 > H3;
    action := L3' = K3 - 1;
  };
  transition t137 := {
    from   := f43;
    to     := f44;
    guard  := H3 = K3;
    action := L3' = H3, K3' = H3;
  };
  transition t138 := {
    from   := f44;
    to     := f45;
    guard  := F3 + K3 > 2*U2;
    action := M3' = U2 + 1;
  };
  transition t139 := {
    from   := f44;
    to     := f45;
    guard  := 2*U2 > 1 + F3 + K3;
    action := M3' = U2 - 1;
  };
  transition t140 := {
    from   := f44;
    to     := f45;
    guard  := 2*U2 >= F3 + K3 && F3 + K3 + 1 >= 2*U2;
    action := M3' = U2;
  };
  transition t141 := {
    from   := f45;
    to     := f46;
    guard  := H3 > N3;
    action := O3' = N3 + 1;
  };
  transition t142 := {
    from   := f45;
    to     := f46;
    guard  := N3 > H3;
    action := O3' = N3 - 1;
  };
  transition t143 := {
    from   := f45;
    to     := f46;
    guard  := H3 = N3;
    action := O3' = H3, N3' = H3;
  };
  transition t144 := {
    from   := f46;
    to     := f47;
    guard  := 2 >= N3 + S2;
    action := P3' = S2 + 1;
  };
  transition t145 := {
    from   := f46;
    to     := f47;
    guard  := S2 + N3 > 3;
    action := P3' = S2 - 1;
  };
  transition t146 := {
    from   := f46;
    to     := f47;
    guard  := S2 + N3 = 3;
    action := S2' = 3 - N3, P3' = 3 - N3;
  };
  transition t147 := {
    from   := f47;
    to     := f48;
    guard  := U1 + Q3 > 2*W2 + 1;
    action := R3' = W2 + 1;
  };
  transition t148 := {
    from   := f47;
    to     := f48;
    guard  := 2*W2 > U1 + Q3;
    action := R3' = W2 - 1;
  };
  transition t149 := {
    from   := f47;
    to     := f48;
    guard  := 2*W2 + 1 >= U1 + Q3 && U1 + Q3 >= 2*W2;
    action := R3' = W2;
  };
  transition t150 := {
    from   := f48;
    to     := f49;
    guard  := W1 + S3 > 2*I3;
    action := T3' = I3 + 1;
  };
  transition t151 := {
    from   := f48;
    to     := f49;
    guard  := 2*I3 > 1 + W1 + S3;
    action := T3' = I3 - 1;
  };
  transition t152 := {
    from   := f48;
    to     := f49;
    guard  := W1 + S3 + 1 >= 2*I3 && 2*I3 >= W1 + S3;
    action := T3' = I3;
  };
  transition t153 := {
    from   := f49;
    to     := f50;
    guard  := U3 > V3;
    action := W3' = V3 + 1;
  };
  transition t154 := {
    from   := f49;
    to     := f50;
    guard  := V3 > U3;
    action := W3' = V3 - 1;
  };
  transition t155 := {
    from   := f49;
    to     := f50;
    guard  := V3 = U3;
    action := W3' = V3, U3' = V3;
  };
  transition t156 := {
    from   := f50;
    to     := f51;
    guard  := V3 > X3;
    action := Y3' = X3 + 1;
  };
  transition t157 := {
    from   := f50;
    to     := f51;
    guard  := X3 > V3;
    action := Y3' = X3 - 1;
  };
  transition t158 := {
    from   := f50;
    to     := f51;
    guard  := V3 = X3;
    action := Y3' = V3, X3' = V3;
  };
  transition t159 := {
    from   := f51;
    to     := f52;
    guard  := 2 >= X3 + Z3;
    action := A4' = Z3 + 1;
  };
  transition t160 := {
    from   := f51;
    to     := f52;
    guard  := Z3 + X3 > 3;
    action := A4' = Z3 - 1;
  };
  transition t161 := {
    from   := f51;
    to     := f52;
    guard  := Z3 + X3 = 3;
    action := A4' = 3 - X3, Z3' = 3 - X3;
  };
  transition t162 := {
    from   := f52;
    to     := f53;
    guard  := 2 >= Z3 + B4;
    action := C4' = B4 + 1;
  };
  transition t163 := {
    from   := f52;
    to     := f53;
    guard  := B4 + Z3 > 3;
    action := C4' = B4 - 1;
  };
  transition t164 := {
    from   := f52;
    to     := f53;
    guard  := B4 + Z3 = 3;
    action := C4' = 3 - Z3, B4' = 3 - Z3;
  };
  transition t165 := {
    from   := f53;
    to     := f54;
    guard  := B4 > D4;
    action := E4' = D4 + 1;
  };
  transition t166 := {
    from   := f53;
    to     := f54;
    guard  := D4 > B4;
    action := E4' = D4 - 1;
  };
  transition t167 := {
    from   := f53;
    to     := f54;
    guard  := B4 = D4;
    action := E4' = B4, D4' = B4;
  };
  transition t168 := {
    from   := f54;
    to     := f55;
    guard  := 2 >= F4 && G4 > F4;
    action := H4' = F4 + 1;
  };
  transition t169 := {
    from   := f54;
    to     := f55;
    guard  := F4 > 3;
    action := H4' = F4 - 1;
  };
  transition t170 := {
    from   := f54;
    to     := f55;
    guard  := F4 > G4;
    action := H4' = F4 - 1;
  };
  transition t171 := {
    from   := f54;
    to     := f55;
    guard  := G4 > 2 && F4 = 3;
    action := H4' = 3, F4' = 3;
  };
  transition t172 := {
    from   := f54;
    to     := f55;
    guard  := 2 >= G4 && F4 = G4;
    action := H4' = F4, G4' = F4;
  };
  transition t173 := {
    from   := f55;
    to     := f56;
    guard  := F4 > I4;
    action := J4' = I4 + 1;
  };
  transition t174 := {
    from   := f55;
    to     := f56;
    guard  := I4 > F4;
    action := J4' = I4 - 1;
  };
  transition t175 := {
    from   := f55;
    to     := f56;
    guard  := F4 = I4;
    action := J4' = F4, I4' = F4;
  };
  transition t176 := {
    from   := f56;
    to     := f57;
    guard  := D4 + I4 > 2*S3;
    action := K4' = S3 + 1;
  };
  transition t177 := {
    from   := f56;
    to     := f57;
    guard  := 2*S3 > 1 + D4 + I4;
    action := K4' = S3 - 1;
  };
  transition t178 := {
    from   := f56;
    to     := f57;
    guard  := 2*S3 >= D4 + I4 && D4 + I4 + 1 >= 2*S3;
    action := K4' = S3;
  };
  transition t179 := {
    from   := f57;
    to     := f58;
    guard  := F4 > L4;
    action := M4' = L4 + 1;
  };
  transition t180 := {
    from   := f57;
    to     := f58;
    guard  := L4 > F4;
    action := M4' = L4 - 1;
  };
  transition t181 := {
    from   := f57;
    to     := f58;
    guard  := F4 = L4;
    action := M4' = F4, L4' = F4;
  };
  transition t182 := {
    from   := f58;
    to     := f59;
    guard  := 2 >= L4 + Q3;
    action := N4' = Q3 + 1;
  };
  transition t183 := {
    from   := f58;
    to     := f59;
    guard  := Q3 + L4 > 3;
    action := N4' = Q3 - 1;
  };
  transition t184 := {
    from   := f58;
    to     := f59;
    guard  := Q3 + L4 = 3;
    action := Q3' = 3 - L4, N4' = 3 - L4;
  };
  transition t185 := {
    from   := f59;
    to     := f60;
    guard  := S2 > 2*U3 + 1;
    action := O4' = U3 + 1;
  };
  transition t186 := {
    from   := f59;
    to     := f60;
    guard  := 2*U3 > S2;
    action := O4' = U3 - 1;
  };
  transition t187 := {
    from   := f59;
    to     := f60;
    guard  := 2*U3 + 1 >= S2 && S2 >= 2*U3;
    action := O4' = U3;
  };
  transition t188 := {
    from   := f60;
    to     := f1;
    guard  := U2 + 1 >= 2*G4;
    action := B' = C, A' = X, D' = E, F' = G, H' = I, J' = K, L' = N, M' = Z, O' = P, Q' = R, S' = T, U' = V, W' = T1, Y' = Q1, B1' = C1, A1' = V1, D1' = E1, F1' = G1, H1' = I1, J1' = K1, L1' = N1, M1' = X1, O1' = P1, R1' = S1, U1' = R2, W1' = O2, Z1' = A2, Y1' = T2, B2' = C2, D2' = E2, F2' = G2, H2' = I2, J2' = L2, K2' = V2, M2' = N2, P2' = Q2, S2' = P3, U2' = M3, X2' = Y2, W2' = R3, Z2' = A3, B3' = C3, D3' = E3, F3' = G3, H3' = J3, I3' = T3, K3' = L3, N3' = O3, Q3' = N4, S3' = K4, V3' = W3, U3' = O4, X3' = Y3, Z3' = A4, B4' = C4, D4' = E4, F4' = H4, G4' = G4 + 1, I4' = J4, L4' = M4, P4' = G4 + 1;
  };
  transition t189 := {
    from   := f60;
    to     := f1;
    guard  := 2*G4 > 3 + U2;
    action := B' = C, A' = X, D' = E, F' = G, H' = I, J' = K, L' = N, M' = Z, O' = P, Q' = R, S' = T, U' = V, W' = T1, Y' = Q1, B1' = C1, A1' = V1, D1' = E1, F1' = G1, H1' = I1, J1' = K1, L1' = N1, M1' = X1, O1' = P1, R1' = S1, U1' = R2, W1' = O2, Z1' = A2, Y1' = T2, B2' = C2, D2' = E2, F2' = G2, H2' = I2, J2' = L2, K2' = V2, M2' = N2, P2' = Q2, S2' = P3, U2' = M3, X2' = Y2, W2' = R3, Z2' = A3, B3' = C3, D3' = E3, F3' = G3, H3' = J3, I3' = T3, K3' = L3, N3' = O3, Q3' = N4, S3' = K4, V3' = W3, U3' = O4, X3' = Y3, Z3' = A4, B4' = C4, D4' = E4, F4' = H4, G4' = G4 - 1, I4' = J4, L4' = M4, P4' = G4 - 1;
  };
  transition t190 := {
    from   := f60;
    to     := f1;
    guard  := 2*G4 > U2 + 1 && U2 + 3 >= 2*G4;
    action := B' = C, A' = X, D' = E, F' = G, H' = I, J' = K, L' = N, M' = Z, O' = P, Q' = R, S' = T, U' = V, W' = T1, Y' = Q1, B1' = C1, A1' = V1, D1' = E1, F1' = G1, H1' = I1, J1' = K1, L1' = N1, M1' = X1, O1' = P1, R1' = S1, U1' = R2, W1' = O2, Z1' = A2, Y1' = T2, B2' = C2, D2' = E2, F2' = G2, H2' = I2, J2' = L2, K2' = V2, M2' = N2, P2' = Q2, S2' = P3, U2' = M3, X2' = Y2, W2' = R3, Z2' = A3, B3' = C3, D3' = E3, F3' = G3, H3' = J3, I3' = T3, K3' = L3, N3' = O3, Q3' = N4, S3' = K4, V3' = W3, U3' = O4, X3' = Y3, Z3' = A4, B4' = C4, D4' = E4, F4' = H4, I4' = J4, L4' = M4, P4' = G4;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
