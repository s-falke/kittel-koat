model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W;
  states f0, f2, f3, f4, f5, f6, f7, f17, f18, f19, f20, f21, f22, f23, f33, f34, f35, f36, f37, f38, f47, f48, f49, f50, f51, f59, f60, f61, f62, f69, f70, f71, f77, f78, f101, f102, f108, f109, f110, f111, f83, f119;
  transition t0 := {
    from   := f0;
    to     := f2;
    guard  := A > B;
    action := W' = ?;
  };
  transition t1 := {
    from   := f0;
    to     := f2;
    guard  := B > A;
    action := W' = ?;
  };
  transition t2 := {
    from   := f2;
    to     := f3;
    guard  := C > B;
    action := W' = ?;
  };
  transition t3 := {
    from   := f2;
    to     := f3;
    guard  := B > C;
    action := W' = ?;
  };
  transition t4 := {
    from   := f3;
    to     := f4;
    guard  := D > B;
    action := W' = ?;
  };
  transition t5 := {
    from   := f3;
    to     := f4;
    guard  := B > D;
    action := W' = ?;
  };
  transition t6 := {
    from   := f4;
    to     := f5;
    guard  := E > B;
    action := W' = ?;
  };
  transition t7 := {
    from   := f4;
    to     := f5;
    guard  := B > E;
    action := W' = ?;
  };
  transition t8 := {
    from   := f5;
    to     := f6;
    guard  := F > B;
    action := W' = ?;
  };
  transition t9 := {
    from   := f5;
    to     := f6;
    guard  := B > F;
    action := W' = ?;
  };
  transition t10 := {
    from   := f6;
    to     := f7;
    guard  := G > B;
    action := W' = ?;
  };
  transition t11 := {
    from   := f6;
    to     := f7;
    guard  := B > G;
    action := W' = ?;
  };
  transition t12 := {
    from   := f17;
    to     := f18;
    guard  := 0 > H;
    action := W' = ?;
  };
  transition t13 := {
    from   := f17;
    to     := f18;
    guard  := H > 0;
    action := W' = ?;
  };
  transition t14 := {
    from   := f18;
    to     := f19;
    guard  := C > A;
    action := W' = ?;
  };
  transition t15 := {
    from   := f18;
    to     := f19;
    guard  := A > C;
    action := W' = ?;
  };
  transition t16 := {
    from   := f19;
    to     := f20;
    guard  := D > A;
    action := W' = ?;
  };
  transition t17 := {
    from   := f19;
    to     := f20;
    guard  := A > D;
    action := W' = ?;
  };
  transition t18 := {
    from   := f20;
    to     := f21;
    guard  := E > A;
    action := W' = ?;
  };
  transition t19 := {
    from   := f20;
    to     := f21;
    guard  := A > E;
    action := W' = ?;
  };
  transition t20 := {
    from   := f21;
    to     := f22;
    guard  := F > A;
    action := W' = ?;
  };
  transition t21 := {
    from   := f21;
    to     := f22;
    guard  := A > F;
    action := W' = ?;
  };
  transition t22 := {
    from   := f22;
    to     := f23;
    guard  := G > A;
    action := W' = ?;
  };
  transition t23 := {
    from   := f22;
    to     := f23;
    guard  := A > G;
    action := W' = ?;
  };
  transition t24 := {
    from   := f33;
    to     := f34;
    guard  := 0 > H;
    action := W' = ?;
  };
  transition t25 := {
    from   := f33;
    to     := f34;
    guard  := H > 0;
    action := W' = ?;
  };
  transition t26 := {
    from   := f34;
    to     := f35;
    guard  := D > C;
    action := W' = ?;
  };
  transition t27 := {
    from   := f34;
    to     := f35;
    guard  := C > D;
    action := W' = ?;
  };
  transition t28 := {
    from   := f35;
    to     := f36;
    guard  := E > C;
    action := W' = ?;
  };
  transition t29 := {
    from   := f35;
    to     := f36;
    guard  := C > E;
    action := W' = ?;
  };
  transition t30 := {
    from   := f36;
    to     := f37;
    guard  := F > C;
    action := W' = ?;
  };
  transition t31 := {
    from   := f36;
    to     := f37;
    guard  := C > F;
    action := W' = ?;
  };
  transition t32 := {
    from   := f37;
    to     := f38;
    guard  := G > C;
    action := W' = ?;
  };
  transition t33 := {
    from   := f37;
    to     := f38;
    guard  := C > G;
    action := W' = ?;
  };
  transition t34 := {
    from   := f47;
    to     := f48;
    guard  := 0 > H;
    action := W' = ?;
  };
  transition t35 := {
    from   := f47;
    to     := f48;
    guard  := H > 0;
    action := W' = ?;
  };
  transition t36 := {
    from   := f48;
    to     := f49;
    guard  := E > D;
    action := W' = ?;
  };
  transition t37 := {
    from   := f48;
    to     := f49;
    guard  := D > E;
    action := W' = ?;
  };
  transition t38 := {
    from   := f49;
    to     := f50;
    guard  := F > D;
    action := W' = ?;
  };
  transition t39 := {
    from   := f49;
    to     := f50;
    guard  := D > F;
    action := W' = ?;
  };
  transition t40 := {
    from   := f50;
    to     := f51;
    guard  := G > D;
    action := W' = ?;
  };
  transition t41 := {
    from   := f50;
    to     := f51;
    guard  := D > G;
    action := W' = ?;
  };
  transition t42 := {
    from   := f59;
    to     := f60;
    guard  := 0 > H;
    action := W' = ?;
  };
  transition t43 := {
    from   := f59;
    to     := f60;
    guard  := H > 0;
    action := W' = ?;
  };
  transition t44 := {
    from   := f60;
    to     := f61;
    guard  := F > E;
    action := W' = ?;
  };
  transition t45 := {
    from   := f60;
    to     := f61;
    guard  := E > F;
    action := W' = ?;
  };
  transition t46 := {
    from   := f61;
    to     := f62;
    guard  := G > E;
    action := W' = ?;
  };
  transition t47 := {
    from   := f61;
    to     := f62;
    guard  := E > G;
    action := W' = ?;
  };
  transition t48 := {
    from   := f69;
    to     := f70;
    guard  := 0 > H;
    action := W' = ?;
  };
  transition t49 := {
    from   := f69;
    to     := f70;
    guard  := H > 0;
    action := W' = ?;
  };
  transition t50 := {
    from   := f70;
    to     := f71;
    guard  := G > F;
    action := W' = ?;
  };
  transition t51 := {
    from   := f70;
    to     := f71;
    guard  := F > G;
    action := W' = ?;
  };
  transition t52 := {
    from   := f77;
    to     := f78;
    guard  := 0 > H;
    action := W' = ?;
  };
  transition t53 := {
    from   := f77;
    to     := f78;
    guard  := H > 0;
    action := W' = ?;
  };
  transition t54 := {
    from   := f101;
    to     := f102;
    guard  := 0 > E;
    action := W' = ?;
  };
  transition t55 := {
    from   := f101;
    to     := f102;
    guard  := E > 0;
    action := W' = ?;
  };
  transition t56 := {
    from   := f108;
    to     := f109;
    guard  := 0 > H;
    action := W' = ?;
  };
  transition t57 := {
    from   := f108;
    to     := f109;
    guard  := H > 0;
    action := W' = ?;
  };
  transition t58 := {
    from   := f109;
    to     := f110;
    guard  := 0 > I;
    action := W' = ?;
  };
  transition t59 := {
    from   := f109;
    to     := f110;
    guard  := I > 0;
    action := W' = ?;
  };
  transition t60 := {
    from   := f110;
    to     := f111;
    guard  := 0 > J;
    action := W' = ?;
  };
  transition t61 := {
    from   := f110;
    to     := f111;
    guard  := J > 0;
    action := W' = ?;
  };
  transition t62 := {
    from   := f7;
    to     := f17;
    guard  := K > B;
    action := L' = 1, H' = 1, W' = ?;
  };
  transition t63 := {
    from   := f7;
    to     := f17;
    guard  := B > K;
    action := L' = 1, H' = 1, W' = ?;
  };
  transition t64 := {
    from   := f7;
    to     := f17;
    guard  := B = K;
    action := K' = B, L' = 0, H' = 0, W' = ?;
  };
  transition t65 := {
    from   := f6;
    to     := f17;
    guard  := B = G;
    action := G' = B, L' = 0, H' = 0, W' = ?;
  };
  transition t66 := {
    from   := f5;
    to     := f17;
    guard  := B = F;
    action := F' = B, L' = 0, H' = 0, W' = ?;
  };
  transition t67 := {
    from   := f4;
    to     := f17;
    guard  := B = E;
    action := E' = B, L' = 0, H' = 0, W' = ?;
  };
  transition t68 := {
    from   := f3;
    to     := f17;
    guard  := B = D;
    action := D' = B, L' = 0, H' = 0, W' = ?;
  };
  transition t69 := {
    from   := f2;
    to     := f17;
    guard  := B = C;
    action := C' = B, L' = 0, H' = 0, W' = ?;
  };
  transition t70 := {
    from   := f0;
    to     := f17;
    guard  := B = A;
    action := A' = B, L' = 0, H' = 0, W' = ?;
  };
  transition t71 := {
    from   := f23;
    to     := f33;
    guard  := K > A;
    action := H' = 1, M' = 1, W' = ?;
  };
  transition t72 := {
    from   := f23;
    to     := f33;
    guard  := A > K;
    action := H' = 1, M' = 1, W' = ?;
  };
  transition t73 := {
    from   := f23;
    to     := f33;
    guard  := A = K;
    action := K' = A, H' = 0, M' = 0, W' = ?;
  };
  transition t74 := {
    from   := f22;
    to     := f33;
    guard  := A = G;
    action := G' = A, H' = 0, M' = 0, W' = ?;
  };
  transition t75 := {
    from   := f21;
    to     := f33;
    guard  := A = F;
    action := F' = A, H' = 0, M' = 0, W' = ?;
  };
  transition t76 := {
    from   := f20;
    to     := f33;
    guard  := A = E;
    action := E' = A, H' = 0, M' = 0, W' = ?;
  };
  transition t77 := {
    from   := f19;
    to     := f33;
    guard  := A = D;
    action := D' = A, H' = 0, M' = 0, W' = ?;
  };
  transition t78 := {
    from   := f18;
    to     := f33;
    guard  := A = C;
    action := C' = A, H' = 0, M' = 0, W' = ?;
  };
  transition t79 := {
    from   := f17;
    to     := f33;
    guard  := H = 0;
    action := H' = 0, M' = 0, W' = ?;
  };
  transition t80 := {
    from   := f38;
    to     := f47;
    guard  := K > C;
    action := H' = 1, N' = 1, W' = ?;
  };
  transition t81 := {
    from   := f38;
    to     := f47;
    guard  := C > K;
    action := H' = 1, N' = 1, W' = ?;
  };
  transition t82 := {
    from   := f38;
    to     := f47;
    guard  := C = K;
    action := K' = C, H' = 0, N' = 0, W' = ?;
  };
  transition t83 := {
    from   := f37;
    to     := f47;
    guard  := C = G;
    action := G' = C, H' = 0, N' = 0, W' = ?;
  };
  transition t84 := {
    from   := f36;
    to     := f47;
    guard  := C = F;
    action := F' = C, H' = 0, N' = 0, W' = ?;
  };
  transition t85 := {
    from   := f35;
    to     := f47;
    guard  := C = E;
    action := E' = C, H' = 0, N' = 0, W' = ?;
  };
  transition t86 := {
    from   := f34;
    to     := f47;
    guard  := C = D;
    action := D' = C, H' = 0, N' = 0, W' = ?;
  };
  transition t87 := {
    from   := f33;
    to     := f47;
    guard  := H = 0;
    action := H' = 0, N' = 0, W' = ?;
  };
  transition t88 := {
    from   := f51;
    to     := f59;
    guard  := K > D;
    action := H' = 1, O' = 1, W' = ?;
  };
  transition t89 := {
    from   := f51;
    to     := f59;
    guard  := D > K;
    action := H' = 1, O' = 1, W' = ?;
  };
  transition t90 := {
    from   := f51;
    to     := f59;
    guard  := D = K;
    action := K' = D, H' = 0, O' = 0, W' = ?;
  };
  transition t91 := {
    from   := f50;
    to     := f59;
    guard  := D = G;
    action := G' = D, H' = 0, O' = 0, W' = ?;
  };
  transition t92 := {
    from   := f49;
    to     := f59;
    guard  := D = F;
    action := F' = D, H' = 0, O' = 0, W' = ?;
  };
  transition t93 := {
    from   := f48;
    to     := f59;
    guard  := D = E;
    action := E' = D, H' = 0, O' = 0, W' = ?;
  };
  transition t94 := {
    from   := f47;
    to     := f59;
    guard  := H = 0;
    action := H' = 0, O' = 0, W' = ?;
  };
  transition t95 := {
    from   := f62;
    to     := f69;
    guard  := K > E;
    action := H' = 1, P' = 1, W' = ?;
  };
  transition t96 := {
    from   := f62;
    to     := f69;
    guard  := E > K;
    action := H' = 1, P' = 1, W' = ?;
  };
  transition t97 := {
    from   := f62;
    to     := f69;
    guard  := E = K;
    action := K' = E, H' = 0, P' = 0, W' = ?;
  };
  transition t98 := {
    from   := f61;
    to     := f69;
    guard  := E = G;
    action := G' = E, H' = 0, P' = 0, W' = ?;
  };
  transition t99 := {
    from   := f60;
    to     := f69;
    guard  := E = F;
    action := F' = E, H' = 0, P' = 0, W' = ?;
  };
  transition t100 := {
    from   := f59;
    to     := f69;
    guard  := H = 0;
    action := H' = 0, P' = 0, W' = ?;
  };
  transition t101 := {
    from   := f71;
    to     := f77;
    guard  := K > F;
    action := H' = 1, Q' = 1, W' = ?;
  };
  transition t102 := {
    from   := f71;
    to     := f77;
    guard  := F > K;
    action := H' = 1, Q' = 1, W' = ?;
  };
  transition t103 := {
    from   := f71;
    to     := f77;
    guard  := F = K;
    action := K' = F, H' = 0, Q' = 0, W' = ?;
  };
  transition t104 := {
    from   := f70;
    to     := f77;
    guard  := F = G;
    action := G' = F, H' = 0, Q' = 0, W' = ?;
  };
  transition t105 := {
    from   := f69;
    to     := f77;
    guard  := H = 0;
    action := H' = 0, Q' = 0, W' = ?;
  };
  transition t106 := {
    from   := f78;
    to     := f83;
    guard  := K > G;
    action := H' = 1, R' = 1, W' = ?;
  };
  transition t107 := {
    from   := f78;
    to     := f83;
    guard  := G > K;
    action := H' = 1, R' = 1, W' = ?;
  };
  transition t108 := {
    from   := f78;
    to     := f83;
    guard  := G = K;
    action := K' = G, H' = 0, R' = 0, W' = ?;
  };
  transition t109 := {
    from   := f77;
    to     := f83;
    guard  := H = 0;
    action := H' = 0, R' = 0, W' = ?;
  };
  transition t110 := {
    from   := f83;
    to     := f101;
    guard  := 9 >= K && 9 >= G && 9 >= F && 9 >= E && 9 >= D && 9 >= C && 9 >= B && 9 >= A;
    action := S' = 1, I' = 1, W' = ?;
  };
  transition t111 := {
    from   := f83;
    to     := f101;
    guard  := K > 9 && 9 >= G && 9 >= F && 9 >= E && 9 >= D && 9 >= C && 9 >= B && 9 >= A;
    action := S' = 0, I' = 0, W' = ?;
  };
  transition t112 := {
    from   := f83;
    to     := f101;
    guard  := G > 9 && 9 >= F && 9 >= E && 9 >= D && 9 >= C && 9 >= B && 9 >= A;
    action := S' = 0, I' = 0, W' = ?;
  };
  transition t113 := {
    from   := f83;
    to     := f101;
    guard  := F > 9 && 9 >= E && 9 >= D && 9 >= C && 9 >= B && 9 >= A;
    action := S' = 0, I' = 0, W' = ?;
  };
  transition t114 := {
    from   := f83;
    to     := f101;
    guard  := E > 9 && 9 >= D && 9 >= C && 9 >= B && 9 >= A;
    action := S' = 0, I' = 0, W' = ?;
  };
  transition t115 := {
    from   := f83;
    to     := f101;
    guard  := D > 9 && 9 >= C && 9 >= B && 9 >= A;
    action := S' = 0, I' = 0, W' = ?;
  };
  transition t116 := {
    from   := f83;
    to     := f101;
    guard  := C > 9 && 9 >= B && 9 >= A;
    action := S' = 0, I' = 0, W' = ?;
  };
  transition t117 := {
    from   := f83;
    to     := f101;
    guard  := 9 >= B && A > 9;
    action := S' = 0, I' = 0, W' = ?;
  };
  transition t118 := {
    from   := f83;
    to     := f101;
    guard  := B > 9;
    action := S' = 0, I' = 0, W' = ?;
  };
  transition t119 := {
    from   := f102;
    to     := f108;
    guard  := 0 > B;
    action := T' = 1, J' = 1, U' = W, W' = ?;
  };
  transition t120 := {
    from   := f102;
    to     := f108;
    guard  := B > 0;
    action := T' = 1, J' = 1, U' = W, W' = ?;
  };
  transition t121 := {
    from   := f102;
    to     := f108;
    guard  := B = 0;
    action := B' = 0, T' = 0, J' = 0, U' = W, W' = ?;
  };
  transition t122 := {
    from   := f101;
    to     := f108;
    guard  := E = 0;
    action := E' = 0, T' = 0, J' = 0, U' = W, W' = ?;
  };
  transition t123 := {
    from   := f111;
    to     := f119;
    guard  := 0 > U;
    action := V' = 0, W' = ?;
  };
  transition t124 := {
    from   := f111;
    to     := f119;
    guard  := U > 0;
    action := V' = 0, W' = ?;
  };
  transition t125 := {
    from   := f111;
    to     := f119;
    guard  := U = 0;
    action := U' = 0, V' = 1, W' = ?;
  };
  transition t126 := {
    from   := f110;
    to     := f119;
    guard  := J = 0;
    action := J' = 0, V' = 1, W' = ?;
  };
  transition t127 := {
    from   := f109;
    to     := f119;
    guard  := I = 0;
    action := I' = 0, V' = 1, W' = ?;
  };
  transition t128 := {
    from   := f108;
    to     := f119;
    guard  := H = 0;
    action := H' = 0, V' = 1, W' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
