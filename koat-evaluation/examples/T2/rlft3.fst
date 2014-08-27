model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1;
  states f0, f16, f18, f28, f35, f37, f52, f76;
  transition t0 := {
    from   := f0;
    to     := f16;
    guard  := A = 1;
    action := B' = X, C' = Y, D' = Z, E' = A1, F' = B1, G' = C1, A' = 1, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t1 := {
    from   := f16;
    to     := f18;
    guard  := H >= I;
    action := X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t2 := {
    from   := f18;
    to     := f18;
    guard  := J >= K;
    action := K' = K + 1, L' = L + 2, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t3 := {
    from   := f0;
    to     := f28;
    guard  := 0 >= A;
    action := B' = X, C' = Y, D' = Z, E' = A1, F' = B1, G' = C1, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t4 := {
    from   := f0;
    to     := f28;
    guard  := A > 1;
    action := B' = X, C' = Y, D' = Z, E' = A1, F' = B1, G' = C1, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t5 := {
    from   := f28;
    to     := f35;
    guard  := 0 >= I && H >= I;
    action := M' = H - I + 2, N' = 1, O' = 0, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t6 := {
    from   := f28;
    to     := f35;
    guard  := I > 1 && H >= I;
    action := M' = H - I + 2, N' = 1, O' = 0, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t7 := {
    from   := f28;
    to     := f35;
    guard  := H > 0 && I = 1;
    action := I' = 1, M' = 1, N' = 1, O' = 0, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t8 := {
    from   := f35;
    to     := f37;
    guard  := P >= 2*X && 3*X > P && X + 1 >= Q;
    action := X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t9 := {
    from   := f37;
    to     := f52;
    guard  := 0 >= Q && J >= K;
    action := X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t10 := {
    from   := f37;
    to     := f52;
    guard  := Q > 1 && J >= K;
    action := X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t11 := {
    from   := f37;
    to     := f37;
    guard  := 0 >= K && J >= K && Q = 1;
    action := K' = K + 1, L' = X, Q' = 1, R' = Y, S' = Z, T' = A1, U' = B1, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t12 := {
    from   := f37;
    to     := f37;
    guard  := J >= K && K > 1 && Q = 1;
    action := K' = K + 1, L' = X, Q' = 1, R' = Y, S' = Z, T' = A1, U' = B1, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t13 := {
    from   := f37;
    to     := f37;
    guard  := J > 0 && K = 1 && Q = 1;
    action := K' = 2, L' = 1, Q' = 1, R' = X, S' = Y, T' = Z, U' = A1, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t14 := {
    from   := f52;
    to     := f37;
    guard  := 0 >= K;
    action := K' = K + 1, L' = J - K + 2, R' = X, S' = Y, T' = Z, U' = A1, V' = B1, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t15 := {
    from   := f52;
    to     := f37;
    guard  := K > 1;
    action := K' = K + 1, L' = J - K + 2, R' = X, S' = Y, T' = Z, U' = A1, V' = B1, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t16 := {
    from   := f52;
    to     := f37;
    guard  := K = 1;
    action := K' = 2, L' = 1, R' = X, S' = Y, T' = Z, U' = A1, V' = B1, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t17 := {
    from   := f37;
    to     := f35;
    guard  := K > J;
    action := E' = N, N' = X, O' = Y, Q' = Q + 1, W' = W + 2, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t18 := {
    from   := f35;
    to     := f28;
    guard  := P >= 2*X && 3*X > P && Q > 1 + X;
    action := I' = I + 1, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t19 := {
    from   := f28;
    to     := f76;
    guard  := 0 > 1 + A && I > H;
    action := X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t20 := {
    from   := f28;
    to     := f76;
    guard  := A >= 0 && I > H;
    action := X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t21 := {
    from   := f28;
    to     := f76;
    guard  := I > H && A + 1 = 0;
    action := A' = -1, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t22 := {
    from   := f18;
    to     := f16;
    guard  := K > J;
    action := I' = I + 1, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t23 := {
    from   := f16;
    to     := f28;
    guard  := I > H;
    action := X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
