model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1, N1, O1, P1, Q1, R1, S1, T1, U1, V1, W1, X1;
  states f1, f9, f10, f4, f3;
  transition t0 := {
    from   := f1;
    to     := f1;
    guard  := A > B && B >= 0;
    action := C' = D, B' = 1 + B, E' = D, D' = G1, F' = H1, G' = B, H' = I, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t1 := {
    from   := f9;
    to     := f10;
    guard  := I1 > J && K >= 0 && H1 > I1 && G1 > 1;
    action := L' = M, N' = M, O' = G1, P' = H1, Q' = H1, R' = J, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t2 := {
    from   := f9;
    to     := f10;
    guard  := I1 > J && K >= 0 && I1 > H1 && G1 > 1;
    action := L' = M, N' = M, O' = G1, P' = H1, Q' = H1, R' = J, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t3 := {
    from   := f9;
    to     := f10;
    guard  := J > I1 && K >= 0 && H1 > I1 && G1 > 1;
    action := L' = M, N' = M, O' = G1, P' = H1, Q' = H1, R' = J, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t4 := {
    from   := f9;
    to     := f10;
    guard  := J > I1 && K >= 0 && I1 > H1 && G1 > 1;
    action := L' = M, N' = M, O' = G1, P' = H1, Q' = H1, R' = J, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t5 := {
    from   := f9;
    to     := f4;
    guard  := K >= 0 && G1 > J1 && H1 > 1 && M = J;
    action := L' = G1, O' = H1, S' = I1, P' = J1, Q' = K1, M' = L1, J' = M1, R' = N1, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t6 := {
    from   := f9;
    to     := f4;
    guard  := K >= 0 && J1 > G1 && H1 > 1 && M = J;
    action := L' = G1, O' = H1, S' = I1, P' = J1, Q' = K1, M' = L1, J' = M1, R' = N1, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t7 := {
    from   := f10;
    to     := f10;
    guard  := J1 > J && T >= 0 && H1 > J1 && G1 > 1;
    action := L' = M, N' = M, O' = G1, P' = H1, Q' = H1, R' = J, T' = -1 + T, U' = I1, V' = I, W' = -1 + T, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t8 := {
    from   := f10;
    to     := f10;
    guard  := J1 > J && T >= 0 && J1 > H1 && G1 > 1;
    action := L' = M, N' = M, O' = G1, P' = H1, Q' = H1, R' = J, T' = -1 + T, U' = I1, V' = I, W' = -1 + T, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t9 := {
    from   := f10;
    to     := f10;
    guard  := J > J1 && T >= 0 && H1 > J1 && G1 > 1;
    action := L' = M, N' = M, O' = G1, P' = H1, Q' = H1, R' = J, T' = -1 + T, U' = I1, V' = I, W' = -1 + T, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t10 := {
    from   := f10;
    to     := f10;
    guard  := J > J1 && T >= 0 && J1 > H1 && G1 > 1;
    action := L' = M, N' = M, O' = G1, P' = H1, Q' = H1, R' = J, T' = -1 + T, U' = I1, V' = I, W' = -1 + T, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t11 := {
    from   := f10;
    to     := f4;
    guard  := G1 > 1 && T >= 0 && M = J;
    action := O' = G1, S' = H1, Q' = I1, M' = J1, J' = K1, R' = L1, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t12 := {
    from   := f3;
    to     := f4;
    guard  := 0 >= O1 && 0 >= I1 && 0 >= P1;
    action := L' = X, N' = X, X' = G1, Y' = H1, O' = I1, A' = J1, Z' = K1, C' = L1, B' = M1, A1' = N1, S' = Q1, B1' = R1, E' = S1, D' = T1, P' = X, Q' = U1, M' = V1, J' = W1, R' = X1, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t13 := {
    from   := f3;
    to     := f1;
    guard  := J1 > 1;
    action := L' = G1, N' = G1, X' = H1, Y' = I1, O' = J1, A' = J1, Z' = G1, C' = K1, B' = 2, B1' = K1, E' = K1, D' = L1, C1' = M1, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t14 := {
    from   := f1;
    to     := f10;
    guard  := B >= A && B >= 0 && T1 >= G1 && U1 > 1 && K1 >= U1 && C > N && K1 >= 0 && G1 > 1 && N > C;
    action := L' = N, O' = G1, A' = H1, Z' = I1, C' = J1, B' = K1, A1' = L1, S' = M1, B1' = N1, E' = Q1, D' = R1, P' = C, Q' = C, M' = N, J' = C, D1' = T + 1, E1' = I, F1' = S1, R' = C, K' = T, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t15 := {
    from   := f1;
    to     := f10;
    guard  := B >= A && B >= 0 && T1 >= G1 && U1 > 1 && K1 >= U1 && C > N && K1 >= 0 && G1 > 1;
    action := L' = N, O' = G1, A' = H1, Z' = I1, C' = J1, B' = K1, A1' = L1, S' = M1, B1' = N1, E' = Q1, D' = R1, P' = C, Q' = C, M' = N, J' = C, D1' = T + 1, E1' = I, F1' = S1, R' = C, K' = T, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t16 := {
    from   := f1;
    to     := f10;
    guard  := B >= A && B >= 0 && T1 >= G1 && U1 > 1 && K1 >= U1 && N > C && K1 >= 0 && G1 > 1;
    action := L' = N, O' = G1, A' = H1, Z' = I1, C' = J1, B' = K1, A1' = L1, S' = M1, B1' = N1, E' = Q1, D' = R1, P' = C, Q' = C, M' = N, J' = C, D1' = T + 1, E1' = I, F1' = S1, R' = C, K' = T, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t17 := {
    from   := f1;
    to     := f10;
    guard  := B >= A && B >= 0 && T1 >= G1 && U1 > 1 && K1 >= U1 && N > C && K1 >= 0 && G1 > 1 && C > N;
    action := L' = N, O' = G1, A' = H1, Z' = I1, C' = J1, B' = K1, A1' = L1, S' = M1, B1' = N1, E' = Q1, D' = R1, P' = C, Q' = C, M' = N, J' = C, D1' = T + 1, E1' = I, F1' = S1, R' = C, K' = T, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t18 := {
    from   := f3;
    to     := f4;
    guard  := 0 > 0 && G1 > U1;
    action := L' = G1, N' = D, X' = H1, Y' = I1, O' = 1, A' = J1, Z' = K1, C' = L1, B' = M1, A1' = N1, S' = Q1, B1' = R1, E' = S1, D' = T1, P' = U1, Q' = V1, M' = W1, J' = X1, R' = O1, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t19 := {
    from   := f3;
    to     := f4;
    guard  := 0 > 0 && U1 > G1;
    action := L' = G1, N' = D, X' = H1, Y' = I1, O' = 1, A' = J1, Z' = K1, C' = L1, B' = M1, A1' = N1, S' = Q1, B1' = R1, E' = S1, D' = T1, P' = U1, Q' = V1, M' = W1, J' = X1, R' = O1, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t20 := {
    from   := f3;
    to     := f4;
    guard  := 0 > 0 && G1 > U1;
    action := L' = G1, N' = D, X' = H1, Y' = I1, O' = 1, A' = J1, Z' = K1, C' = L1, B' = M1, A1' = N1, S' = Q1, B1' = R1, E' = S1, D' = T1, P' = U1, Q' = V1, M' = W1, J' = X1, R' = O1, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
  transition t21 := {
    from   := f3;
    to     := f4;
    guard  := 0 > 0 && U1 > G1;
    action := L' = G1, N' = D, X' = H1, Y' = I1, O' = 1, A' = J1, Z' = K1, C' = L1, B' = M1, A1' = N1, S' = Q1, B1' = R1, E' = S1, D' = T1, P' = U1, Q' = V1, M' = W1, J' = X1, R' = O1, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?;
  };
}
strategy dumb {
  Region init := { state = f3 };
}
