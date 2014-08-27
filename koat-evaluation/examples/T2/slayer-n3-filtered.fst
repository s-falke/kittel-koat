model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1, N1, O1, P1, Q1, R1, S1, T1;
  states f11, f15, f14, f13, f17, f7, f6;
  transition t0 := {
    from   := f11;
    to     := f15;
    guard  := A > 1 && B >= A && B >= 0 && K1 > 0 && C > 0 && D >= 0 && E = 1 + C;
    action := E' = 2 + C, F' = L1, G' = M1, H' = B, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?;
  };
  transition t1 := {
    from   := f11;
    to     := f14;
    guard  := A > 1 && B >= A && I >= A && B >= 0 && L1 > 0 && E > 0 && F = 0;
    action := F' = 0, D' = -1 + L1, G' = M1, J' = -1, I' = L1, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?;
  };
  transition t2 := {
    from   := f13;
    to     := f13;
    guard  := K1 > 0 && K > 0 && E = 1 + K && A = 1;
    action := E' = 2 + K, A' = 1, F' = L1, G' = M1, L' = M, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?;
  };
  transition t3 := {
    from   := f14;
    to     := f15;
    guard  := A > 1 && E > 0 && N > 0 && M1 >= 0 && D >= 0 && F = 0;
    action := E' = 2 + N, F' = L1, D' = M1, G' = K1, O' = 1 + N, P' = M1, N' = N1, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?;
  };
  transition t4 := {
    from   := f14;
    to     := f14;
    guard  := A > 1 && E > 0 && L1 >= 0 && D >= 0 && F = 0 && Q = R;
    action := F' = 0, D' = L1, G' = M1, S' = L1, R' = Q, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?;
  };
  transition t5 := {
    from   := f15;
    to     := f15;
    guard  := A > 1 && T > 0 && N1 > 0 && M1 >= 0 && D >= 0 && E = 1 + T;
    action := E' = 2 + T, F' = L1, D' = M1, G' = K1, U' = M1, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?;
  };
  transition t6 := {
    from   := f15;
    to     := f14;
    guard  := A > 1 && E > 0 && L1 >= 0 && D >= 0 && F = 0 && Q = V;
    action := F' = 0, D' = L1, G' = M1, W' = L1, V' = Q, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?;
  };
  transition t7 := {
    from   := f17;
    to     := f17;
    guard  := X >= B && X > M1 && M1 >= 0 && X > 1 && Y + 1 = B && A = X && Z = A1 && B1 = A1;
    action := B' = 1 + B, X' = A, Z' = C1, B1' = C1, C1' = L1, A1' = Z, Y' = -1 + B, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?;
  };
  transition t8 := {
    from   := f11;
    to     := f7;
    guard  := B >= A && B >= 0 && 0 >= E && A > 1;
    action := D1' = L1, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?;
  };
  transition t9 := {
    from   := f13;
    to     := f7;
    guard  := E > 0 && Q = 0 && A = 1 && F = 0;
    action := D1' = L1, Q' = 0, A' = 1, F' = 0, G' = M1, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?;
  };
  transition t10 := {
    from   := f13;
    to     := f7;
    guard  := 0 >= E && A = 1;
    action := D1' = L1, A' = 1, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?;
  };
  transition t11 := {
    from   := f14;
    to     := f7;
    guard  := E > 0 && A > 1 && Q = 0 && F = 0 && D = 0;
    action := D1' = L1, Q' = 0, F' = 0, D' = 0, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?;
  };
  transition t12 := {
    from   := f15;
    to     := f7;
    guard  := D >= 0 && 0 >= E && A > 1;
    action := D1' = L1, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?;
  };
  transition t13 := {
    from   := f6;
    to     := f7;
    guard  := 0 >= M1 && Q = 0 && E = 100 && B = 0 && A = X && Z = 0;
    action := D1' = L1, Q' = 0, E' = 100, A' = M1, B' = K1, G' = N1, X' = O1, Z' = P1, B1' = Q1, C1' = R1, A1' = S1, E1' = T1, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?;
  };
  transition t14 := {
    from   := f17;
    to     := f15;
    guard  := D >= 0 && B >= X && B >= 0 && K1 >= X && K1 >= 0 && X > 1 && E = 100 && A = X && Z = A1 && B1 = A1;
    action := D1' = L1, Q' = Z, E' = 102, F' = M1, B' = K1, F1' = 101, G1' = K1, G' = N1, X' = O1, Z' = P1, B1' = Q1, C1' = R1, A1' = S1, E1' = T1, H1' = B, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?;
  };
  transition t15 := {
    from   := f17;
    to     := f14;
    guard  := D >= 0 && B >= X && B >= 0 && M1 >= X && M1 >= 0 && X > 1 && I1 >= X && E = 100 && F = 0 && A = X && J1 = A1 && Z = A1 && B1 = A1;
    action := D1' = L1, Q' = J1, E' = 100, F' = 0, B' = M1, G' = K1, X' = N1, Z' = O1, B1' = P1, C1' = Q1, A1' = R1, E1' = S1, H1' = B, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?, R1' = ?, S1' = ?, T1' = ?;
  };
}
strategy dumb {
  Region init := { state = f6 };
}
