model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1, N1, O1, P1, Q1, R1, S1, T1, U1, V1;
  states f33, f3, f25, f16, f22, f23, f17, f21, f18;
  transition t0 := {
    from   := f33;
    to     := f3;
    guard  := true;
    action := G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t1 := {
    from   := f3;
    to     := f25;
    guard  := A > 0 && B > 0 && G1 > 0;
    action := A' = G1, C' = B, D' = 0, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t2 := {
    from   := f3;
    to     := f25;
    guard  := A > 0 && 0 > B && G1 > 0;
    action := A' = G1, C' = B, D' = 0, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t3 := {
    from   := f3;
    to     := f16;
    guard  := true;
    action := E' = G1, F' = H1, G' = H1, H' = H1, I' = H1, A' = J, K' = H1, J' = 1 + J, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t4 := {
    from   := f3;
    to     := f16;
    guard  := H1 >= 0 && A >= 0;
    action := F' = G1, G' = G1, H' = G1, I' = G1, A' = 1 + H1, K' = G1, J' = 1 + J, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t5 := {
    from   := f3;
    to     := f22;
    guard  := H1 > 0 && A > 0 && B = 0;
    action := I' = L, A' = G1, C' = 0, D' = 0, M' = L, B' = L, N' = L, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t6 := {
    from   := f23;
    to     := f17;
    guard  := G1 > 0 && 0 >= I1;
    action := O' = G1, M' = 0, K' = 0, P' = H1, Q' = J1, J' = K1, R' = G1, S' = L1, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t7 := {
    from   := f23;
    to     := f17;
    guard  := 0 > G1 && 0 >= I1;
    action := O' = G1, M' = 0, K' = 0, P' = H1, Q' = J1, J' = K1, R' = G1, S' = L1, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t8 := {
    from   := f23;
    to     := f21;
    guard  := 0 >= I1;
    action := I' = G1, O' = 0, M' = 0, K' = 0, P' = H1, Q' = J1, J' = K1, T' = 0, R' = 0, S' = L1, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t9 := {
    from   := f16;
    to     := f16;
    guard  := A >= 0 && M1 >= 0 && Q > J && H1 >= 0;
    action := F' = G1, G' = G1, H' = G1, I' = G1, A' = 1 + H1, K' = G1, P' = J1, Q' = K1, J' = 1 + L1, U' = I1, V' = N1, W' = O1, X' = P1, Y' = Q1, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t10 := {
    from   := f16;
    to     := f18;
    guard  := A >= 0 && I1 >= 0 && J >= Q && G1 >= 0;
    action := A' = G1, O' = 0, M' = 0, P' = H1, Q' = J1, J' = K1, R' = 0, Z' = L1, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t11 := {
    from   := f16;
    to     := f3;
    guard  := A >= 0 && R1 >= 0 && S1 >= 0 && J >= Q && O1 > 0;
    action := A' = G1, O' = H1, M' = 0, K' = J1, P' = K1, Q' = L1, J' = I1, B' = N1, A1' = O1, B1' = P1, L' = Q1, R' = M1, C1' = T1, D1' = U1, Z' = V1, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t12 := {
    from   := f16;
    to     := f3;
    guard  := A >= 0 && R1 >= 0 && S1 >= 0 && J >= Q && 0 > O1;
    action := A' = G1, O' = H1, M' = 0, K' = J1, P' = K1, Q' = L1, J' = I1, B' = N1, A1' = O1, B1' = P1, L' = Q1, R' = M1, C1' = T1, D1' = U1, Z' = V1, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t13 := {
    from   := f23;
    to     := f16;
    guard  := Q1 > 0;
    action := F' = G1, G' = G1, H' = G1, I' = G1, A' = H1, K' = G1, P' = J1, Q' = K1, J' = 1 + H1, U' = L1, V' = I1, W' = N1, E1' = O1, F1' = P1, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
}
strategy dumb {
  Region init := { state = f33 };
}
