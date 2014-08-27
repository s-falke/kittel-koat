model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1;
  states f8, f2, f23;
  transition t0 := {
    from   := f8;
    to     := f8;
    guard  := A > B;
    action := C' = B, D' = B, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?;
  };
  transition t1 := {
    from   := f8;
    to     := f8;
    guard  := B > A;
    action := C' = B, D' = B, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?;
  };
  transition t2 := {
    from   := f2;
    to     := f2;
    guard  := E > F && G > 0 && H >= 0;
    action := F' = B1, H' = 1 + H, I' = 1 + H, J' = -1 + G, G' = -1 + G, K' = C1, L' = D1, M' = -1 + G, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?;
  };
  transition t3 := {
    from   := f2;
    to     := f2;
    guard  := F > E && G > 0 && H >= 0;
    action := F' = B1, H' = 1 + H, I' = 1 + H, J' = -1 + G, G' = -1 + G, K' = C1, L' = D1, M' = -1 + G, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?;
  };
  transition t4 := {
    from   := f23;
    to     := f2;
    guard  := E > E1;
    action := F' = B1, N' = 2, H' = 1, O' = C1, P' = D1, Q' = F1, R' = G1, S' = G1, T' = G1, U' = G1, I' = 1, J' = 2, G' = 2, V' = H1, W' = I1, X' = 2, Y' = J1, Z' = 0, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?;
  };
  transition t5 := {
    from   := f23;
    to     := f2;
    guard  := E1 > E;
    action := F' = B1, N' = 2, H' = 1, O' = C1, P' = D1, Q' = F1, R' = G1, S' = G1, T' = G1, U' = G1, I' = 1, J' = 2, G' = 2, V' = H1, W' = I1, X' = 2, Y' = J1, Z' = 0, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?;
  };
  transition t6 := {
    from   := f2;
    to     := f8;
    guard  := A > C1 && G > 0 && H >= 0 && F = E;
    action := Q' = B1, C' = C1, D' = C1, B' = C1, U' = D1, A1' = F1, E' = F, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?;
  };
  transition t7 := {
    from   := f2;
    to     := f8;
    guard  := C1 > A && G > 0 && H >= 0 && F = E;
    action := Q' = B1, C' = C1, D' = C1, B' = C1, U' = D1, A1' = F1, E' = F, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?;
  };
}
strategy dumb {
  Region init := { state = f23 };
}
