model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1, N1, O1, P1, Q1, R1, S1, T1, U1, V1, W1;
  states f30, f1, f2, f3, f4, f5, f16, f25, f17, f18, f12, f22, f21, f23;
  transition t0 := {
    from   := f30;
    to     := f1;
    guard  := true;
    action := K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?;
  };
  transition t1 := {
    from   := f1;
    to     := f2;
    guard  := true;
    action := A' = K1, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?;
  };
  transition t2 := {
    from   := f2;
    to     := f3;
    guard  := true;
    action := B' = 0, C' = 0, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?;
  };
  transition t3 := {
    from   := f3;
    to     := f3;
    guard  := A > B;
    action := B' = B + 1, C' = C + 1, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?;
  };
  transition t4 := {
    from   := f3;
    to     := f4;
    guard  := B >= A;
    action := K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?;
  };
  transition t5 := {
    from   := f4;
    to     := f5;
    guard  := true;
    action := D' = 0, E' = C, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?;
  };
  transition t6 := {
    from   := f5;
    to     := f5;
    guard  := E > 0;
    action := D' = D + 1, E' = E - 1, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?;
  };
  transition t7 := {
    from   := f1;
    to     := f5;
    guard  := true;
    action := F' = K1, G' = L1, H' = M1, I' = N1, J' = O1, K' = P1, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?;
  };
  transition t8 := {
    from   := f16;
    to     := f1;
    guard  := I >= H && F >= 0;
    action := F' = K1, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?;
  };
  transition t9 := {
    from   := f5;
    to     := f16;
    guard  := 0 >= E && F >= 0;
    action := F' = 1 + F, L' = M, I' = 1 + I, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?;
  };
  transition t10 := {
    from   := f3;
    to     := f2;
    guard  := L1 > 0 && F > 0 && N = 0;
    action := F' = K1, M' = O, P' = 0, Q' = 0, N' = O, R' = O, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?;
  };
  transition t11 := {
    from   := f3;
    to     := f25;
    guard  := F > 0 && N > 0 && K1 > 0;
    action := F' = K1, P' = N, Q' = 0, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?;
  };
  transition t12 := {
    from   := f3;
    to     := f25;
    guard  := F > 0 && 0 > N && K1 > 0;
    action := F' = K1, P' = N, Q' = 0, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?;
  };
  transition t13 := {
    from   := f4;
    to     := f17;
    guard  := J > 0;
    action := S' = J, T' = 0, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?;
  };
  transition t14 := {
    from   := f4;
    to     := f17;
    guard  := 0 > J;
    action := S' = J, T' = 0, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?;
  };
  transition t15 := {
    from   := f5;
    to     := f18;
    guard  := K1 >= 0 && F >= 0 && J = 0;
    action := F' = K1, S' = 0, T' = 0, J' = 0, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?;
  };
  transition t16 := {
    from   := f12;
    to     := f16;
    guard  := true;
    action := F' = I, L' = M, I' = 1 + I, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?;
  };
  transition t17 := {
    from   := f2;
    to     := f22;
    guard  := true;
    action := T' = M, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?;
  };
  transition t18 := {
    from   := f4;
    to     := f21;
    guard  := J = 0;
    action := M' = K1, S' = 0, T' = 0, U' = 0, J' = 0, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?;
  };
  transition t19 := {
    from   := f5;
    to     := f3;
    guard  := F >= 0 && J > 0 && Q1 >= 0;
    action := F' = K1, S' = L1, T' = 0, L' = M1, G' = N1, H' = O1, I' = P1, N' = R1, V' = J, W' = S1, O' = T1, J' = U1, X' = V1, Y' = W1, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?;
  };
  transition t20 := {
    from   := f5;
    to     := f3;
    guard  := F >= 0 && 0 > J && Q1 >= 0;
    action := F' = K1, S' = L1, T' = 0, L' = M1, G' = N1, H' = O1, I' = P1, N' = R1, V' = J, W' = S1, O' = T1, J' = U1, X' = V1, Y' = W1, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?;
  };
  transition t21 := {
    from   := f23;
    to     := f4;
    guard  := 0 >= P1;
    action := L' = 0, G' = K1, H' = L1, I' = M1, J' = N1, Z' = O1, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?;
  };
  transition t22 := {
    from   := f16;
    to     := f16;
    guard  := F >= 0 && V1 >= 0 && H > I && K1 >= 0;
    action := F' = 1 + K1, A1' = L1, B1' = L1, C1' = L1, M' = L1, L' = L1, G' = M1, H' = N1, I' = 1 + O1, D1' = P1, E1' = R1, F1' = S1, G1' = T1, H1' = U1, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?;
  };
  transition t23 := {
    from   := f23;
    to     := f16;
    guard  := U1 > 0;
    action := F' = K1, A1' = L1, B1' = L1, C1' = L1, M' = L1, L' = L1, G' = M1, H' = N1, I' = 1 + K1, D1' = O1, E1' = P1, F1' = R1, I1' = S1, J1' = T1, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?, W1' = ?;
  };
}
strategy dumb {
  Region init := { state = f30 };
}
