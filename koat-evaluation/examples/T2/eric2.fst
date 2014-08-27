model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1;
  states f1, f2, f999;
  transition t0 := {
    from   := f1;
    to     := f2;
    guard  := A > 0 && B > 0;
    action := C' = 0, B' = 0, A' = 0, D' = D + C, E' = E + B - 1, F' = F + A - 1, G' = G + 1, D1' = ?;
  };
  transition t1 := {
    from   := f999;
    to     := f1;
    guard  := H > 0 && C = 0 && B = 0 && A = 0 && D = 0 && E = 0 && F = 0 && G = 0 && I = 0 && J = 0 && K = 0 && L = 0 && M = 0 && N = 0 && O = 0 && P = 0 && Q = 0 && R = 0 && S = 0 && T = 0 && U = 0 && V = 0 && W = 0 && X = 0 && Y = 0 && Z = 0 && A1 = 0 && B1 = 0;
    action := H' = 0, C' = H - 1, B' = 1, A' = 1, D' = 0, E' = 0, F' = 0, G' = 0, I' = 0, J' = 0, K' = 0, L' = 0, M' = 0, N' = 0, O' = 0, P' = 0, Q' = 0, R' = 0, S' = 0, T' = 0, U' = 0, V' = 0, W' = 0, X' = 0, Y' = 0, Z' = 0, A1' = 0, B1' = 0, D1' = ?;
  };
  transition t2 := {
    from   := f1;
    to     := f1;
    guard  := H + C > 0;
    action := H' = 0, C' = H + C - 1, B' = B + 1, A' = A + 1, D1' = ?;
  };
  transition t3 := {
    from   := f2;
    to     := f1;
    guard  := H + D > 0;
    action := H' = 0, C' = C + H + D - 1, B' = B + 1, A' = A + 1, D' = 0, D1' = ?;
  };
  transition t4 := {
    from   := f2;
    to     := f2;
    guard  := D > 0;
    action := D' = I + D - 1, E' = K + E, F' = M + F, G' = N + G, I' = 0, J' = J + 1, K' = 0, L' = L + 1, M' = 0, N' = 0, D1' = ?;
  };
  transition t5 := {
    from   := f2;
    to     := f1;
    guard  := D > 0;
    action := C' = C + I + D - 1, B' = B + J + 1, A' = A + L + 1, D' = 0, E' = 0, F' = 0, G' = 0, I' = 0, J' = 0, K' = K + E, L' = 0, M' = M + F, N' = N + G, D1' = ?;
  };
  transition t6 := {
    from   := f2;
    to     := f1;
    guard  := H + I + D > 1 && D > 0;
    action := H' = 0, C' = C + H + I + D - 2, B' = B + 1, A' = A + 1, D' = 0, E' = 0, F' = 0, G' = 0, I' = 0, J' = J + 1, K' = K + E, L' = L + 1, M' = M + F, N' = N + G, D1' = ?;
  };
  transition t7 := {
    from   := f1;
    to     := f1;
    guard  := C > 0;
    action := C' = O + C - 1, B' = P + B + Q + 1, A' = R + A + S + 1, O' = 0, P' = 0, Q' = 0, R' = 0, S' = 0, D1' = ?;
  };
  transition t8 := {
    from   := f2;
    to     := f2;
    guard  := G > 0 && F >= C1 && C1 > 0 && E >= C1;
    action := D' = T + D + U + 1, E' = V + E + W - 1, F' = X + F + Z + B1, G' = Y + G + A1, T' = 0, U' = 0, V' = 0, W' = 0, X' = 0, Y' = 0, Z' = 0, A1' = 0, B1' = 0, C1' = D1, D1' = ?;
  };
}
strategy dumb {
  Region init := { state = f999 };
}
