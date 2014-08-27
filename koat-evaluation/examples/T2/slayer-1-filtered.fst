model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1, N1, O1, P1, Q1, R1, S1, T1, U1, V1, W1, X1, Y1, Z1, A2, B2, C2, D2, E2;
  states f12, f16, f13, f1, f7, f8, f10, f9;
  transition t0 := {
    from   := f12;
    to     := f16;
    guard  := A >= 0 && M1 > 1 && N1 >= M1 && B = 1;
    action := C' = M1, D' = O1, E' = P1, F' = 1 + G, H' = Q1, I' = G, B' = 1, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?;
  };
  transition t1 := {
    from   := f13;
    to     := f16;
    guard  := M1 > 1 && I >= 0;
    action := C' = M1, D' = O1, J' = P1, K' = Q1, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?;
  };
  transition t2 := {
    from   := f16;
    to     := f16;
    guard  := B >= 0 && G >= 0 && M1 > 1;
    action := C' = M1, D' = O1, E' = P1, G' = -1 + G, B' = 1 + B, L' = M, N' = Q1, O' = 1 + B, P' = -1 + G, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?;
  };
  transition t3 := {
    from   := f1;
    to     := f1;
    guard  := Q > A && A >= 0;
    action := A' = 1 + A, R' = S, T' = S, S' = M1, U' = O1, V' = A, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?;
  };
  transition t4 := {
    from   := f1;
    to     := f16;
    guard  := A >= Q && A >= 0 && M1 > 1 && R1 >= M1 && G >= M1 && B = 0;
    action := C' = M1, M' = R, D' = R, A' = G, B' = 0, Q' = O1, R' = P1, W' = Q1, T' = N1, S' = S1, X' = T1, Y' = U1, Z' = R1, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?;
  };
  transition t5 := {
    from   := f7;
    to     := f8;
    guard  := M1 > 1 && A1 >= 0 && B1 = 0;
    action := C' = M1, C1' = O1, D1' = 0, E1' = O1, B1' = 0, M' = 0, D' = O1, F1' = G1, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?;
  };
  transition t6 := {
    from   := f7;
    to     := f10;
    guard  := M1 > 1 && A1 >= 0 && B1 = G1;
    action := C' = M1, C1' = O1, D1' = P1, E1' = Q1, B1' = N1, G1' = S1, D' = T1, Y' = U1, F1' = R1, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?;
  };
  transition t7 := {
    from   := f8;
    to     := f8;
    guard  := M1 > 1 && H1 >= 0 && B1 = 0;
    action := C' = M1, C1' = O1, D1' = 0, E1' = O1, B1' = 0, M' = 0, D' = O1, E' = P1, F1' = G1, H1' = -1 + H1, I1' = -1 + H1, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?;
  };
  transition t8 := {
    from   := f8;
    to     := f10;
    guard  := M1 > 1 && H1 >= 0 && B1 = G1;
    action := C' = M1, C1' = O1, D1' = P1, E1' = Q1, B1' = N1, G1' = S1, Y' = T1, F1' = U1, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?;
  };
  transition t9 := {
    from   := f13;
    to     := f8;
    guard  := O1 > 1 && M1 > 1 && M = 0 && I = 0 && B = 1;
    action := C' = M1, C1' = D, D1' = 0, E1' = D, B1' = 0, G1' = D, M' = 0, I' = 0, B' = H1 + 1, F1' = D, A1' = H1, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?;
  };
  transition t10 := {
    from   := f16;
    to     := f8;
    guard  := O1 > 1 && M1 > 1 && B >= 0 && G >= 0 && M = 0;
    action := C' = M1, C1' = D, D1' = 0, E1' = D, B1' = 0, G1' = D, M' = 0, B' = H1 + 1, F1' = D, A1' = H1, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?;
  };
  transition t11 := {
    from   := f9;
    to     := f1;
    guard  := M1 > 1;
    action := C' = M1, A' = 2, J1' = O1, Q' = M1, R' = P1, W' = P1, T' = P1, S' = Q1, K1' = N1, L1' = 2, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?;
  };
  transition t12 := {
    from   := f9;
    to     := f10;
    guard  := 0 >= V1 && 0 >= W1 && 0 >= M1 && 0 >= X1;
    action := C' = M1, C1' = O1, D1' = P1, E1' = Q1, B1' = N1, G1' = S1, M' = 0, D' = 0, A' = T1, J1' = U1, Q' = R1, R' = Y1, W' = Z1, T' = A2, S' = B2, X' = C2, Y' = D2, F1' = E2, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?;
  };
  transition t13 := {
    from   := f9;
    to     := f10;
    guard  := S = 0;
    action := C' = 1, C1' = M1, D1' = O1, E1' = P1, B1' = Q1, G1' = N1, M' = 0, D' = S1, A' = T1, J1' = U1, Q' = R1, R' = Y1, W' = Z1, T' = A2, S' = B2, X' = C2, Y' = D2, F1' = E2, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?, X1' = ?, Y1' = ?, Z1' = ?, A2' = ?, B2' = ?, C2' = ?, D2' = ?, E2' = ?;
  };
}
strategy dumb {
  Region init := { state = f9 };
}
