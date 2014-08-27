model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z;
  states f20, f26, f69, f33, f39, f47, f50, f59, f62, f71, f74, f73, f76, f78, f0;
  transition t0 := {
    from   := f20;
    to     := f26;
    guard  := 0 > A;
    action := B' = 1, C' = D, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t1 := {
    from   := f20;
    to     := f26;
    guard  := A > 0;
    action := B' = 1, C' = D, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t2 := {
    from   := f20;
    to     := f26;
    guard  := D = 0 && A = 0;
    action := D' = 0, A' = 0, B' = 1, C' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t3 := {
    from   := f20;
    to     := f26;
    guard  := 0 > D && A = 0;
    action := A' = 0, B' = 0, C' = D, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t4 := {
    from   := f20;
    to     := f26;
    guard  := D > 0 && A = 0;
    action := A' = 0, B' = 0, C' = D, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t5 := {
    from   := f26;
    to     := f69;
    guard  := C >= E;
    action := W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t6 := {
    from   := f26;
    to     := f33;
    guard  := 0 > W && E > C;
    action := F' = W, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t7 := {
    from   := f26;
    to     := f33;
    guard  := W > 0 && E > C;
    action := F' = W, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t8 := {
    from   := f26;
    to     := f33;
    guard  := E > C;
    action := F' = 0, G' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t9 := {
    from   := f33;
    to     := f39;
    guard  := H >= I;
    action := W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t10 := {
    from   := f33;
    to     := f39;
    guard  := I > H && J + 1 = 0;
    action := J' = -1, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t11 := {
    from   := f33;
    to     := f33;
    guard  := I > H && 0 > 1 + J;
    action := H' = H + 1, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t12 := {
    from   := f33;
    to     := f33;
    guard  := I > H && J >= 0;
    action := H' = H + 1, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t13 := {
    from   := f39;
    to     := f69;
    guard  := H >= I;
    action := W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t14 := {
    from   := f39;
    to     := f47;
    guard  := I > H && 0 > W;
    action := K' = 0, L' = W, M' = X, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t15 := {
    from   := f39;
    to     := f47;
    guard  := I > H && W > 0;
    action := K' = 0, L' = W, M' = X, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t16 := {
    from   := f47;
    to     := f50;
    guard  := M = 0;
    action := M' = 0, N' = W, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t17 := {
    from   := f39;
    to     := f50;
    guard  := I > H;
    action := K' = 0, L' = 0, N' = W, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t18 := {
    from   := f50;
    to     := f69;
    guard  := N >= 0 && 0 >= W && O = 3;
    action := P' = 1, O' = 3, Q' = W, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t19 := {
    from   := f50;
    to     := f69;
    guard  := N >= 0 && W > 1 && O = 3;
    action := P' = 1, O' = 3, Q' = W, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t20 := {
    from   := f50;
    to     := f59;
    guard  := N >= 0 && 2 >= O;
    action := R' = W, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t21 := {
    from   := f50;
    to     := f59;
    guard  := N >= 0 && O > 3;
    action := R' = W, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t22 := {
    from   := f50;
    to     := f59;
    guard  := N >= 0 && O = 3;
    action := O' = 3, Q' = 1, R' = W, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t23 := {
    from   := f59;
    to     := f62;
    guard  := 10 >= R;
    action := N' = W, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t24 := {
    from   := f59;
    to     := f62;
    guard  := R > 10;
    action := N' = W, R' = 10, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t25 := {
    from   := f26;
    to     := f26;
    guard  := 0 > W && E > C;
    action := C' = C + 1, F' = 0, G' = W, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t26 := {
    from   := f26;
    to     := f26;
    guard  := W > 0 && E > C;
    action := C' = C + 1, F' = 0, G' = W, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t27 := {
    from   := f39;
    to     := f26;
    guard  := I > H && 0 > W;
    action := C' = C + 1, K' = W, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t28 := {
    from   := f39;
    to     := f26;
    guard  := I > H && W > 0;
    action := C' = C + 1, K' = W, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t29 := {
    from   := f47;
    to     := f26;
    guard  := 0 > M;
    action := C' = C + 1, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t30 := {
    from   := f47;
    to     := f26;
    guard  := M > 0;
    action := C' = C + 1, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t31 := {
    from   := f50;
    to     := f26;
    guard  := 0 > N;
    action := C' = C + 1, P' = 1, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t32 := {
    from   := f62;
    to     := f26;
    guard  := 0 > N;
    action := C' = C + 1, P' = 1, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t33 := {
    from   := f62;
    to     := f26;
    guard  := N >= 0;
    action := S' = S + 1, C' = C + 1, J' = K, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t34 := {
    from   := f71;
    to     := f71;
    guard  := true;
    action := W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t35 := {
    from   := f69;
    to     := f71;
    guard  := S = 0;
    action := S' = 0, A' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t36 := {
    from   := f74;
    to     := f74;
    guard  := true;
    action := W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t37 := {
    from   := f73;
    to     := f74;
    guard  := true;
    action := A' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t38 := {
    from   := f69;
    to     := f74;
    guard  := 0 > S;
    action := A' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t39 := {
    from   := f69;
    to     := f74;
    guard  := S > 0;
    action := A' = 0, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t40 := {
    from   := f76;
    to     := f78;
    guard  := true;
    action := W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t41 := {
    from   := f0;
    to     := f20;
    guard  := X >= 0 && Y > 0 && T = 3;
    action := U' = 1, H' = 0, S' = 0, E' = W, D' = X, V' = Y, A' = Z, T' = 3, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t42 := {
    from   := f0;
    to     := f20;
    guard  := 2 >= T && X >= 0 && Y > 0;
    action := U' = 1, H' = 0, S' = 0, E' = W, D' = X, V' = Y, A' = Z, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
  transition t43 := {
    from   := f0;
    to     := f20;
    guard  := T > 3 && X >= 0 && Y > 0;
    action := U' = 1, H' = 0, S' = 0, E' = W, D' = X, V' = Y, A' = Z, W' = ?, X' = ?, Y' = ?, Z' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
