model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1, N1, O1, P1;
  states f11, f6, f26;
  transition t0 := {
    from   := f11;
    to     := f11;
    guard  := A > B;
    action := C' = B, D' = B, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?;
  };
  transition t1 := {
    from   := f11;
    to     := f11;
    guard  := B > A;
    action := C' = B, D' = B, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?;
  };
  transition t2 := {
    from   := f6;
    to     := f6;
    guard  := E > F && G >= 0 && H > 0;
    action := G' = 1 + G, I' = 1 + G, J' = -1 + H, H' = -1 + H, K' = F1, L' = G1, F' = H1, M' = -1 + H, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?;
  };
  transition t3 := {
    from   := f6;
    to     := f6;
    guard  := F > E && G >= 0 && H > 0;
    action := G' = 1 + G, I' = 1 + G, J' = -1 + H, H' = -1 + H, K' = F1, L' = G1, F' = H1, M' = -1 + H, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?;
  };
  transition t4 := {
    from   := f26;
    to     := f6;
    guard  := E > I1;
    action := N' = F1, G' = 1, O' = 2, P' = 3, Q' = G1, R' = H1, S' = 4, T' = J1, U' = 0, V' = K1, I' = 1, J' = 4, H' = 4, F' = L1, W' = M1, X' = M1, Y' = M1, Z' = M1, A1' = N1, B1' = O1, C1' = P1, D1' = 4, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?;
  };
  transition t5 := {
    from   := f26;
    to     := f6;
    guard  := I1 > E;
    action := N' = F1, G' = 1, O' = 2, P' = 3, Q' = G1, R' = H1, S' = 4, T' = J1, U' = 0, V' = K1, I' = 1, J' = 4, H' = 4, F' = L1, W' = M1, X' = M1, Y' = M1, Z' = M1, A1' = N1, B1' = O1, C1' = P1, D1' = 4, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?;
  };
  transition t6 := {
    from   := f6;
    to     := f11;
    guard  := A > J1 && G >= 0 && H > 0 && F = E;
    action := N' = F1, Z' = G1, E1' = H1, B' = J1, C' = J1, E' = F, D' = J1, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?;
  };
  transition t7 := {
    from   := f6;
    to     := f11;
    guard  := J1 > A && G >= 0 && H > 0 && F = E;
    action := N' = F1, Z' = G1, E1' = H1, B' = J1, C' = J1, E' = F, D' = J1, F1' = ?, G1' = ?, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?, N1' = ?, O1' = ?, P1' = ?;
  };
}
strategy dumb {
  Region init := { state = f26 };
}
