model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1, N1, O1, P1, Q1, R1, S1, T1, U1, V1, W1, X1, Y1, Z1, A2, B2, C2, D2, E2;
  states f11, f2, f5, f0, f1;
  transition t0 := {
    from   := f11;
    to     := f11;
    guard  := A > B && B >= 0;
    action := C' = D, B' = 1 + B, E' = D, D' = I1, F' = J1, G' = B, H' = I, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?;
  };
  transition t1 := {
    from   := f2;
    to     := f2;
    guard  := 0 > J && I1 > 1;
    action := K' = I1, L' = J1, M' = J, N' = J1, O' = J, P' = Q, R' = I, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?;
  };
  transition t2 := {
    from   := f2;
    to     := f2;
    guard  := J > 0 && I1 > 1;
    action := K' = I1, L' = J1, M' = J, N' = J1, O' = J, P' = Q, R' = I, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?;
  };
  transition t3 := {
    from   := f5;
    to     := f5;
    guard  := 0 > J;
    action := K' = 1, L' = I1, M' = J, N' = I1, O' = J, S' = I, T' = U, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?;
  };
  transition t4 := {
    from   := f5;
    to     := f5;
    guard  := J > 0;
    action := K' = 1, L' = I1, M' = J, N' = I1, O' = J, S' = I, T' = U, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?;
  };
  transition t5 := {
    from   := f0;
    to     := f11;
    guard  := J1 > 1;
    action := V' = I1, K' = J1, A' = J1, C' = K1, B' = 2, W' = K1, E' = K1, D' = L1, X' = M1, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?;
  };
  transition t6 := {
    from   := f0;
    to     := f1;
    guard  := 0 >= N1 && 0 >= J1 && 0 >= O1 && Y = 0;
    action := V' = I1, K' = J1, A' = K1, C' = L1, B' = M1, J' = P1, Z' = Q1, A1' = R1, W' = S1, E' = T1, D' = U1, L' = V1, M' = W1, O' = X1, B1' = Y1, C1' = Z1, D1' = A2, E1' = B2, F1' = C2, Y' = D2, G1' = E2, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?;
  };
  transition t7 := {
    from   := f0;
    to     := f5;
    guard  := 0 > J;
    action := V' = I1, K' = 1, A' = J1, C' = K1, B' = L1, Z' = M1, A1' = P1, W' = Q1, E' = R1, D' = S1, L' = T1, M' = J, N' = T1, O' = J, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?;
  };
  transition t8 := {
    from   := f0;
    to     := f5;
    guard  := J > 0;
    action := V' = I1, K' = 1, A' = J1, C' = K1, B' = L1, Z' = M1, A1' = P1, W' = Q1, E' = R1, D' = S1, L' = T1, M' = J, N' = T1, O' = J, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?;
  };
  transition t9 := {
    from   := f11;
    to     := f2;
    guard  := U1 > 1 && H1 >= U1 && V1 > 1 && H1 >= V1 && B >= A && B >= 0 && I1 > 1 && 0 > J && H1 >= 0;
    action := K' = I1, A' = J1, C' = K1, B' = L1, Z' = M1, A1' = P1, W' = Q1, E' = R1, D' = S1, L' = T1, M' = J, N' = T1, O' = J, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?;
  };
  transition t10 := {
    from   := f11;
    to     := f2;
    guard  := U1 > 1 && H1 >= U1 && V1 > 1 && H1 >= V1 && B >= A && B >= 0 && I1 > 1 && J > 0 && H1 >= 0;
    action := K' = I1, A' = J1, C' = K1, B' = L1, Z' = M1, A1' = P1, W' = Q1, E' = R1, D' = S1, L' = T1, M' = J, N' = T1, O' = J, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
