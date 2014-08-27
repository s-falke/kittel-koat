model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1;
  states f9, f5, f0, f12, f6;
  transition t0 := {
    from   := f9;
    to     := f9;
    guard  := A > B && C >= 0;
    action := D' = S, B' = 1 + B, C' = 1 + C, S' = ?, T' = ?, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?;
  };
  transition t1 := {
    from   := f5;
    to     := f0;
    guard  := U > T && E > 0 && F >= 0;
    action := G' = S, H' = G, I' = V, J' = W, K' = X, S' = ?, T' = ?, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?;
  };
  transition t2 := {
    from   := f5;
    to     := f5;
    guard  := T >= U && E >= 0 && F >= 0 && H = 0;
    action := L' = M, M' = N, O' = S, N' = V, G' = M, H' = 0, E' = 1 + E, F' = -1 + F, P' = E, I' = W, J' = X, S' = ?, T' = ?, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?;
  };
  transition t3 := {
    from   := f5;
    to     := f12;
    guard  := X >= T && E >= 0 && F >= 0 && N = 0 && H = 0;
    action := L' = M, Q' = S, N' = 0, H' = 0, P' = E, I' = V, J' = W, S' = ?, T' = ?, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?;
  };
  transition t4 := {
    from   := f9;
    to     := f5;
    guard  := C > 1 && B >= A && Y >= Z;
    action := L' = S, Q' = D, R' = -2 + C, M' = V, O' = W, N' = X, G' = S, H' = 0, E' = 1, F' = T - 3 + C, I' = U, J' = A1, S' = ?, T' = ?, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?;
  };
  transition t5 := {
    from   := f6;
    to     := f9;
    guard  := true;
    action := D' = S, B' = 1, L' = V, C' = 0, A' = 17, S' = ?, T' = ?, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?;
  };
}
strategy dumb {
  Region init := { state = f6 };
}
