model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1;
  states f2, f10, f19, f23, f26, f41, f53, f63, f66, f69, f1, start;
  transition t0 := {
    from   := f2;
    to     := f2;
    guard  := A >= B;
    action := B' = B + 1, C' = B1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t1 := {
    from   := f10;
    to     := f19;
    guard  := B > 0;
    action := D' = B1, E' = C1, F' = D1, G' = E1, H' = F1, I' = 1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t2 := {
    from   := f19;
    to     := f23;
    guard  := G >= J && I > J;
    action := B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t3 := {
    from   := f23;
    to     := f26;
    guard  := J + F > 1 + K;
    action := B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t4 := {
    from   := f26;
    to     := f26;
    guard  := H >= L;
    action := L' = L + G, M' = I + L - J, N' = B1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t5 := {
    from   := f19;
    to     := f41;
    guard  := G >= J && J >= I;
    action := O' = B1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t6 := {
    from   := f41;
    to     := f41;
    guard  := O >= F && I > O;
    action := I' = I - O, O' = B1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t7 := {
    from   := f53;
    to     := f63;
    guard  := G > P;
    action := Q' = B1, R' = C1, S' = D1, T' = E1, U' = F1, V' = 1, W' = 0, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t8 := {
    from   := f63;
    to     := f66;
    guard  := P >= L;
    action := B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t9 := {
    from   := f66;
    to     := f69;
    guard  := L + F > 1 + K;
    action := B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t10 := {
    from   := f69;
    to     := f69;
    guard  := H >= J;
    action := J' = J + Q, N' = B1, X' = J, Y' = J + P, Z' = C1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t11 := {
    from   := f69;
    to     := f66;
    guard  := J > H;
    action := K' = K + 2, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t12 := {
    from   := f66;
    to     := f63;
    guard  := K + 1 >= L + F;
    action := L' = L + F, S' = V, V' = B1, W' = C1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t13 := {
    from   := f63;
    to     := f53;
    guard  := L > P;
    action := P' = Q, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t14 := {
    from   := f53;
    to     := f10;
    guard  := P >= G;
    action := B' = B - 1, A1' = B1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t15 := {
    from   := f41;
    to     := f19;
    guard  := O >= F && O >= I;
    action := I' = I + O, J' = J + F, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t16 := {
    from   := f41;
    to     := f19;
    guard  := F > O;
    action := I' = I + O, J' = J + F, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t17 := {
    from   := f26;
    to     := f23;
    guard  := L > H;
    action := K' = K + 2, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t18 := {
    from   := f23;
    to     := f41;
    guard  := K + 1 >= J + F;
    action := O' = B1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t19 := {
    from   := f19;
    to     := f53;
    guard  := J > G;
    action := P' = F, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t20 := {
    from   := f10;
    to     := f1;
    guard  := 0 >= B;
    action := B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t21 := {
    from   := f2;
    to     := f10;
    guard  := B > A;
    action := A1' = 1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
  transition t22 := {
    from   := start;
    to     := f2;
    guard  := true;
    action := B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?;
  };
}
strategy dumb {
  Region init := { state = start };
}
