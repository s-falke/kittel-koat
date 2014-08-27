model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1, N1, O1, P1, Q1;
  states f1, f7, f8, f10, f9;
  transition t0 := {
    from   := f1;
    to     := f1;
    guard  := A > B && B >= 0;
    action := C' = D, B' = 1 + B, E' = D, D' = Z, F' = A1, G' = B, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?;
  };
  transition t1 := {
    from   := f7;
    to     := f8;
    guard  := B1 > H && I >= 0 && A1 > B1 && Z > 1 && J = 0;
    action := K' = Z, L' = A1, M' = A1, N' = 0, O' = A1, J' = 0, P' = H, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?;
  };
  transition t2 := {
    from   := f7;
    to     := f8;
    guard  := B1 > H && I >= 0 && B1 > A1 && Z > 1 && J = 0;
    action := K' = Z, L' = A1, M' = A1, N' = 0, O' = A1, J' = 0, P' = H, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?;
  };
  transition t3 := {
    from   := f7;
    to     := f8;
    guard  := H > B1 && I >= 0 && A1 > B1 && Z > 1 && J = 0;
    action := K' = Z, L' = A1, M' = A1, N' = 0, O' = A1, J' = 0, P' = H, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?;
  };
  transition t4 := {
    from   := f7;
    to     := f8;
    guard  := H > B1 && I >= 0 && B1 > A1 && Z > 1 && J = 0;
    action := K' = Z, L' = A1, M' = A1, N' = 0, O' = A1, J' = 0, P' = H, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?;
  };
  transition t5 := {
    from   := f7;
    to     := f10;
    guard  := I >= 0 && 0 > B1 && Z > 1 && J = H;
    action := K' = Z, Q' = A1, L' = B1, M' = C1, N' = D1, O' = E1, J' = F1, H' = G1, P' = H1, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?;
  };
  transition t6 := {
    from   := f7;
    to     := f10;
    guard  := I >= 0 && B1 > 0 && Z > 1 && J = H;
    action := K' = Z, Q' = A1, L' = B1, M' = C1, N' = D1, O' = E1, J' = F1, H' = G1, P' = H1, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?;
  };
  transition t7 := {
    from   := f8;
    to     := f8;
    guard  := C1 > H && R >= 0 && A1 > C1 && Z > 1 && J = 0;
    action := K' = Z, L' = A1, M' = A1, N' = 0, O' = A1, J' = 0, P' = H, R' = -1 + R, S' = B1, T' = -1 + R, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?;
  };
  transition t8 := {
    from   := f8;
    to     := f8;
    guard  := C1 > H && R >= 0 && C1 > A1 && Z > 1 && J = 0;
    action := K' = Z, L' = A1, M' = A1, N' = 0, O' = A1, J' = 0, P' = H, R' = -1 + R, S' = B1, T' = -1 + R, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?;
  };
  transition t9 := {
    from   := f8;
    to     := f8;
    guard  := H > C1 && R >= 0 && A1 > C1 && Z > 1 && J = 0;
    action := K' = Z, L' = A1, M' = A1, N' = 0, O' = A1, J' = 0, P' = H, R' = -1 + R, S' = B1, T' = -1 + R, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?;
  };
  transition t10 := {
    from   := f8;
    to     := f8;
    guard  := H > C1 && R >= 0 && C1 > A1 && Z > 1 && J = 0;
    action := K' = Z, L' = A1, M' = A1, N' = 0, O' = A1, J' = 0, P' = H, R' = -1 + R, S' = B1, T' = -1 + R, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?;
  };
  transition t11 := {
    from   := f8;
    to     := f10;
    guard  := Z > 1 && R >= 0 && J = H;
    action := K' = Z, Q' = A1, M' = B1, N' = C1, O' = D1, J' = E1, H' = F1, P' = G1, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?;
  };
  transition t12 := {
    from   := f9;
    to     := f10;
    guard  := 0 >= I1 && 0 >= A1 && 0 >= J1;
    action := U' = Z, K' = A1, A' = B1, C' = C1, B' = D1, V' = E1, Q' = F1, W' = G1, E' = H1, D' = K1, L' = 0, M' = L1, N' = M1, O' = N1, J' = O1, H' = P1, P' = Q1, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?;
  };
  transition t13 := {
    from   := f9;
    to     := f1;
    guard  := A1 > 1;
    action := U' = Z, K' = A1, A' = A1, C' = B1, B' = 2, W' = B1, E' = B1, D' = C1, X' = D1, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?;
  };
  transition t14 := {
    from   := f1;
    to     := f8;
    guard  := K1 >= Z && L1 > 1 && C1 >= L1 && B >= A && B >= 0 && C > 0 && C1 >= 0 && Z > 1 && 0 > C;
    action := K' = Z, A' = A1, C' = B1, B' = C1, V' = D1, Q' = E1, W' = F1, E' = G1, D' = H1, L' = C, M' = C, N' = 0, O' = C, J' = 0, H' = C, P' = C, Y' = R + 1, I' = R, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?;
  };
  transition t15 := {
    from   := f1;
    to     := f8;
    guard  := K1 >= Z && L1 > 1 && C1 >= L1 && B >= A && B >= 0 && C > 0 && C1 >= 0 && Z > 1;
    action := K' = Z, A' = A1, C' = B1, B' = C1, V' = D1, Q' = E1, W' = F1, E' = G1, D' = H1, L' = C, M' = C, N' = 0, O' = C, J' = 0, H' = C, P' = C, Y' = R + 1, I' = R, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?;
  };
  transition t16 := {
    from   := f1;
    to     := f8;
    guard  := K1 >= Z && L1 > 1 && C1 >= L1 && B >= A && B >= 0 && 0 > C && C1 >= 0 && Z > 1;
    action := K' = Z, A' = A1, C' = B1, B' = C1, V' = D1, Q' = E1, W' = F1, E' = G1, D' = H1, L' = C, M' = C, N' = 0, O' = C, J' = 0, H' = C, P' = C, Y' = R + 1, I' = R, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?;
  };
  transition t17 := {
    from   := f1;
    to     := f8;
    guard  := K1 >= Z && L1 > 1 && C1 >= L1 && B >= A && B >= 0 && 0 > C && C1 >= 0 && Z > 1 && C > 0;
    action := K' = Z, A' = A1, C' = B1, B' = C1, V' = D1, Q' = E1, W' = F1, E' = G1, D' = H1, L' = C, M' = C, N' = 0, O' = C, J' = 0, H' = C, P' = C, Y' = R + 1, I' = R, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?, Q1' = ?;
  };
}
strategy dumb {
  Region init := { state = f9 };
}
