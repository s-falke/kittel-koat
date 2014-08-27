model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1, N1;
  states f78, f80, f37, f41, f89, f48, f61, f66, f84, f77, f94, f96, f98, f0;
  transition t0 := {
    from   := f78;
    to     := f80;
    guard  := A = 0;
    action := A' = 0, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t1 := {
    from   := f37;
    to     := f41;
    guard  := 0 > B;
    action := C' = B, D' = H1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t2 := {
    from   := f37;
    to     := f41;
    guard  := B > 0;
    action := C' = B, D' = H1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t3 := {
    from   := f89;
    to     := f48;
    guard  := E > 0;
    action := F' = H1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t4 := {
    from   := f61;
    to     := f66;
    guard  := 0 > G;
    action := H' = G, I' = 0, J' = H1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t5 := {
    from   := f61;
    to     := f66;
    guard  := G > 0;
    action := H' = G, I' = 0, J' = H1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t6 := {
    from   := f80;
    to     := f84;
    guard  := 0 > I;
    action := H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t7 := {
    from   := f80;
    to     := f84;
    guard  := I > 0;
    action := H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t8 := {
    from   := f77;
    to     := f78;
    guard  := 0 > K;
    action := H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t9 := {
    from   := f77;
    to     := f78;
    guard  := K > 0;
    action := H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t10 := {
    from   := f77;
    to     := f80;
    guard  := K = 0;
    action := K' = 0, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t11 := {
    from   := f78;
    to     := f80;
    guard  := 0 > A;
    action := I' = 1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t12 := {
    from   := f78;
    to     := f80;
    guard  := A > 0;
    action := I' = 1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t13 := {
    from   := f61;
    to     := f89;
    guard  := G = 0;
    action := E' = E - 1, G' = 0, H' = 0, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t14 := {
    from   := f84;
    to     := f89;
    guard  := I = 0;
    action := E' = E - 1, I' = 0, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t15 := {
    from   := f94;
    to     := f94;
    guard  := true;
    action := H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t16 := {
    from   := f37;
    to     := f94;
    guard  := B = 0;
    action := L' = 1, B' = 0, C' = 0, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t17 := {
    from   := f41;
    to     := f94;
    guard  := D = 0;
    action := L' = 1, D' = 0, M' = 0, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t18 := {
    from   := f96;
    to     := f98;
    guard  := true;
    action := H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t19 := {
    from   := f89;
    to     := f94;
    guard  := 0 >= E;
    action := L' = 1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t20 := {
    from   := f84;
    to     := f89;
    guard  := 0 > I;
    action := E' = E - 1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t21 := {
    from   := f84;
    to     := f89;
    guard  := I > 0;
    action := E' = E - 1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t22 := {
    from   := f80;
    to     := f84;
    guard  := I = 0;
    action := I' = 0, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t23 := {
    from   := f66;
    to     := f84;
    guard  := 0 > H1;
    action := N' = J, O' = H1, P' = H1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t24 := {
    from   := f66;
    to     := f84;
    guard  := H1 > 0;
    action := N' = J, O' = H1, P' = H1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t25 := {
    from   := f66;
    to     := f80;
    guard  := true;
    action := N' = J, O' = 0, P' = 0, Q' = 0, R' = 0, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t26 := {
    from   := f66;
    to     := f77;
    guard  := 0 > H1;
    action := N' = J, O' = 0, P' = 0, Q' = H1, R' = H1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t27 := {
    from   := f66;
    to     := f77;
    guard  := H1 > 0;
    action := N' = J, O' = 0, P' = 0, Q' = H1, R' = H1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t28 := {
    from   := f48;
    to     := f89;
    guard  := F >= 0;
    action := E' = E - 1, S' = F, T' = 0, U' = 0, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t29 := {
    from   := f48;
    to     := f89;
    guard  := 0 > 1 + F;
    action := E' = E - 1, S' = F, T' = 0, U' = 0, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t30 := {
    from   := f48;
    to     := f94;
    guard  := 0 > H1;
    action := L' = 1, S' = F, T' = H1, U' = H1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t31 := {
    from   := f48;
    to     := f94;
    guard  := H1 > 0;
    action := L' = 1, S' = F, T' = H1, U' = H1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t32 := {
    from   := f48;
    to     := f61;
    guard  := 0 > H1 && F + 1 = 0;
    action := F' = -1, S' = -1, T' = 0, U' = 0, V' = H1, W' = H1, G' = I1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t33 := {
    from   := f48;
    to     := f61;
    guard  := H1 > 0 && F + 1 = 0;
    action := F' = -1, S' = -1, T' = 0, U' = 0, V' = H1, W' = H1, G' = I1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t34 := {
    from   := f48;
    to     := f89;
    guard  := F + 1 = 0;
    action := E' = E - 1, F' = -1, S' = -1, T' = 0, U' = 0, V' = 0, W' = 0, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t35 := {
    from   := f41;
    to     := f48;
    guard  := 0 > D;
    action := E' = H1, M' = D, X' = H1, F' = I1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t36 := {
    from   := f41;
    to     := f48;
    guard  := D > 0;
    action := E' = H1, M' = D, X' = H1, F' = I1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t37 := {
    from   := f0;
    to     := f94;
    guard  := 0 >= I1;
    action := Y' = H1, Z' = H1, A1' = I1, B1' = I1, C1' = J1, L' = 1, D1' = K1, E1' = K1, F1' = L1, E' = L1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t38 := {
    from   := f0;
    to     := f37;
    guard  := I1 > 0 && 4 >= M1;
    action := Y' = H1, Z' = 5, A1' = I1, B1' = I1, C1' = J1, L' = J1, D1' = K1, E1' = K1, F1' = L1, E' = L1, G1' = M1, B' = N1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t39 := {
    from   := f0;
    to     := f37;
    guard  := J1 > 0 && 20 >= I1 && I1 > 4;
    action := Y' = H1, Z' = I1, A1' = J1, B1' = J1, C1' = K1, L' = K1, D1' = L1, E1' = L1, F1' = M1, E' = M1, G1' = I1, B' = N1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
  transition t40 := {
    from   := f0;
    to     := f37;
    guard  := I1 > 0 && M1 > 20;
    action := Y' = H1, Z' = 20, A1' = I1, B1' = I1, C1' = J1, L' = J1, D1' = K1, E1' = K1, F1' = L1, E' = L1, G1' = M1, B' = N1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
