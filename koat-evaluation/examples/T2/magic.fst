model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1;
  states f129, f130, f131, f132, f0, f25, f31, f34, f44, f47, f50, f60, f66, f72, f78, f84, f88, f94, f102, f106, f112, f141;
  transition t0 := {
    from   := f129;
    to     := f130;
    guard  := 0 > A;
    action := W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t1 := {
    from   := f129;
    to     := f130;
    guard  := A > 0;
    action := W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t2 := {
    from   := f130;
    to     := f131;
    guard  := 0 > B;
    action := W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t3 := {
    from   := f130;
    to     := f131;
    guard  := B > 0;
    action := W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t4 := {
    from   := f131;
    to     := f132;
    guard  := 0 > C;
    action := W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t5 := {
    from   := f131;
    to     := f132;
    guard  := C > 0;
    action := W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t6 := {
    from   := f0;
    to     := f25;
    guard  := true;
    action := D' = 4, E' = W, F' = X, A' = 1, B' = 1, C' = 1, G' = 0, H' = 0, I' = 0, J' = 0, K' = 0, L' = Y, M' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t7 := {
    from   := f25;
    to     := f25;
    guard  := E > M;
    action := M' = M + 1, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t8 := {
    from   := f31;
    to     := f34;
    guard  := E > M && 0 > A;
    action := W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t9 := {
    from   := f31;
    to     := f34;
    guard  := E > M && A > 0;
    action := W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t10 := {
    from   := f34;
    to     := f31;
    guard  := W > 0;
    action := A' = 1, M' = M + 1, N' = 1, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t11 := {
    from   := f34;
    to     := f31;
    guard  := W > 0;
    action := A' = 0, M' = M + 1, N' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t12 := {
    from   := f34;
    to     := f31;
    guard  := 0 >= W;
    action := A' = 0, M' = M + 1, N' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t13 := {
    from   := f31;
    to     := f31;
    guard  := E > M && A = 0;
    action := A' = 0, M' = M + 1, N' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t14 := {
    from   := f44;
    to     := f47;
    guard  := E > M;
    action := O' = M + 1, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t15 := {
    from   := f47;
    to     := f50;
    guard  := E > O && 0 > B;
    action := W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t16 := {
    from   := f47;
    to     := f50;
    guard  := E > O && B > 0;
    action := W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t17 := {
    from   := f50;
    to     := f47;
    guard  := W > X;
    action := B' = 1, O' = O + 1, P' = 1, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t18 := {
    from   := f50;
    to     := f47;
    guard  := true;
    action := B' = 1, O' = O + 1, P' = 1, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t19 := {
    from   := f50;
    to     := f47;
    guard  := true;
    action := B' = 0, O' = O + 1, P' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t20 := {
    from   := f47;
    to     := f47;
    guard  := E > O && B = 0;
    action := B' = 0, O' = O + 1, P' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t21 := {
    from   := f60;
    to     := f60;
    guard  := D > M;
    action := H' = H + W, M' = M + 1, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t22 := {
    from   := f66;
    to     := f72;
    guard  := F = H;
    action := C' = 1, H' = F, M' = 0, Q' = 1, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t23 := {
    from   := f66;
    to     := f72;
    guard  := F > H;
    action := C' = 0, M' = 0, Q' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t24 := {
    from   := f66;
    to     := f72;
    guard  := H > F;
    action := C' = 0, M' = 0, Q' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t25 := {
    from   := f72;
    to     := f72;
    guard  := D > M;
    action := I' = I + W, M' = M + 1, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t26 := {
    from   := f78;
    to     := f84;
    guard  := F = I;
    action := C' = 1, I' = F, M' = 0, R' = 1, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t27 := {
    from   := f78;
    to     := f84;
    guard  := F > I;
    action := C' = 0, M' = 0, R' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t28 := {
    from   := f78;
    to     := f84;
    guard  := I > F;
    action := C' = 0, M' = 0, R' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t29 := {
    from   := f84;
    to     := f88;
    guard  := D > M;
    action := J' = 0, O' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t30 := {
    from   := f88;
    to     := f88;
    guard  := D > O;
    action := J' = J + W, O' = O + 1, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t31 := {
    from   := f94;
    to     := f84;
    guard  := F = J;
    action := C' = 1, J' = F, M' = M + 1, S' = 1, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t32 := {
    from   := f94;
    to     := f84;
    guard  := F > J;
    action := C' = 0, M' = M + 1, S' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t33 := {
    from   := f94;
    to     := f84;
    guard  := J > F;
    action := C' = 0, M' = M + 1, S' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t34 := {
    from   := f102;
    to     := f106;
    guard  := D > O;
    action := K' = 0, M' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t35 := {
    from   := f106;
    to     := f106;
    guard  := D > M;
    action := K' = K + W, M' = M + 1, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t36 := {
    from   := f112;
    to     := f102;
    guard  := F = K;
    action := C' = 1, K' = F, O' = O + 1, T' = 1, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t37 := {
    from   := f112;
    to     := f102;
    guard  := F > K;
    action := C' = 0, O' = O + 1, T' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t38 := {
    from   := f112;
    to     := f102;
    guard  := K > F;
    action := C' = 0, O' = O + 1, T' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t39 := {
    from   := f132;
    to     := f141;
    guard  := 0 > G;
    action := U' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t40 := {
    from   := f132;
    to     := f141;
    guard  := G > 0;
    action := U' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t41 := {
    from   := f132;
    to     := f141;
    guard  := G = 0;
    action := G' = 0, U' = 1, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t42 := {
    from   := f131;
    to     := f141;
    guard  := C = 0;
    action := C' = 0, U' = 1, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t43 := {
    from   := f130;
    to     := f141;
    guard  := B = 0;
    action := B' = 0, U' = 1, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t44 := {
    from   := f129;
    to     := f141;
    guard  := A = 0;
    action := A' = 0, U' = 1, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t45 := {
    from   := f106;
    to     := f112;
    guard  := M >= D && 0 > C;
    action := W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t46 := {
    from   := f106;
    to     := f112;
    guard  := M >= D && C > 0;
    action := W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t47 := {
    from   := f106;
    to     := f102;
    guard  := M >= D && C = 0;
    action := C' = 0, O' = O + 1, T' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t48 := {
    from   := f102;
    to     := f129;
    guard  := W > X && Y > Z && A1 > B1 && O >= D && C1 > D1;
    action := G' = 1, V' = 1, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t49 := {
    from   := f102;
    to     := f129;
    guard  := W > X && Y > Z && O >= D && A1 > B1;
    action := G' = 0, V' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t50 := {
    from   := f102;
    to     := f129;
    guard  := W > X && O >= D && Y > Z;
    action := G' = 0, V' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t51 := {
    from   := f102;
    to     := f129;
    guard  := O >= D && W > X;
    action := G' = 0, V' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t52 := {
    from   := f102;
    to     := f129;
    guard  := O >= D;
    action := G' = 0, V' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t53 := {
    from   := f88;
    to     := f94;
    guard  := O >= D && 0 > C;
    action := W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t54 := {
    from   := f88;
    to     := f94;
    guard  := O >= D && C > 0;
    action := W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t55 := {
    from   := f88;
    to     := f84;
    guard  := O >= D && C = 0;
    action := C' = 0, M' = M + 1, S' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t56 := {
    from   := f84;
    to     := f102;
    guard  := M >= D;
    action := O' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t57 := {
    from   := f72;
    to     := f78;
    guard  := M >= D && 0 > C;
    action := W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t58 := {
    from   := f72;
    to     := f78;
    guard  := M >= D && C > 0;
    action := W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t59 := {
    from   := f72;
    to     := f84;
    guard  := M >= D && C = 0;
    action := C' = 0, M' = 0, R' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t60 := {
    from   := f60;
    to     := f66;
    guard  := M >= D && 0 > C;
    action := W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t61 := {
    from   := f60;
    to     := f66;
    guard  := M >= D && C > 0;
    action := W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t62 := {
    from   := f60;
    to     := f72;
    guard  := M >= D && C = 0;
    action := C' = 0, M' = 0, Q' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t63 := {
    from   := f47;
    to     := f44;
    guard  := O >= E;
    action := M' = M + 1, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t64 := {
    from   := f44;
    to     := f60;
    guard  := M >= E;
    action := M' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t65 := {
    from   := f31;
    to     := f44;
    guard  := M >= E;
    action := M' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t66 := {
    from   := f25;
    to     := f31;
    guard  := M >= E;
    action := M' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
