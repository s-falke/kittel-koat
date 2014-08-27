model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1;
  states f9, f5, f0, f12, f6;
  transition t0 := {
    from   := f9;
    to     := f9;
    guard  := A > B && C >= 0;
    action := D' = B1, B' = 1 + B, C' = 1 + C, E' = B1, F' = B1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t1 := {
    from   := f5;
    to     := f0;
    guard  := D1 > C1 && G >= 0 && H > 0 && I > 0;
    action := H' = B1, J' = H, K' = E1, L' = F1, M' = C1, N' = D1, O' = G1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t2 := {
    from   := f5;
    to     := f0;
    guard  := D1 > C1 && G >= 0 && 0 > H && I > 0;
    action := H' = B1, J' = H, K' = E1, L' = F1, M' = C1, N' = D1, O' = G1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t3 := {
    from   := f5;
    to     := f5;
    guard  := M >= D1 && G >= 0 && I >= 0 && P > 0 && H > 0 && J = 0;
    action := Q' = R, R' = P, S' = B1, P' = E1, H' = R, J' = 0, T' = 1 + I, U' = -1 + G, I' = 1 + I, G' = -1 + G, V' = I, K' = F1, L' = C1, N' = D1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t4 := {
    from   := f5;
    to     := f5;
    guard  := M >= D1 && G >= 0 && I >= 0 && P > 0 && 0 > H && J = 0;
    action := Q' = R, R' = P, S' = B1, P' = E1, H' = R, J' = 0, T' = 1 + I, U' = -1 + G, I' = 1 + I, G' = -1 + G, V' = I, K' = F1, L' = C1, N' = D1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t5 := {
    from   := f5;
    to     := f5;
    guard  := M >= D1 && G >= 0 && I >= 0 && 0 > P && H > 0 && J = 0;
    action := Q' = R, R' = P, S' = B1, P' = E1, H' = R, J' = 0, T' = 1 + I, U' = -1 + G, I' = 1 + I, G' = -1 + G, V' = I, K' = F1, L' = C1, N' = D1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t6 := {
    from   := f5;
    to     := f5;
    guard  := M >= D1 && G >= 0 && I >= 0 && 0 > P && 0 > H && J = 0;
    action := Q' = R, R' = P, S' = B1, P' = E1, H' = R, J' = 0, T' = 1 + I, U' = -1 + G, I' = 1 + I, G' = -1 + G, V' = I, K' = F1, L' = C1, N' = D1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t7 := {
    from   := f5;
    to     := f12;
    guard  := M >= C1 && G >= 0 && H > 0 && I >= 0 && P = 0 && J = 0;
    action := Q' = R, W' = B1, P' = 0, J' = 0, V' = I, K' = E1, L' = F1, N' = C1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t8 := {
    from   := f5;
    to     := f12;
    guard  := M >= C1 && G >= 0 && 0 > H && I >= 0 && P = 0 && J = 0;
    action := Q' = R, W' = B1, P' = 0, J' = 0, V' = I, K' = E1, L' = F1, N' = C1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t9 := {
    from   := f9;
    to     := f5;
    guard  := D1 >= G1 && C > 1 && E1 > 0 && B1 > 0 && B >= A && D > 0;
    action := Q' = B1, X' = D, W' = D, Y' = -2 + C, R' = E1, S' = F1, P' = C1, H' = B1, J' = 0, T' = 1, U' = -3 + C, I' = 1, G' = -3 + C, Z' = D1, A1' = G1, K' = H1, L' = I1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t10 := {
    from   := f9;
    to     := f5;
    guard  := D1 >= G1 && C > 1 && E1 > 0 && B1 > 0 && B >= A && 0 > D;
    action := Q' = B1, X' = D, W' = D, Y' = -2 + C, R' = E1, S' = F1, P' = C1, H' = B1, J' = 0, T' = 1, U' = -3 + C, I' = 1, G' = -3 + C, Z' = D1, A1' = G1, K' = H1, L' = I1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t11 := {
    from   := f9;
    to     := f5;
    guard  := D1 >= G1 && C > 1 && E1 > 0 && 0 > B1 && B >= A && D > 0;
    action := Q' = B1, X' = D, W' = D, Y' = -2 + C, R' = E1, S' = F1, P' = C1, H' = B1, J' = 0, T' = 1, U' = -3 + C, I' = 1, G' = -3 + C, Z' = D1, A1' = G1, K' = H1, L' = I1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t12 := {
    from   := f9;
    to     := f5;
    guard  := D1 >= G1 && C > 1 && E1 > 0 && 0 > B1 && B >= A && 0 > D;
    action := Q' = B1, X' = D, W' = D, Y' = -2 + C, R' = E1, S' = F1, P' = C1, H' = B1, J' = 0, T' = 1, U' = -3 + C, I' = 1, G' = -3 + C, Z' = D1, A1' = G1, K' = H1, L' = I1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t13 := {
    from   := f9;
    to     := f5;
    guard  := D1 >= G1 && C > 1 && 0 > E1 && B1 > 0 && B >= A && D > 0;
    action := Q' = B1, X' = D, W' = D, Y' = -2 + C, R' = E1, S' = F1, P' = C1, H' = B1, J' = 0, T' = 1, U' = -3 + C, I' = 1, G' = -3 + C, Z' = D1, A1' = G1, K' = H1, L' = I1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t14 := {
    from   := f9;
    to     := f5;
    guard  := D1 >= G1 && C > 1 && 0 > E1 && B1 > 0 && B >= A && 0 > D;
    action := Q' = B1, X' = D, W' = D, Y' = -2 + C, R' = E1, S' = F1, P' = C1, H' = B1, J' = 0, T' = 1, U' = -3 + C, I' = 1, G' = -3 + C, Z' = D1, A1' = G1, K' = H1, L' = I1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t15 := {
    from   := f9;
    to     := f5;
    guard  := D1 >= G1 && C > 1 && 0 > E1 && 0 > B1 && B >= A && D > 0;
    action := Q' = B1, X' = D, W' = D, Y' = -2 + C, R' = E1, S' = F1, P' = C1, H' = B1, J' = 0, T' = 1, U' = -3 + C, I' = 1, G' = -3 + C, Z' = D1, A1' = G1, K' = H1, L' = I1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t16 := {
    from   := f9;
    to     := f5;
    guard  := D1 >= G1 && C > 1 && 0 > E1 && 0 > B1 && B >= A && 0 > D;
    action := Q' = B1, X' = D, W' = D, Y' = -2 + C, R' = E1, S' = F1, P' = C1, H' = B1, J' = 0, T' = 1, U' = -3 + C, I' = 1, G' = -3 + C, Z' = D1, A1' = G1, K' = H1, L' = I1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t17 := {
    from   := f6;
    to     := f9;
    guard  := true;
    action := D' = B1, B' = 1, Q' = E1, C' = 0, E' = B1, F' = B1, A' = 17, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
}
strategy dumb {
  Region init := { state = f6 };
}
