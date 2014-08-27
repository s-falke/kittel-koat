model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1;
  states f2, f13, f16, f27, f35, f38, f53, f1;
  transition t0 := {
    from   := f2;
    to     := f13;
    guard  := A = 1;
    action := B' = X, C' = Y, D' = Z, E' = A1, F' = B1, G' = C1, A' = 1, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t1 := {
    from   := f13;
    to     := f16;
    guard  := H >= I;
    action := X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t2 := {
    from   := f16;
    to     := f16;
    guard  := J >= K;
    action := K' = K + 1, L' = L + 2, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t3 := {
    from   := f2;
    to     := f27;
    guard  := 0 >= A;
    action := B' = X, C' = Y, D' = Z, E' = A1, F' = B1, G' = C1, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t4 := {
    from   := f2;
    to     := f27;
    guard  := A > 1;
    action := B' = X, C' = Y, D' = Z, E' = A1, F' = B1, G' = C1, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t5 := {
    from   := f27;
    to     := f35;
    guard  := 0 >= I && H >= I;
    action := M' = H - I + 2, N' = 1, O' = 0, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t6 := {
    from   := f27;
    to     := f35;
    guard  := I > 1 && H >= I;
    action := M' = H - I + 2, N' = 1, O' = 0, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t7 := {
    from   := f27;
    to     := f35;
    guard  := H > 0 && I = 1;
    action := I' = 1, M' = 1, N' = 1, O' = 0, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t8 := {
    from   := f35;
    to     := f38;
    guard  := P >= 2*X && 3*X > P && X + 1 >= Q;
    action := X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t9 := {
    from   := f38;
    to     := f53;
    guard  := 0 >= Q && J >= K;
    action := X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t10 := {
    from   := f38;
    to     := f53;
    guard  := Q > 1 && J >= K;
    action := X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t11 := {
    from   := f38;
    to     := f38;
    guard  := J >= K + 4*X && 5*X + K > J && 0 >= K && J >= K && Q = 1;
    action := K' = K + 1, L' = X + 3, Q' = 1, R' = B*Y + B*Z, S' = B*A1 - B*B1, T' = C*C1 - C*D1, U' = -C*E1 - C*F1, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t12 := {
    from   := f38;
    to     := f38;
    guard  := J >= K + 4*X && 5*X + K > J && J >= K && K > 1 && Q = 1;
    action := K' = K + 1, L' = X + 3, Q' = 1, R' = B*Y + B*Z, S' = B*A1 - B*B1, T' = C*C1 - C*D1, U' = -C*E1 - C*F1, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t13 := {
    from   := f38;
    to     := f38;
    guard  := J > 0 && K = 1 && Q = 1;
    action := K' = 2, L' = 1, Q' = 1, R' = B*X + B*Y, S' = B*Z - B*A1, T' = C*B1 - C*C1, U' = -C*D1 - C*E1, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t14 := {
    from   := f53;
    to     := f38;
    guard  := Q >= 2*F1 && 3*F1 > Q && 0 >= K;
    action := K' = K + 1, L' = J - K + 2, R' = B*X + B*Y, S' = B*Z - B*A1, T' = C*B1 - C*C1, U' = -C*D1 - C*E1, V' = P + 3 - F1, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t15 := {
    from   := f53;
    to     := f38;
    guard  := Q >= 2*F1 && 3*F1 > Q && K > 1;
    action := K' = K + 1, L' = J - K + 2, R' = B*X + B*Y, S' = B*Z - B*A1, T' = C*B1 - C*C1, U' = -C*D1 - C*E1, V' = P + 3 - F1, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t16 := {
    from   := f53;
    to     := f38;
    guard  := Q >= 2*F1 && 3*F1 > Q && K = 1;
    action := K' = 2, L' = 1, R' = B*X + B*Y, S' = B*Z - B*A1, T' = C*B1 - C*C1, U' = -C*D1 - C*E1, V' = P + 3 - F1, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t17 := {
    from   := f38;
    to     := f35;
    guard  := K > J;
    action := E' = N, N' = F*N - G*O + N, O' = F*O + G*N + O, Q' = Q + 1, W' = W + 2, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t18 := {
    from   := f35;
    to     := f27;
    guard  := P >= 2*X && 3*X > P && Q > 1 + X;
    action := I' = I + 1, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t19 := {
    from   := f27;
    to     := f1;
    guard  := 0 > 1 + A && I > H;
    action := X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t20 := {
    from   := f27;
    to     := f1;
    guard  := A >= 0 && I > H;
    action := X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t21 := {
    from   := f27;
    to     := f1;
    guard  := I > H && A + 1 = 0;
    action := A' = -1, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t22 := {
    from   := f16;
    to     := f13;
    guard  := K > J;
    action := I' = I + 1, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t23 := {
    from   := f13;
    to     := f27;
    guard  := I > H;
    action := X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
}
strategy dumb {
  Region init := { state = f2 };
}
