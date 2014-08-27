model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1;
  states f0, f44, f54, f57, f59, f67, f71, f74, f80, f89, f92, f99, f104, f106, f115, f117, f132, f134, f142, f151, f156, f161, f163, f171, f173, f181, f188, f190, f201, f211, f218, f228, f43, start;
  transition t0 := {
    from   := f0;
    to     := f0;
    guard  := A >= B && C >= D1;
    action := B' = B + 1, D' = D1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t1 := {
    from   := f0;
    to     := f0;
    guard  := A >= B && D1 > C;
    action := B' = B + 1, D' = D1, C' = E1, E' = E1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t2 := {
    from   := f44;
    to     := f44;
    guard  := A >= B;
    action := B' = B + 1, F' = 0, G' = 0, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t3 := {
    from   := f44;
    to     := f44;
    guard  := A >= B && 0 > D1;
    action := B' = B + 1, F' = D1, G' = E1, H' = H + E1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t4 := {
    from   := f44;
    to     := f44;
    guard  := A >= B && D1 > 0;
    action := B' = B + 1, F' = D1, G' = E1, H' = H + E1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t5 := {
    from   := f54;
    to     := f57;
    guard  := 0 > I && 200 >= J;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t6 := {
    from   := f54;
    to     := f57;
    guard  := I > 0 && 200 >= J;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t7 := {
    from   := f57;
    to     := f59;
    guard  := A >= B;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t8 := {
    from   := f59;
    to     := f59;
    guard  := A >= K;
    action := K' = K + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t9 := {
    from   := f67;
    to     := f71;
    guard  := A > L && 0 > D1;
    action := M' = D1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t10 := {
    from   := f67;
    to     := f71;
    guard  := A > L && D1 > 0;
    action := M' = D1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t11 := {
    from   := f71;
    to     := f74;
    guard  := A >= K;
    action := H' = 0, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t12 := {
    from   := f74;
    to     := f74;
    guard  := A >= B;
    action := B' = B + 1, H' = D1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t13 := {
    from   := f80;
    to     := f80;
    guard  := A >= B;
    action := B' = B + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t14 := {
    from   := f67;
    to     := f67;
    guard  := A > L;
    action := L' = L + 1, M' = 0, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t15 := {
    from   := f89;
    to     := f92;
    guard  := A >= B;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t16 := {
    from   := f92;
    to     := f92;
    guard  := B > K;
    action := K' = K + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t17 := {
    from   := f54;
    to     := f99;
    guard  := 200 >= J && I = 0;
    action := I' = 0, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t18 := {
    from   := f99;
    to     := f99;
    guard  := A >= B;
    action := B' = B + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t19 := {
    from   := f104;
    to     := f106;
    guard  := A >= B;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t20 := {
    from   := f106;
    to     := f106;
    guard  := A >= K;
    action := H' = D1, K' = K + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t21 := {
    from   := f115;
    to     := f117;
    guard  := A >= B;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t22 := {
    from   := f117;
    to     := f117;
    guard  := A >= K;
    action := H' = D1, K' = K + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t23 := {
    from   := f132;
    to     := f134;
    guard  := A >= B;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t24 := {
    from   := f134;
    to     := f134;
    guard  := A >= K;
    action := H' = D1, K' = K + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t25 := {
    from   := f142;
    to     := f142;
    guard  := A >= B;
    action := B' = B + 1, F' = 0, N' = 0, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t26 := {
    from   := f142;
    to     := f142;
    guard  := A >= B && 0 > D1;
    action := B' = B + 1, F' = D1, N' = E1, O' = O + E1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t27 := {
    from   := f142;
    to     := f142;
    guard  := A >= B && D1 > 0;
    action := B' = B + 1, F' = D1, N' = E1, O' = O + E1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t28 := {
    from   := f151;
    to     := f151;
    guard  := A >= B;
    action := B' = B + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t29 := {
    from   := f156;
    to     := f156;
    guard  := A >= B;
    action := B' = B + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t30 := {
    from   := f161;
    to     := f163;
    guard  := A >= B;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t31 := {
    from   := f163;
    to     := f163;
    guard  := A >= K;
    action := H' = D1, K' = K + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t32 := {
    from   := f171;
    to     := f173;
    guard  := B > 0;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t33 := {
    from   := f173;
    to     := f173;
    guard  := B >= K;
    action := H' = D1, K' = K + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t34 := {
    from   := f181;
    to     := f181;
    guard  := A >= B;
    action := B' = B + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t35 := {
    from   := f188;
    to     := f190;
    guard  := A >= B;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t36 := {
    from   := f190;
    to     := f190;
    guard  := A >= K;
    action := H' = D1, K' = K + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t37 := {
    from   := f201;
    to     := f201;
    guard  := A >= B && C >= D1;
    action := B' = B + 1, P' = D1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t38 := {
    from   := f201;
    to     := f201;
    guard  := A >= B && E1 > C;
    action := B' = B + 1, C' = D1, P' = E1, Q' = D1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t39 := {
    from   := f211;
    to     := f211;
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
    to     := f54;
    guard  := B > A && C >= 0;
    action := J' = J + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t45 := {
    from   := f218;
    to     := f43;
    guard  := B > A && 0 > C;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t46 := {
    from   := f211;
    to     := f54;
    guard  := B > A;
    action := J' = J + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t47 := {
    from   := f201;
    to     := f211;
    guard  := B > A && 0 > D1;
    action := X' = D1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t48 := {
    from   := f201;
    to     := f211;
    guard  := B > A && D1 > 0;
    action := X' = D1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t49 := {
    from   := f201;
    to     := f218;
    guard  := B > A;
    action := C' = 0, I' = 0, X' = 0, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t50 := {
    from   := f190;
    to     := f188;
    guard  := K > A;
    action := B' = B + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t51 := {
    from   := f188;
    to     := f201;
    guard  := B > A;
    action := C' = 0, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t52 := {
    from   := f181;
    to     := f188;
    guard  := B > A;
    action := Y' = D1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t53 := {
    from   := f173;
    to     := f171;
    guard  := K > B;
    action := B' = B - 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t54 := {
    from   := f171;
    to     := f181;
    guard  := 0 >= B;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t55 := {
    from   := f163;
    to     := f161;
    guard  := K > A;
    action := B' = B + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t56 := {
    from   := f161;
    to     := f171;
    guard  := B > A;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t57 := {
    from   := f156;
    to     := f161;
    guard  := B > A;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t58 := {
    from   := f151;
    to     := f156;
    guard  := B > A;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t59 := {
    from   := f142;
    to     := f151;
    guard  := B > A;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t60 := {
    from   := f134;
    to     := f132;
    guard  := K > A;
    action := B' = B + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t61 := {
    from   := f132;
    to     := f142;
    guard  := B > A;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t62 := {
    from   := f117;
    to     := f115;
    guard  := K > A && D1 >= 0;
    action := B' = B + 1, Z' = 0, A1' = D1, B1' = E1, C1' = F1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t63 := {
    from   := f117;
    to     := f115;
    guard  := K > A && 0 > D1;
    action := B' = B + 1, A1' = D1, B1' = E1, C1' = F1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t64 := {
    from   := f115;
    to     := f161;
    guard  := B > A && 0 > Z;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t65 := {
    from   := f115;
    to     := f161;
    guard  := B > A && Z > 0;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t66 := {
    from   := f115;
    to     := f132;
    guard  := B > A && Z = 0;
    action := Z' = 0, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t67 := {
    from   := f106;
    to     := f104;
    guard  := K > A;
    action := B' = B + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t68 := {
    from   := f104;
    to     := f115;
    guard  := B > A;
    action := Z' = 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t69 := {
    from   := f99;
    to     := f104;
    guard  := B > A;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t70 := {
    from   := f92;
    to     := f89;
    guard  := K >= B;
    action := B' = B + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t71 := {
    from   := f89;
    to     := f161;
    guard  := B > A;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t72 := {
    from   := f80;
    to     := f71;
    guard  := B > A;
    action := K' = K + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t73 := {
    from   := f74;
    to     := f80;
    guard  := B > A;
    action := H' = D1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t74 := {
    from   := f71;
    to     := f67;
    guard  := K > A;
    action := L' = L + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t75 := {
    from   := f67;
    to     := f89;
    guard  := L >= A;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t76 := {
    from   := f59;
    to     := f57;
    guard  := K > A;
    action := B' = B + 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t77 := {
    from   := f57;
    to     := f67;
    guard  := B > A;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t78 := {
    from   := f54;
    to     := f43;
    guard  := J > 200;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t79 := {
    from   := f44;
    to     := f54;
    guard  := B > A;
    action := I' = 1, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t80 := {
    from   := f0;
    to     := f43;
    guard  := B > A && 0 >= C;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t81 := {
    from   := f0;
    to     := f44;
    guard  := B > A && C > 0;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
  transition t82 := {
    from   := start;
    to     := f0;
    guard  := true;
    action := D1' = ?, E1' = ?, F1' = ?;
  };
}
strategy dumb {
  Region init := { state = start };
}
