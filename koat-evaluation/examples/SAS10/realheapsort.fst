model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U;
  states start, stop, lbl71, lbl271, lbl133, lbl281, lbl101, lbl43, lbl121, lbl123, lbl111, start0;
  transition t0 := {
    from   := start;
    to     := stop;
    guard  := 2 >= A && B = C && D = E && F = G && H = I && J = K && L = M && N = O && P = Q && R = S && T = A;
    action := U' = ?;
  };
  transition t1 := {
    from   := start;
    to     := lbl71;
    guard  := A > 2 && B = C && D = E && F = G && H = I && J = K && L = M && N = O && P = Q && R = S && T = A;
    action := R' = 1, P' = 1, J' = U, U' = ?;
  };
  transition t2 := {
    from   := lbl271;
    to     := lbl133;
    guard  := 2*N + P + 2 >= A && P >= 0 && N > 0 && A >= 2*N + P && A > N + P + 1 && B > 2*J && B + 1 >= A && R = N && T = A;
    action := P' = 1 + P, L' = P, U' = ?;
  };
  transition t3 := {
    from   := lbl271;
    to     := lbl281;
    guard  := A > 2*N + P + 2 && P >= 0 && N > 0 && A >= 2*N + P && A > N + P + 1 && B > 2*J && B + 1 >= A && R = N && T = A;
    action := R' = T, N' = 1 + 2*R, U' = ?;
  };
  transition t4 := {
    from   := lbl271;
    to     := lbl271;
    guard  := A > 2*N + P + 2 && P >= 0 && N > 0 && A >= 2*N + P && A > N + P + 1 && B > 2*J && B + 1 >= A && R = N && T = A;
    action := R' = 1 + 2*R, N' = 1 + 2*R, U' = ?;
  };
  transition t5 := {
    from   := lbl271;
    to     := lbl281;
    guard  := A > 2*N + P + 3 && P >= 0 && N > 0 && A >= 2*N + P && A > N + P + 1 && B > 2*J && B + 1 >= A && R = N && T = A;
    action := R' = T, N' = 2 + 2*R, U' = ?;
  };
  transition t6 := {
    from   := lbl271;
    to     := lbl271;
    guard  := A > 2*N + P + 3 && P >= 0 && N > 0 && A >= 2*N + P && A > N + P + 1 && B > 2*J && B + 1 >= A && R = N && T = A;
    action := R' = 2 + 2*R, N' = 2 + 2*R, U' = ?;
  };
  transition t7 := {
    from   := lbl281;
    to     := lbl133;
    guard  := A + P + 2 >= 0 && N > 0 && P >= 0 && A > P + N + 1 && B > 2*J && B + 1 >= A && T = A && R = A;
    action := P' = 1 + P, L' = P, U' = ?;
  };
  transition t8 := {
    from   := lbl281;
    to     := lbl281;
    guard  := 0 > A + P + 2 && N > 0 && P >= 0 && A > P + N + 1 && B > 2*J && B + 1 >= A && T = A && R = A;
    action := R' = T, N' = 1 + 2*R, U' = ?;
  };
  transition t9 := {
    from   := lbl281;
    to     := lbl271;
    guard  := 0 > A + P + 2 && N > 0 && P >= 0 && A > P + N + 1 && B > 2*J && B + 1 >= A && T = A && R = A;
    action := R' = 1 + 2*R, N' = 1 + 2*R, U' = ?;
  };
  transition t10 := {
    from   := lbl281;
    to     := lbl281;
    guard  := 0 > A + P + 3 && N > 0 && P >= 0 && A > P + N + 1 && B > 2*J && B + 1 >= A && T = A && R = A;
    action := R' = T, N' = 2 + 2*R, U' = ?;
  };
  transition t11 := {
    from   := lbl281;
    to     := lbl271;
    guard  := 0 > A + P + 3 && N > 0 && P >= 0 && A > P + N + 1 && B > 2*J && B + 1 >= A && T = A && R = A;
    action := R' = 2 + 2*R, N' = 2 + 2*R, U' = ?;
  };
  transition t12 := {
    from   := lbl133;
    to     := stop;
    guard  := L + 2 >= A && R + L + 2 + N >= A && R >= N && L + N > 0 && L >= 0 && A > L + 1 + N && B > 2*J && B + 1 >= A && P = L + 1 && T = A;
    action := U' = ?;
  };
  transition t13 := {
    from   := lbl133;
    to     := lbl133;
    guard  := R + N > 0 && R >= N && A + N > 3 && A > 2 && 1 >= N && B > 2*J && B + 1 >= A && T = A && P + 2 = A && L + 3 = A;
    action := R' = 0, P' = 1 + P, N' = 0, L' = P, U' = ?;
  };
  transition t14 := {
    from   := lbl133;
    to     := lbl281;
    guard  := A > L + 3 && R + L + 2 + N >= A && R >= N && L + N > 0 && L >= 0 && A > L + 1 + N && B > 2*J && B + 1 >= A && P = L + 1 && T = A;
    action := R' = T, N' = 1, U' = ?;
  };
  transition t15 := {
    from   := lbl133;
    to     := lbl271;
    guard  := A > L + 3 && R + L + 2 + N >= A && R >= N && L + N > 0 && L >= 0 && A > L + 1 + N && B > 2*J && B + 1 >= A && P = L + 1 && T = A;
    action := R' = 1, N' = 1, U' = ?;
  };
  transition t16 := {
    from   := lbl133;
    to     := lbl281;
    guard  := A > L + 4 && R + L + 2 + N >= A && R >= N && L + N > 0 && L >= 0 && A > L + 1 + N && B > 2*J && B + 1 >= A && P = L + 1 && T = A;
    action := R' = T, N' = 2, U' = ?;
  };
  transition t17 := {
    from   := lbl133;
    to     := lbl271;
    guard  := A > L + 4 && R + L + 2 + N >= A && R >= N && L + N > 0 && L >= 0 && A > L + 1 + N && B > 2*J && B + 1 >= A && P = L + 1 && T = A;
    action := R' = 2, N' = 2, U' = ?;
  };
  transition t18 := {
    from   := lbl71;
    to     := lbl101;
    guard  := R > 0 && R > 2*J && 2*J + 2 >= R && P > 0 && A > 2 && P >= R && T = A && N = O && L = M;
    action := D' = U, U' = ?;
  };
  transition t19 := {
    from   := lbl71;
    to     := lbl43;
    guard  := R > 2*J && 2*J + 2 >= R && P > 0 && A > 2 && P >= R && T = A && N = O && L = M;
    action := P' = 1 + P, B' = P, U' = ?;
  };
  transition t20 := {
    from   := lbl121;
    to     := lbl123;
    guard  := R > 2*H && 2*H + 2 >= R && A > 2 && R > 0 && R > 2*D && R > 2*F && R > 2*J && P >= R && 2*J + 2 >= R && 2*F + 2 >= R && 2*D + 2 >= R && L = M && N = O && T = A;
    action := R' = H, U' = ?;
  };
  transition t21 := {
    from   := lbl123;
    to     := lbl71;
    guard  := 2*H + 1 >= 0 && P > 0 && 2*F + 1 >= 0 && 2*J + 1 >= 0 && 2*D + 1 >= 0 && P > 2*J && P > 2*F && P > 2*D && P > 2*H && 2*D + 1 >= 2*F && 2*H + 1 >= 2*J && 2*H + 1 >= 2*D && 2*H + 1 >= 2*F && 2*J + 1 >= 2*D && 2*J + 1 >= 2*F && 2*D + 1 >= 2*J && 2*D + 1 >= 2*H && 2*F + 1 >= 2*D && 2*F + 1 >= 2*J && 2*F + 1 >= 2*H && 2*J + 1 >= 2*H && A > 2 && R = H && L = M && T = A && N = O;
    action := J' = U, U' = ?;
  };
  transition t22 := {
    from   := lbl111;
    to     := lbl121;
    guard  := R > 2*F && 2*F + 2 >= R && A > 2 && R > 0 && R > 2*D && R > 2*J && P >= R && 2*J + 2 >= R && 2*D + 2 >= R && L = M && N = O && T = A;
    action := H' = U, U' = ?;
  };
  transition t23 := {
    from   := lbl101;
    to     := lbl111;
    guard  := R > 2*D && 2*D + 2 >= R && A > 2 && R > 0 && R > 2*J && P >= R && 2*J + 2 >= R && L = M && N = O && T = A;
    action := F' = U, U' = ?;
  };
  transition t24 := {
    from   := lbl43;
    to     := lbl71;
    guard  := A > B + 1 && A > 2 && R > 2*J && B > 0 && 2*J + 2 >= R && B >= R && P = B + 1 && L = M && N = O && T = A;
    action := R' = P, J' = U, U' = ?;
  };
  transition t25 := {
    from   := lbl43;
    to     := stop;
    guard  := B + 1 >= A && 1 >= A && A > 2 && R > 2*J && B > 0 && 2*J + 2 >= R && B >= R && P = B + 1 && L = M && N = O && T = A;
    action := P' = 0, U' = ?;
  };
  transition t26 := {
    from   := lbl43;
    to     := lbl133;
    guard  := B > 0 && 0 > 0 && R > 2*J && 2*J + 2 >= R && B >= R && T = 2 && P = B + 1 && L = M && N = O && A = 2;
    action := R' = 0, P' = 1, N' = 0, L' = 0, U' = ?;
  };
  transition t27 := {
    from   := lbl43;
    to     := lbl281;
    guard  := A > 2 && B + 1 >= A && R > 2*J && B > 0 && 2*J + 2 >= R && B >= R && P = B + 1 && L = M && N = O && T = A;
    action := R' = T, P' = 0, N' = 1, U' = ?;
  };
  transition t28 := {
    from   := lbl43;
    to     := lbl271;
    guard  := A > 2 && B + 1 >= A && R > 2*J && B > 0 && 2*J + 2 >= R && B >= R && P = B + 1 && L = M && N = O && T = A;
    action := R' = 1, P' = 0, N' = 1, U' = ?;
  };
  transition t29 := {
    from   := lbl43;
    to     := lbl281;
    guard  := A > 3 && B + 1 >= A && A > 2 && R > 2*J && B > 0 && 2*J + 2 >= R && B >= R && P = B + 1 && L = M && N = O && T = A;
    action := R' = T, P' = 0, N' = 2, U' = ?;
  };
  transition t30 := {
    from   := lbl43;
    to     := lbl271;
    guard  := A > 3 && B + 1 >= A && A > 2 && R > 2*J && B > 0 && 2*J + 2 >= R && B >= R && P = B + 1 && L = M && N = O && T = A;
    action := R' = 2, P' = 0, N' = 2, U' = ?;
  };
  transition t31 := {
    from   := start0;
    to     := start;
    guard  := true;
    action := T' = A, R' = S, P' = Q, N' = O, L' = M, J' = K, H' = I, F' = G, D' = E, B' = C, U' = ?;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
