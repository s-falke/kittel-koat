model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1;
  states f2, f75, f15, f10, f24, f28, f32, f42, f68, f60, f1, start;
  transition t0 := {
    from   := f2;
    to     := f2;
    guard  := A >= B;
    action := B' = B + 1, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t1 := {
    from   := f75;
    to     := f15;
    guard  := C > D;
    action := V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t2 := {
    from   := f75;
    to     := f15;
    guard  := D > C;
    action := V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t3 := {
    from   := f10;
    to     := f15;
    guard  := A >= C;
    action := E' = 0, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t4 := {
    from   := f15;
    to     := f24;
    guard  := D >= A;
    action := V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t5 := {
    from   := f15;
    to     := f24;
    guard  := A > D;
    action := F' = V, G' = W, H' = V + W, I' = 0, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t6 := {
    from   := f15;
    to     := f15;
    guard  := 0 > X && A > D;
    action := D' = D + 1, F' = V, G' = W, H' = V + W, I' = X, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t7 := {
    from   := f15;
    to     := f15;
    guard  := X > 0 && A > D;
    action := D' = D + 1, F' = V, G' = W, H' = V + W, I' = X, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t8 := {
    from   := f24;
    to     := f75;
    guard  := C = D;
    action := D' = C, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t9 := {
    from   := f24;
    to     := f28;
    guard  := C > D;
    action := E' = E + 1, J' = E, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t10 := {
    from   := f24;
    to     := f28;
    guard  := D > C;
    action := E' = E + 1, J' = E, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t11 := {
    from   := f28;
    to     := f32;
    guard  := 29 >= J;
    action := K' = V, L' = W, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t12 := {
    from   := f28;
    to     := f32;
    guard  := J > 30;
    action := K' = V, L' = W, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t13 := {
    from   := f28;
    to     := f32;
    guard  := J = 30;
    action := J' = 30, K' = V, L' = W, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t14 := {
    from   := f32;
    to     := f42;
    guard  := Y >= K*X + X*Z && K*X + X*Z + X > Y && K >= 0;
    action := K' = V - W + X, M' = Z, N' = Z, O' = 1, P' = 1, Q' = 0, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t15 := {
    from   := f32;
    to     := f42;
    guard  := Y + X*Z >= K*X && K*X + X > X*Z + Y && 0 > K;
    action := K' = V - W + X, N' = -Z, R' = Z, O' = 1, P' = 1, Q' = 0, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t16 := {
    from   := f42;
    to     := f68;
    guard  := C > B;
    action := V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t17 := {
    from   := f42;
    to     := f68;
    guard  := B >= C;
    action := L' = 0, S' = P*V, T' = O*W, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t18 := {
    from   := f42;
    to     := f60;
    guard  := K*X >= V*X*A1 && V*X*A1 + V > K*X && 0 > A1 && B >= C && P*B1 >= A1*C1 && A1*C1 + C1 > P*B1 && C1 >= Y && P*B1 >= A1*D1 && A1*D1 + D1 > P*B1 && Y >= D1 && K >= A1*E1 && A1*E1 + E1 > K && E1 >= Z && K >= A1*F1 && A1*F1 + F1 > K && Z >= F1 && P*X*B1 >= X*A1*G1 && X*A1*G1 + G1 > P*X*B1 && G1 >= H1 && P*X*B1 >= X*A1*I1 && X*A1*I1 + I1 > P*X*B1 && H1 >= I1;
    action := K' = V - O*W, L' = X, O' = Z, P' = Y, Q' = H1, S' = P*B1, T' = O*W, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t19 := {
    from   := f42;
    to     := f60;
    guard  := K*X >= V*X*A1 && V*X*A1 + V > K*X && A1 > 0 && B >= C && P*B1 >= A1*C1 && A1*C1 + C1 > P*B1 && C1 >= Y && P*B1 >= A1*D1 && A1*D1 + D1 > P*B1 && Y >= D1 && K >= A1*E1 && A1*E1 + E1 > K && E1 >= Z && K >= A1*F1 && A1*F1 + F1 > K && Z >= F1 && P*X*B1 >= X*A1*G1 && X*A1*G1 + G1 > P*X*B1 && G1 >= H1 && P*X*B1 >= X*A1*I1 && X*A1*I1 + I1 > P*X*B1 && H1 >= I1;
    action := K' = V - O*W, L' = X, O' = Z, P' = Y, Q' = H1, S' = P*B1, T' = O*W, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t20 := {
    from   := f60;
    to     := f60;
    guard  := A >= U;
    action := S' = V, U' = U + 1, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t21 := {
    from   := f68;
    to     := f75;
    guard  := B >= C && L = 0;
    action := L' = 0, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t22 := {
    from   := f68;
    to     := f75;
    guard  := 0 > L;
    action := V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t23 := {
    from   := f68;
    to     := f75;
    guard  := L > 0;
    action := V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t24 := {
    from   := f68;
    to     := f75;
    guard  := C > B && L = 0;
    action := L' = 0, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t25 := {
    from   := f75;
    to     := f10;
    guard  := C = D;
    action := C' = C + 1, D' = C, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t26 := {
    from   := f60;
    to     := f42;
    guard  := U > A;
    action := B' = B - 1, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t27 := {
    from   := f10;
    to     := f1;
    guard  := C > A;
    action := V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t28 := {
    from   := f2;
    to     := f10;
    guard  := B > A;
    action := V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t29 := {
    from   := start;
    to     := f2;
    guard  := true;
    action := V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
}
strategy dumb {
  Region init := { state = start };
}
