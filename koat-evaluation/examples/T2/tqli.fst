model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1;
  states f0, f74, f16, f13, f26, f29, f33, f42, f68, f59, f80, start;
  transition t0 := {
    from   := f0;
    to     := f0;
    guard  := A >= B;
    action := B' = B + 1, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t1 := {
    from   := f74;
    to     := f16;
    guard  := C > D;
    action := V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t2 := {
    from   := f74;
    to     := f16;
    guard  := D > C;
    action := V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t3 := {
    from   := f13;
    to     := f16;
    guard  := A >= C;
    action := E' = 0, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t4 := {
    from   := f16;
    to     := f26;
    guard  := D >= A;
    action := V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t5 := {
    from   := f16;
    to     := f26;
    guard  := A > D;
    action := F' = V, G' = W, H' = V + W, I' = 0, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t6 := {
    from   := f16;
    to     := f16;
    guard  := 0 > X && A > D;
    action := D' = D + 1, F' = V, G' = W, H' = V + W, I' = X, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t7 := {
    from   := f16;
    to     := f16;
    guard  := X > 0 && A > D;
    action := D' = D + 1, F' = V, G' = W, H' = V + W, I' = X, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t8 := {
    from   := f26;
    to     := f74;
    guard  := C = D;
    action := D' = C, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t9 := {
    from   := f26;
    to     := f29;
    guard  := C > D;
    action := E' = E + 1, J' = E, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t10 := {
    from   := f26;
    to     := f29;
    guard  := D > C;
    action := E' = E + 1, J' = E, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t11 := {
    from   := f29;
    to     := f33;
    guard  := 29 >= J;
    action := K' = V, L' = W, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t12 := {
    from   := f29;
    to     := f33;
    guard  := J > 30;
    action := K' = V, L' = W, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t13 := {
    from   := f29;
    to     := f33;
    guard  := J = 30;
    action := J' = 30, K' = V, L' = W, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t14 := {
    from   := f33;
    to     := f42;
    guard  := K >= 0;
    action := K' = V, M' = W, N' = W, O' = 1, P' = 1, Q' = 0, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t15 := {
    from   := f33;
    to     := f42;
    guard  := 0 > K;
    action := K' = V, N' = -W, R' = W, O' = 1, P' = 1, Q' = 0, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t16 := {
    from   := f42;
    to     := f68;
    guard  := C > B;
    action := V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t17 := {
    from   := f42;
    to     := f68;
    guard  := B >= C;
    action := L' = 0, S' = V, T' = W, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t18 := {
    from   := f42;
    to     := f59;
    guard  := B >= C && 0 > Y;
    action := K' = V, L' = W, O' = X, P' = Z, Q' = A1, S' = B1, T' = C1, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t19 := {
    from   := f42;
    to     := f59;
    guard  := B >= C && Y > 0;
    action := K' = V, L' = W, O' = X, P' = Z, Q' = A1, S' = B1, T' = C1, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t20 := {
    from   := f59;
    to     := f59;
    guard  := A >= U;
    action := S' = V, U' = U + 1, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t21 := {
    from   := f68;
    to     := f74;
    guard  := B >= C && L = 0;
    action := L' = 0, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t22 := {
    from   := f68;
    to     := f74;
    guard  := 0 > L;
    action := V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t23 := {
    from   := f68;
    to     := f74;
    guard  := L > 0;
    action := V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t24 := {
    from   := f68;
    to     := f74;
    guard  := C > B && L = 0;
    action := L' = 0, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t25 := {
    from   := f74;
    to     := f13;
    guard  := C = D;
    action := C' = C + 1, D' = C, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t26 := {
    from   := f59;
    to     := f42;
    guard  := U > A;
    action := B' = B - 1, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t27 := {
    from   := f13;
    to     := f80;
    guard  := C > A;
    action := V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t28 := {
    from   := f0;
    to     := f13;
    guard  := B > A;
    action := V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t29 := {
    from   := start;
    to     := f0;
    guard  := true;
    action := V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
}
strategy dumb {
  Region init := { state = start };
}
