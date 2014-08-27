model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1;
  states f2, f15, f26, f30, f33, f42, f47, f51, f58, f68, f72, f81, f87, f90, f100, f103, f119, f122, f131, f141, f147, f152, f155, f164, f167, f176, f184, f187, f199, f210, f218, f228, f1, start;
  transition t0 := {
    from   := f2;
    to     := f2;
    guard  := A >= B && C >= D1;
    action := B' = B + 1, D' = D1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t1 := {
    from   := f2;
    to     := f2;
    guard  := A >= B && D1 > C;
    action := B' = B + 1, D' = D1, C' = E1, E' = E1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t2 := {
    from   := f15;
    to     := f15;
    guard  := A >= B;
    action := B' = B + 1, F' = 0, G' = 0, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t3 := {
    from   := f15;
    to     := f15;
    guard  := A >= B && 0 > D1;
    action := B' = B + 1, F' = D1, G' = E1, H' = H + E1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t4 := {
    from   := f15;
    to     := f15;
    guard  := A >= B && D1 > 0;
    action := B' = B + 1, F' = D1, G' = E1, H' = H + E1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t5 := {
    from   := f26;
    to     := f30;
    guard  := 0 > I && 200 >= J;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t6 := {
    from   := f26;
    to     := f30;
    guard  := I > 0 && 200 >= J;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t7 := {
    from   := f30;
    to     := f33;
    guard  := A >= B;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t8 := {
    from   := f33;
    to     := f33;
    guard  := A >= K;
    action := K' = K + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t9 := {
    from   := f42;
    to     := f47;
    guard  := A > L && 0 > D1;
    action := M' = D1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t10 := {
    from   := f42;
    to     := f47;
    guard  := A > L && D1 > 0;
    action := M' = D1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t11 := {
    from   := f47;
    to     := f51;
    guard  := A >= K;
    action := H' = 0, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t12 := {
    from   := f51;
    to     := f51;
    guard  := A >= B;
    action := B' = B + 1, H' = D1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t13 := {
    from   := f58;
    to     := f58;
    guard  := A >= B;
    action := B' = B + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t14 := {
    from   := f42;
    to     := f42;
    guard  := A > L;
    action := L' = L + 1, M' = 0, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t15 := {
    from   := f68;
    to     := f72;
    guard  := A >= B;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t16 := {
    from   := f72;
    to     := f72;
    guard  := B > K;
    action := K' = K + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t17 := {
    from   := f26;
    to     := f81;
    guard  := 200 >= J && I = 0;
    action := I' = 0, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t18 := {
    from   := f81;
    to     := f81;
    guard  := A >= B;
    action := B' = B + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t19 := {
    from   := f87;
    to     := f90;
    guard  := A >= B;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t20 := {
    from   := f90;
    to     := f90;
    guard  := A >= K;
    action := H' = D1, K' = K + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t21 := {
    from   := f100;
    to     := f103;
    guard  := A >= B;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t22 := {
    from   := f103;
    to     := f103;
    guard  := A >= K;
    action := H' = D1, K' = K + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t23 := {
    from   := f119;
    to     := f122;
    guard  := A >= B;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t24 := {
    from   := f122;
    to     := f122;
    guard  := A >= K;
    action := H' = D1, K' = K + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t25 := {
    from   := f131;
    to     := f131;
    guard  := A >= B;
    action := B' = B + 1, F' = 0, N' = 0, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t26 := {
    from   := f131;
    to     := f131;
    guard  := A >= B && 0 > D1;
    action := B' = B + 1, F' = D1, N' = E1, O' = O + E1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t27 := {
    from   := f131;
    to     := f131;
    guard  := A >= B && D1 > 0;
    action := B' = B + 1, F' = D1, N' = E1, O' = O + E1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t28 := {
    from   := f141;
    to     := f141;
    guard  := A >= B;
    action := B' = B + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t29 := {
    from   := f147;
    to     := f147;
    guard  := A >= B;
    action := B' = B + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t30 := {
    from   := f152;
    to     := f155;
    guard  := A >= B;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t31 := {
    from   := f155;
    to     := f155;
    guard  := A >= K;
    action := H' = D1, K' = K + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t32 := {
    from   := f164;
    to     := f167;
    guard  := B > 0;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t33 := {
    from   := f167;
    to     := f167;
    guard  := B >= K;
    action := H' = D1, K' = K + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t34 := {
    from   := f176;
    to     := f176;
    guard  := A >= B;
    action := B' = B + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t35 := {
    from   := f184;
    to     := f187;
    guard  := A >= B;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t36 := {
    from   := f187;
    to     := f187;
    guard  := A >= K;
    action := H' = D1, K' = K + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t37 := {
    from   := f199;
    to     := f199;
    guard  := A >= B && C >= D1;
    action := B' = B + 1, P' = D1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t38 := {
    from   := f199;
    to     := f199;
    guard  := A >= B && E1 > C;
    action := B' = B + 1, C' = D1, P' = E1, Q' = D1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t39 := {
    from   := f210;
    to     := f210;
    guard  := A >= B;
    action := B' = B + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t40 := {
    from   := f218;
    to     := f228;
    guard  := A >= B && E1 > 1;
    action := R' = D1, S' = E1, T' = E1, U' = 1, V' = E1, W' = F1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t41 := {
    from   := f218;
    to     := f228;
    guard  := A >= B && 1 >= E1;
    action := R' = D1, S' = E1, T' = E1, U' = 1, V' = 1, W' = F1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t42 := {
    from   := f228;
    to     := f218;
    guard  := C >= W;
    action := B' = B + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t43 := {
    from   := f228;
    to     := f218;
    guard  := W > C;
    action := B' = B + 1, C' = W, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t44 := {
    from   := f218;
    to     := f26;
    guard  := B > A && C >= 0;
    action := J' = J + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t45 := {
    from   := f218;
    to     := f1;
    guard  := B > A && 0 > C;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t46 := {
    from   := f210;
    to     := f26;
    guard  := B > A;
    action := J' = J + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t47 := {
    from   := f199;
    to     := f210;
    guard  := B > A && 0 > D1;
    action := X' = D1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t48 := {
    from   := f199;
    to     := f210;
    guard  := B > A && D1 > 0;
    action := X' = D1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t49 := {
    from   := f199;
    to     := f218;
    guard  := B > A;
    action := C' = 0, I' = 0, X' = 0, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t50 := {
    from   := f187;
    to     := f184;
    guard  := K > A;
    action := B' = B + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t51 := {
    from   := f184;
    to     := f199;
    guard  := B > A;
    action := C' = 0, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t52 := {
    from   := f176;
    to     := f184;
    guard  := B > A;
    action := Y' = D1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t53 := {
    from   := f167;
    to     := f164;
    guard  := K > B;
    action := B' = B - 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t54 := {
    from   := f164;
    to     := f176;
    guard  := 0 >= B;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t55 := {
    from   := f155;
    to     := f152;
    guard  := K > A;
    action := B' = B + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t56 := {
    from   := f152;
    to     := f164;
    guard  := B > A;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t57 := {
    from   := f147;
    to     := f152;
    guard  := B > A;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t58 := {
    from   := f141;
    to     := f147;
    guard  := B > A;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t59 := {
    from   := f131;
    to     := f141;
    guard  := B > A;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t60 := {
    from   := f122;
    to     := f119;
    guard  := K > A;
    action := B' = B + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t61 := {
    from   := f119;
    to     := f131;
    guard  := B > A;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t62 := {
    from   := f103;
    to     := f100;
    guard  := K > A && D1 >= 0;
    action := B' = B + 1, Z' = 0, A1' = D1, B1' = E1, C1' = F1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t63 := {
    from   := f103;
    to     := f100;
    guard  := K > A && 0 > D1;
    action := B' = B + 1, A1' = D1, B1' = E1, C1' = F1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t64 := {
    from   := f100;
    to     := f152;
    guard  := B > A && 0 > Z;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t65 := {
    from   := f100;
    to     := f152;
    guard  := B > A && Z > 0;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t66 := {
    from   := f100;
    to     := f119;
    guard  := B > A && Z = 0;
    action := Z' = 0, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t67 := {
    from   := f90;
    to     := f87;
    guard  := K > A;
    action := B' = B + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t68 := {
    from   := f87;
    to     := f100;
    guard  := B > A;
    action := Z' = 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t69 := {
    from   := f81;
    to     := f87;
    guard  := B > A;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t70 := {
    from   := f72;
    to     := f68;
    guard  := K >= B;
    action := B' = B + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t71 := {
    from   := f68;
    to     := f152;
    guard  := B > A;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t72 := {
    from   := f58;
    to     := f47;
    guard  := B > A;
    action := K' = K + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t73 := {
    from   := f51;
    to     := f58;
    guard  := B > A;
    action := H' = D1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t74 := {
    from   := f47;
    to     := f42;
    guard  := K > A;
    action := L' = L + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t75 := {
    from   := f42;
    to     := f68;
    guard  := L >= A;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t76 := {
    from   := f33;
    to     := f30;
    guard  := K > A;
    action := B' = B + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t77 := {
    from   := f30;
    to     := f42;
    guard  := B > A;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t78 := {
    from   := f26;
    to     := f1;
    guard  := J > 200;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t79 := {
    from   := f15;
    to     := f26;
    guard  := B > A;
    action := I' = 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t80 := {
    from   := f2;
    to     := f1;
    guard  := B > A && 0 >= C;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t81 := {
    from   := f2;
    to     := f15;
    guard  := B > A && C > 0;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t82 := {
    from   := start;
    to     := f2;
    guard  := true;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
}
strategy dumb {
  Region init := { state = start };
}
