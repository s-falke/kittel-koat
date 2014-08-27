model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1;
  states f0, f18, f21, f46, f27, f30, f58, f61, f86, f67, f70, f98, f101, f126, f107, f110, f138, f141, f166, f147, f150, f178, f181, f187, f190, f207;
  transition t0 := {
    from   := f0;
    to     := f18;
    guard  := true;
    action := A' = 100, B' = 0;
  };
  transition t1 := {
    from   := f0;
    to     := f18;
    guard  := true;
    action := A' = 100, B' = 10;
  };
  transition t2 := {
    from   := f18;
    to     := f21;
    guard  := 0 > B;
    action := C' = B;
  };
  transition t3 := {
    from   := f18;
    to     := f21;
    guard  := B > 0;
    action := C' = B;
  };
  transition t4 := {
    from   := f18;
    to     := f46;
    guard  := B = 0;
    action := B' = 0, C' = 0;
  };
  transition t5 := {
    from   := f21;
    to     := f27;
    guard  := true;
    action := D' = 0;
  };
  transition t6 := {
    from   := f21;
    to     := f27;
    guard  := true;
    action := D' = 10;
  };
  transition t7 := {
    from   := f27;
    to     := f46;
    guard  := D = 0;
    action := D' = 0, E' = 0;
  };
  transition t8 := {
    from   := f27;
    to     := f30;
    guard  := 0 > D;
    action := E' = D, F' = 0;
  };
  transition t9 := {
    from   := f27;
    to     := f30;
    guard  := D > 0;
    action := E' = D, F' = 0;
  };
  transition t10 := {
    from   := f46;
    to     := f58;
    guard  := true;
    action := G' = 200, H' = 0;
  };
  transition t11 := {
    from   := f46;
    to     := f58;
    guard  := true;
    action := G' = 200, H' = 10;
  };
  transition t12 := {
    from   := f58;
    to     := f61;
    guard  := 0 > H;
    action := I' = H;
  };
  transition t13 := {
    from   := f58;
    to     := f61;
    guard  := H > 0;
    action := I' = H;
  };
  transition t14 := {
    from   := f58;
    to     := f86;
    guard  := H = 0;
    action := H' = 0, I' = 0;
  };
  transition t15 := {
    from   := f61;
    to     := f67;
    guard  := true;
    action := J' = 0;
  };
  transition t16 := {
    from   := f61;
    to     := f67;
    guard  := true;
    action := J' = 10;
  };
  transition t17 := {
    from   := f67;
    to     := f86;
    guard  := J = 0;
    action := J' = 0, K' = 0;
  };
  transition t18 := {
    from   := f67;
    to     := f70;
    guard  := 0 > J;
    action := K' = J, L' = 0;
  };
  transition t19 := {
    from   := f67;
    to     := f70;
    guard  := J > 0;
    action := K' = J, L' = 0;
  };
  transition t20 := {
    from   := f86;
    to     := f98;
    guard  := true;
    action := M' = 50, N' = 0;
  };
  transition t21 := {
    from   := f86;
    to     := f98;
    guard  := true;
    action := M' = 50, N' = 10;
  };
  transition t22 := {
    from   := f98;
    to     := f101;
    guard  := 0 > N;
    action := O' = N;
  };
  transition t23 := {
    from   := f98;
    to     := f101;
    guard  := N > 0;
    action := O' = N;
  };
  transition t24 := {
    from   := f98;
    to     := f126;
    guard  := N = 0;
    action := N' = 0, O' = 0;
  };
  transition t25 := {
    from   := f101;
    to     := f107;
    guard  := true;
    action := P' = 0;
  };
  transition t26 := {
    from   := f101;
    to     := f107;
    guard  := true;
    action := P' = 10;
  };
  transition t27 := {
    from   := f107;
    to     := f126;
    guard  := P = 0;
    action := P' = 0, Q' = 0;
  };
  transition t28 := {
    from   := f107;
    to     := f110;
    guard  := 0 > P;
    action := Q' = P, R' = 0;
  };
  transition t29 := {
    from   := f107;
    to     := f110;
    guard  := P > 0;
    action := Q' = P, R' = 0;
  };
  transition t30 := {
    from   := f126;
    to     := f138;
    guard  := true;
    action := S' = 20, T' = 0;
  };
  transition t31 := {
    from   := f126;
    to     := f138;
    guard  := true;
    action := S' = 20, T' = 10;
  };
  transition t32 := {
    from   := f138;
    to     := f141;
    guard  := 0 > T;
    action := U' = T;
  };
  transition t33 := {
    from   := f138;
    to     := f141;
    guard  := T > 0;
    action := U' = T;
  };
  transition t34 := {
    from   := f138;
    to     := f166;
    guard  := T = 0;
    action := T' = 0, U' = 0;
  };
  transition t35 := {
    from   := f141;
    to     := f147;
    guard  := true;
    action := V' = 0;
  };
  transition t36 := {
    from   := f141;
    to     := f147;
    guard  := true;
    action := V' = 10;
  };
  transition t37 := {
    from   := f147;
    to     := f166;
    guard  := V = 0;
    action := V' = 0, W' = 0;
  };
  transition t38 := {
    from   := f147;
    to     := f150;
    guard  := 0 > V;
    action := W' = V, X' = 0;
  };
  transition t39 := {
    from   := f147;
    to     := f150;
    guard  := V > 0;
    action := W' = V, X' = 0;
  };
  transition t40 := {
    from   := f166;
    to     := f178;
    guard  := true;
    action := Y' = 200, Z' = 0;
  };
  transition t41 := {
    from   := f166;
    to     := f178;
    guard  := true;
    action := Y' = 200, Z' = 10;
  };
  transition t42 := {
    from   := f178;
    to     := f181;
    guard  := 0 > Z;
    action := A1' = Z;
  };
  transition t43 := {
    from   := f178;
    to     := f181;
    guard  := Z > 0;
    action := A1' = Z;
  };
  transition t44 := {
    from   := f181;
    to     := f187;
    guard  := true;
    action := B1' = 0;
  };
  transition t45 := {
    from   := f181;
    to     := f187;
    guard  := true;
    action := B1' = 10;
  };
  transition t46 := {
    from   := f187;
    to     := f190;
    guard  := 0 > B1;
    action := C1' = B1, D1' = 0;
  };
  transition t47 := {
    from   := f187;
    to     := f190;
    guard  := B1 > 0;
    action := C1' = B1, D1' = 0;
  };
  transition t48 := {
    from   := f178;
    to     := f207;
    guard  := Z = 0;
    action := Z' = 0, A1' = 0;
  };
  transition t49 := {
    from   := f187;
    to     := f207;
    guard  := B1 = 0;
    action := B1' = 0, C1' = 0;
  };
  transition t50 := {
    from   := f190;
    to     := f190;
    guard  := Y > D1;
    action := D1' = D1 + 1;
  };
  transition t51 := {
    from   := f190;
    to     := f207;
    guard  := D1 >= Y;
    action := ;
  };
  transition t52 := {
    from   := f150;
    to     := f150;
    guard  := S > X;
    action := X' = X + 1;
  };
  transition t53 := {
    from   := f150;
    to     := f166;
    guard  := X >= S;
    action := ;
  };
  transition t54 := {
    from   := f110;
    to     := f110;
    guard  := M > R;
    action := R' = R + 1;
  };
  transition t55 := {
    from   := f110;
    to     := f126;
    guard  := R >= M;
    action := ;
  };
  transition t56 := {
    from   := f70;
    to     := f70;
    guard  := G > L;
    action := L' = L + 1;
  };
  transition t57 := {
    from   := f70;
    to     := f86;
    guard  := L >= G;
    action := ;
  };
  transition t58 := {
    from   := f30;
    to     := f30;
    guard  := A > F;
    action := F' = F + 1;
  };
  transition t59 := {
    from   := f30;
    to     := f46;
    guard  := F >= A;
    action := ;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
