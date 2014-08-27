model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y;
  states f300, f1, f3, f2;
  transition t0 := {
    from   := f300;
    to     := f1;
    guard  := true;
    action := A' = S, B' = T, C' = U, D' = V, E' = W, S' = ?, T' = ?, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?;
  };
  transition t1 := {
    from   := f1;
    to     := f1;
    guard  := G > F && X > 0 && H = 256;
    action := I' = S, J' = T, K' = U, L' = V, M' = W, N' = Y, H' = 256, S' = ?, T' = ?, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?;
  };
  transition t2 := {
    from   := f1;
    to     := f1;
    guard  := G > F && 0 >= H;
    action := I' = S, J' = T, K' = U, L' = V, M' = W, S' = ?, T' = ?, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?;
  };
  transition t3 := {
    from   := f1;
    to     := f3;
    guard  := F >= G;
    action := O' = 0, P' = 0, I' = S, J' = T, Q' = 0, S' = ?, T' = ?, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?;
  };
  transition t4 := {
    from   := f1;
    to     := f2;
    guard  := H > 0 && G > F && H > 256;
    action := O' = H, P' = H, I' = S, J' = T, Q' = H, K' = U, L' = V, M' = W, N' = Y, R' = X, S' = ?, T' = ?, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?;
  };
  transition t5 := {
    from   := f1;
    to     := f2;
    guard  := H > 0 && G > F && 255 >= H;
    action := O' = H, P' = H, I' = S, J' = T, Q' = H, K' = U, L' = V, M' = W, N' = Y, R' = X, S' = ?, T' = ?, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?;
  };
}
strategy dumb {
  Region init := { state = f300 };
}
