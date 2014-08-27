model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1;
  states f1, f9, f10, f4, f3;
  transition t0 := {
    from   := f1;
    to     := f1;
    guard  := A > B && B >= 0;
    action := B' = 1 + B, C' = D, E' = Y, F' = Z, G' = A1, D' = B1, H' = C1, I' = D1, J' = E1, K' = D, L' = F1, M' = B, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?;
  };
  transition t1 := {
    from   := f9;
    to     := f10;
    guard  := B1 > N && O >= 0 && A1 > 1 && Z >= A1 && Y > B1 && P = 0;
    action := Q' = Y, R' = 0, S' = Y, P' = 0, B' = Z, A' = A1, C' = Y, K' = Y, T' = N, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?;
  };
  transition t2 := {
    from   := f9;
    to     := f10;
    guard  := B1 > N && O >= 0 && A1 > 1 && Z >= A1 && B1 > Y && P = 0;
    action := Q' = Y, R' = 0, S' = Y, P' = 0, B' = Z, A' = A1, C' = Y, K' = Y, T' = N, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?;
  };
  transition t3 := {
    from   := f9;
    to     := f10;
    guard  := N > B1 && O >= 0 && A1 > 1 && Z >= A1 && Y > B1 && P = 0;
    action := Q' = Y, R' = 0, S' = Y, P' = 0, B' = Z, A' = A1, C' = Y, K' = Y, T' = N, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?;
  };
  transition t4 := {
    from   := f9;
    to     := f10;
    guard  := N > B1 && O >= 0 && A1 > 1 && Z >= A1 && B1 > Y && P = 0;
    action := Q' = Y, R' = 0, S' = Y, P' = 0, B' = Z, A' = A1, C' = Y, K' = Y, T' = N, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?;
  };
  transition t5 := {
    from   := f9;
    to     := f4;
    guard  := O >= 0 && E1 > 1 && D1 >= E1 && 0 > F1 && P = N;
    action := Q' = Y, R' = Z, S' = A1, P' = B1, N' = C1, B' = D1, A' = E1, C' = F1, I' = G1, T' = H1, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?;
  };
  transition t6 := {
    from   := f9;
    to     := f4;
    guard  := O >= 0 && E1 > 1 && D1 >= E1 && F1 > 0 && P = N;
    action := Q' = Y, R' = Z, S' = A1, P' = B1, N' = C1, B' = D1, A' = E1, C' = F1, I' = G1, T' = H1, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?;
  };
  transition t7 := {
    from   := f10;
    to     := f10;
    guard  := C1 > N && U >= 0 && A1 > 1 && Z >= A1 && Y > C1 && P = 0;
    action := Q' = Y, R' = 0, S' = Y, P' = 0, B' = Z, A' = A1, C' = Y, K' = Y, T' = N, U' = -1 + U, V' = B1, W' = -1 + U, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?;
  };
  transition t8 := {
    from   := f10;
    to     := f10;
    guard  := C1 > N && U >= 0 && A1 > 1 && Z >= A1 && C1 > Y && P = 0;
    action := Q' = Y, R' = 0, S' = Y, P' = 0, B' = Z, A' = A1, C' = Y, K' = Y, T' = N, U' = -1 + U, V' = B1, W' = -1 + U, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?;
  };
  transition t9 := {
    from   := f10;
    to     := f10;
    guard  := N > C1 && U >= 0 && A1 > 1 && Z >= A1 && Y > C1 && P = 0;
    action := Q' = Y, R' = 0, S' = Y, P' = 0, B' = Z, A' = A1, C' = Y, K' = Y, T' = N, U' = -1 + U, V' = B1, W' = -1 + U, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?;
  };
  transition t10 := {
    from   := f10;
    to     := f10;
    guard  := N > C1 && U >= 0 && A1 > 1 && Z >= A1 && C1 > Y && P = 0;
    action := Q' = Y, R' = 0, S' = Y, P' = 0, B' = Z, A' = A1, C' = Y, K' = Y, T' = N, U' = -1 + U, V' = B1, W' = -1 + U, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?;
  };
  transition t11 := {
    from   := f10;
    to     := f4;
    guard  := D1 > 1 && U >= 0 && P = N;
    action := Q' = Y, R' = Z, S' = A1, P' = B1, N' = C1, A' = D1, I' = E1, T' = F1, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?;
  };
  transition t12 := {
    from   := f1;
    to     := f10;
    guard  := B >= A && B >= 0 && Z >= Y && Y > 1 && C > 0 && 0 > C;
    action := Q' = C, R' = 0, S' = C, P' = 0, N' = C, B' = U + 1, A' = Y, K' = C, T' = C, O' = U, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?;
  };
  transition t13 := {
    from   := f1;
    to     := f10;
    guard  := B >= A && B >= 0 && Z >= Y && Y > 1 && C > 0;
    action := Q' = C, R' = 0, S' = C, P' = 0, N' = C, B' = U + 1, A' = Y, K' = C, T' = C, O' = U, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?;
  };
  transition t14 := {
    from   := f1;
    to     := f10;
    guard  := B >= A && B >= 0 && Z >= Y && Y > 1 && 0 > C;
    action := Q' = C, R' = 0, S' = C, P' = 0, N' = C, B' = U + 1, A' = Y, K' = C, T' = C, O' = U, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?;
  };
  transition t15 := {
    from   := f1;
    to     := f10;
    guard  := B >= A && B >= 0 && Z >= Y && Y > 1 && 0 > C && C > 0;
    action := Q' = C, R' = 0, S' = C, P' = 0, N' = C, B' = U + 1, A' = Y, K' = C, T' = C, O' = U, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?;
  };
  transition t16 := {
    from   := f3;
    to     := f4;
    guard  := 0 >= D1 && 0 >= A;
    action := Q' = Y, R' = Z, S' = A1, P' = B1, N' = C1, B' = 0, A' = D1, C' = 0, I' = E1, T' = F1, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?;
  };
  transition t17 := {
    from   := f3;
    to     := f1;
    guard  := A > 1;
    action := B' = 2, C' = Y, E' = Z, F' = A1, G' = B1, D' = C1, H' = D1, I' = E1, J' = F1, K' = Y, X' = G1, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?;
  };
}
strategy dumb {
  Region init := { state = f3 };
}
