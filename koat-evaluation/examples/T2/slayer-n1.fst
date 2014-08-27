model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1, N1, O1, P1, Q1, R1, S1, T1, U1;
  states f12, f1, f8, f9;
  transition t0 := {
    from   := f12;
    to     := f12;
    guard  := A >= 0 && C1 > 1 && 0 > D1 && 0 > E1 && 0 > B;
    action := C' = C1, D' = E1, E' = B, F' = G, H' = A, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?;
  };
  transition t1 := {
    from   := f12;
    to     := f12;
    guard  := A >= 0 && C1 > 1 && 0 > D1 && 0 > E1 && B > 0;
    action := C' = C1, D' = E1, E' = B, F' = G, H' = A, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?;
  };
  transition t2 := {
    from   := f12;
    to     := f12;
    guard  := A >= 0 && C1 > 1 && 0 > D1 && E1 > 0 && 0 > B;
    action := C' = C1, D' = E1, E' = B, F' = G, H' = A, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?;
  };
  transition t3 := {
    from   := f12;
    to     := f12;
    guard  := A >= 0 && C1 > 1 && 0 > D1 && E1 > 0 && B > 0;
    action := C' = C1, D' = E1, E' = B, F' = G, H' = A, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?;
  };
  transition t4 := {
    from   := f12;
    to     := f12;
    guard  := A >= 0 && C1 > 1 && D1 > 0 && 0 > E1 && 0 > B;
    action := C' = C1, D' = E1, E' = B, F' = G, H' = A, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?;
  };
  transition t5 := {
    from   := f12;
    to     := f12;
    guard  := A >= 0 && C1 > 1 && D1 > 0 && 0 > E1 && B > 0;
    action := C' = C1, D' = E1, E' = B, F' = G, H' = A, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?;
  };
  transition t6 := {
    from   := f12;
    to     := f12;
    guard  := A >= 0 && C1 > 1 && D1 > 0 && E1 > 0 && 0 > B;
    action := C' = C1, D' = E1, E' = B, F' = G, H' = A, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?;
  };
  transition t7 := {
    from   := f12;
    to     := f12;
    guard  := A >= 0 && C1 > 1 && D1 > 0 && E1 > 0 && B > 0;
    action := C' = C1, D' = E1, E' = B, F' = G, H' = A, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?;
  };
  transition t8 := {
    from   := f1;
    to     := f1;
    guard  := I > J && J >= 0;
    action := J' = 1 + J, K' = L, M' = L, L' = C1, N' = E1, O' = J, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?;
  };
  transition t9 := {
    from   := f8;
    to     := f1;
    guard  := C1 > 1;
    action := C' = C1, J' = 2, P' = E1, I' = C1, K' = D1, Q' = D1, M' = D1, L' = F1, R' = G1, S' = 2, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?;
  };
  transition t10 := {
    from   := f8;
    to     := f9;
    guard  := 0 >= H1 && 0 >= I1 && 0 >= C1 && 0 >= J1;
    action := C' = C1, T' = E1, U' = D1, V' = F1, W' = G1, X' = K1, B' = 0, D' = 0, J' = L1, P' = M1, I' = N1, K' = O1, Q' = P1, M' = Q1, L' = R1, Y' = S1, Z' = T1, A1' = U1, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?;
  };
  transition t11 := {
    from   := f1;
    to     := f12;
    guard  := J >= I && J >= 0 && Q1 > 1 && F1 >= Q1 && F1 >= 0 && D1 >= C1 && C1 > 1 && 0 > K && 0 > E1;
    action := C' = C1, B' = K, D' = E1, B1' = D1, J' = F1, I' = G1, K' = K1, Q' = L1, M' = M1, L' = N1, Y' = O1, Z' = P1, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?;
  };
  transition t12 := {
    from   := f1;
    to     := f12;
    guard  := J >= I && J >= 0 && Q1 > 1 && F1 >= Q1 && F1 >= 0 && D1 >= C1 && C1 > 1 && 0 > K && E1 > 0;
    action := C' = C1, B' = K, D' = E1, B1' = D1, J' = F1, I' = G1, K' = K1, Q' = L1, M' = M1, L' = N1, Y' = O1, Z' = P1, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?;
  };
  transition t13 := {
    from   := f1;
    to     := f12;
    guard  := J >= I && J >= 0 && Q1 > 1 && F1 >= Q1 && F1 >= 0 && D1 >= C1 && C1 > 1 && K > 0 && 0 > E1;
    action := C' = C1, B' = K, D' = E1, B1' = D1, J' = F1, I' = G1, K' = K1, Q' = L1, M' = M1, L' = N1, Y' = O1, Z' = P1, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?;
  };
  transition t14 := {
    from   := f1;
    to     := f12;
    guard  := J >= I && J >= 0 && Q1 > 1 && F1 >= Q1 && F1 >= 0 && D1 >= C1 && C1 > 1 && K > 0 && E1 > 0;
    action := C' = C1, B' = K, D' = E1, B1' = D1, J' = F1, I' = G1, K' = K1, Q' = L1, M' = M1, L' = N1, Y' = O1, Z' = P1, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?;
  };
}
strategy dumb {
  Region init := { state = f8 };
}
