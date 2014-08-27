model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1, N1, O1, P1, Q1, R1;
  states f2, f10, f19, f23, f26, f41, f53, f63, f66, f69, f1, start;
  transition t0 := {
    from   := f2;
    to     := f2;
    guard  := A >= B;
    action := B' = B + 1, C' = C*B1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?;
  };
  transition t1 := {
    from   := f10;
    to     := f19;
    guard  := D >= 2*C1 && 3*C1 > D && C1 >= D1 && D >= 2*E1 && 3*E1 > D && D1 >= E1 && D*B1 >= 2*B1*F1 && 2*B1*F1 + F1 > D*B1 && F1 >= G1 && D*B1 >= 2*B1*H1 && 2*B1*H1 + H1 > D*B1 && G1 >= H1 && C >= D*B1*I1 && D*B1*I1 + I1 > C && C >= D*B1*J1 && D*B1*J1 + J1 > C && D*B1*I1 >= 2*B1*J1*K1 && 2*B1*J1*K1 + K1 > D*B1*I1 && K1 >= L1 && C >= D*B1*M1 && D*B1*M1 + M1 > C && C >= D*B1*N1 && D*B1*N1 + N1 > C && D*B1*M1 >= 2*B1*N1*O1 && 2*B1*N1*O1 + O1 > D*B1*M1 && L1 >= O1 && B > 0 && C >= D*B1*P1 && D*B1*P1 + P1 > C && P1 >= Q1 && C >= D*B1*R1 && D*B1*R1 + R1 > C && Q1 >= R1;
    action := E' = B1, F' = Q1, G' = D1, H' = G1, I' = L1, J' = 1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?;
  };
  transition t2 := {
    from   := f19;
    to     := f23;
    guard  := H >= K && J > K;
    action := B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?;
  };
  transition t3 := {
    from   := f23;
    to     := f26;
    guard  := K + G > 1 + L;
    action := B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?;
  };
  transition t4 := {
    from   := f26;
    to     := f26;
    guard  := I >= M;
    action := M' = M + H, N' = J + M - K, O' = B1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?;
  };
  transition t5 := {
    from   := f19;
    to     := f41;
    guard  := K >= J && H >= 2*Q1 && 3*Q1 > H && Q1 >= B1 && H >= 2*D1 && 3*D1 > H && B1 >= D1 && H >= K;
    action := P' = B1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?;
  };
  transition t6 := {
    from   := f41;
    to     := f41;
    guard  := J > P && P >= 2*Q1 && 3*Q1 > P && Q1 >= B1 && P >= 2*D1 && 3*D1 > P && B1 >= D1 && P >= G;
    action := J' = J - P, P' = B1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?;
  };
  transition t7 := {
    from   := f53;
    to     := f63;
    guard  := H > Q;
    action := R' = 2*Q, S' = B1, T' = Q1, U' = D1, V' = G1, W' = 1, X' = 0, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?;
  };
  transition t8 := {
    from   := f63;
    to     := f66;
    guard  := Q >= M;
    action := B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?;
  };
  transition t9 := {
    from   := f66;
    to     := f69;
    guard  := M + G > 1 + L;
    action := B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?;
  };
  transition t10 := {
    from   := f69;
    to     := f69;
    guard  := I >= K;
    action := K' = K + R, O' = W*B1 - X*Q1, Y' = K, Z' = K + Q, A1' = W*D1 + X*G1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?;
  };
  transition t11 := {
    from   := f69;
    to     := f66;
    guard  := K > I;
    action := L' = L + 2, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?;
  };
  transition t12 := {
    from   := f66;
    to     := f63;
    guard  := L + 1 >= M + G;
    action := M' = M + G, T' = W, W' = U*W - V*X + W, X' = U*X + V*W + X, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?;
  };
  transition t13 := {
    from   := f63;
    to     := f53;
    guard  := M > Q;
    action := Q' = R, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?;
  };
  transition t14 := {
    from   := f53;
    to     := f10;
    guard  := Q >= H;
    action := B' = B - 1, D' = D*E, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?;
  };
  transition t15 := {
    from   := f41;
    to     := f19;
    guard  := P >= G && P >= J;
    action := J' = J + P, K' = K + G, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?;
  };
  transition t16 := {
    from   := f41;
    to     := f19;
    guard  := G > P;
    action := J' = J + P, K' = K + G, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?;
  };
  transition t17 := {
    from   := f26;
    to     := f23;
    guard  := M > I;
    action := L' = L + 2, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?;
  };
  transition t18 := {
    from   := f23;
    to     := f41;
    guard  := L + 1 >= K + G && H >= 2*Q1 && 3*Q1 > H && Q1 >= B1 && H >= 2*D1 && 3*D1 > H && B1 >= D1;
    action := P' = B1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?;
  };
  transition t19 := {
    from   := f19;
    to     := f53;
    guard  := K > H;
    action := Q' = G, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?;
  };
  transition t20 := {
    from   := f10;
    to     := f1;
    guard  := 0 >= B;
    action := B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?;
  };
  transition t21 := {
    from   := f2;
    to     := f10;
    guard  := B > A;
    action := D' = 1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?;
  };
  transition t22 := {
    from   := start;
    to     := f2;
    guard  := true;
    action := B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?;
  };
}
strategy dumb {
  Region init := { state = start };
}
