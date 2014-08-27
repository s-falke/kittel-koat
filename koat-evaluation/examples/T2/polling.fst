model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1;
  states f76, f78, f34, f39, f44, f59, f64, f82, f75, f51, f91, f93, f95, f0;
  transition t0 := {
    from   := f76;
    to     := f78;
    guard  := A = 0;
    action := A' = 0, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t1 := {
    from   := f34;
    to     := f39;
    guard  := 0 > B;
    action := C' = 1, D' = B, E' = F1, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t2 := {
    from   := f34;
    to     := f39;
    guard  := B > 0;
    action := C' = 1, D' = B, E' = F1, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t3 := {
    from   := f39;
    to     := f44;
    guard  := 0 > E;
    action := F' = E, G' = 10, H' = F1, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t4 := {
    from   := f39;
    to     := f44;
    guard  := E > 0;
    action := F' = E, G' = 10, H' = F1, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t5 := {
    from   := f59;
    to     := f64;
    guard  := 0 > I;
    action := J' = I, K' = 0, L' = F1, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t6 := {
    from   := f59;
    to     := f64;
    guard  := I > 0;
    action := J' = I, K' = 0, L' = F1, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t7 := {
    from   := f78;
    to     := f82;
    guard  := 0 > K;
    action := F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t8 := {
    from   := f78;
    to     := f82;
    guard  := K > 0;
    action := F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t9 := {
    from   := f75;
    to     := f76;
    guard  := 0 > M;
    action := F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t10 := {
    from   := f75;
    to     := f76;
    guard  := M > 0;
    action := F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t11 := {
    from   := f75;
    to     := f78;
    guard  := M = 0;
    action := M' = 0, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t12 := {
    from   := f76;
    to     := f78;
    guard  := 0 > A;
    action := K' = 1, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t13 := {
    from   := f76;
    to     := f78;
    guard  := A > 0;
    action := K' = 1, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t14 := {
    from   := f51;
    to     := f44;
    guard  := N >= 0;
    action := H' = F1, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t15 := {
    from   := f51;
    to     := f44;
    guard  := 0 > 1 + N;
    action := H' = F1, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t16 := {
    from   := f59;
    to     := f44;
    guard  := I = 0;
    action := H' = F1, I' = 0, J' = 0, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t17 := {
    from   := f82;
    to     := f44;
    guard  := K = 0;
    action := H' = F1, K' = 0, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t18 := {
    from   := f91;
    to     := f91;
    guard  := true;
    action := F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t19 := {
    from   := f34;
    to     := f91;
    guard  := B = 0;
    action := C' = 1, B' = 0, D' = 0, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t20 := {
    from   := f39;
    to     := f91;
    guard  := E = 0;
    action := C' = 1, E' = 0, F' = 0, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t21 := {
    from   := f93;
    to     := f95;
    guard  := true;
    action := F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t22 := {
    from   := f82;
    to     := f44;
    guard  := 0 > K;
    action := H' = F1, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t23 := {
    from   := f82;
    to     := f44;
    guard  := K > 0;
    action := H' = F1, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t24 := {
    from   := f78;
    to     := f82;
    guard  := K = 0;
    action := K' = 0, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t25 := {
    from   := f64;
    to     := f82;
    guard  := 0 > F1;
    action := O' = L, P' = F1, Q' = F1, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t26 := {
    from   := f64;
    to     := f82;
    guard  := F1 > 0;
    action := O' = L, P' = F1, Q' = F1, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t27 := {
    from   := f64;
    to     := f78;
    guard  := true;
    action := O' = L, P' = 0, Q' = 0, R' = 0, S' = 0, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t28 := {
    from   := f64;
    to     := f75;
    guard  := 0 > F1;
    action := O' = L, P' = 0, Q' = 0, R' = F1, S' = F1, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t29 := {
    from   := f64;
    to     := f75;
    guard  := F1 > 0;
    action := O' = L, P' = 0, Q' = 0, R' = F1, S' = F1, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t30 := {
    from   := f51;
    to     := f59;
    guard  := 0 > F1 && N + 1 = 0;
    action := N' = -1, T' = F1, U' = F1, I' = G1, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t31 := {
    from   := f51;
    to     := f59;
    guard  := F1 > 0 && N + 1 = 0;
    action := N' = -1, T' = F1, U' = F1, I' = G1, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t32 := {
    from   := f51;
    to     := f44;
    guard  := N + 1 = 0;
    action := H' = F1, N' = -1, T' = 0, U' = 0, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t33 := {
    from   := f44;
    to     := f51;
    guard  := 0 > V;
    action := N' = H, W' = 0, X' = 0, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t34 := {
    from   := f44;
    to     := f51;
    guard  := V > 0;
    action := N' = H, W' = 0, X' = 0, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t35 := {
    from   := f44;
    to     := f44;
    guard  := V = 0;
    action := V' = 0, H' = F1, N' = H, W' = 0, X' = 0, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t36 := {
    from   := f44;
    to     := f91;
    guard  := 0 > F1;
    action := C' = 1, N' = H, W' = F1, X' = F1, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t37 := {
    from   := f44;
    to     := f91;
    guard  := F1 > 0;
    action := C' = 1, N' = H, W' = F1, X' = F1, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t38 := {
    from   := f0;
    to     := f91;
    guard  := 0 >= G1;
    action := Y' = F1, Z' = F1, A1' = G1, B1' = G1, C1' = H1, C' = 1, D1' = I1, V' = I1, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t39 := {
    from   := f0;
    to     := f34;
    guard  := G1 > 0 && 4 >= J1;
    action := Y' = F1, Z' = 5, A1' = G1, B1' = G1, C1' = H1, C' = H1, D1' = I1, V' = I1, E1' = J1, B' = K1, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t40 := {
    from   := f0;
    to     := f34;
    guard  := H1 > 0 && 20 >= G1 && G1 > 4;
    action := Y' = F1, Z' = G1, A1' = H1, B1' = H1, C1' = I1, C' = I1, D1' = J1, V' = J1, E1' = G1, B' = K1, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
  transition t41 := {
    from   := f0;
    to     := f34;
    guard  := G1 > 0 && J1 > 20;
    action := Y' = F1, Z' = 20, A1' = G1, B1' = G1, C1' = H1, C' = H1, D1' = I1, V' = I1, E1' = J1, B' = K1, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
