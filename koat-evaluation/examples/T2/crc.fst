model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1;
  states f0, f36, f17, f23, f42, f56, f85, f66, f72, f91, f106;
  transition t0 := {
    from   := f0;
    to     := f36;
    guard  := 0 > A;
    action := B' = 40, C' = 0, D' = 40, E' = 0, F' = 1, G' = 0, G1' = ?, H1' = ?;
  };
  transition t1 := {
    from   := f0;
    to     := f36;
    guard  := A > 0;
    action := B' = 40, C' = 0, D' = 40, E' = 0, F' = 1, G' = 0, G1' = ?, H1' = ?;
  };
  transition t2 := {
    from   := f0;
    to     := f17;
    guard  := A = 0;
    action := B' = 40, C' = 0, D' = 40, E' = 0, F' = 1, G' = 0, A' = 1, H' = 0, G1' = ?, H1' = ?;
  };
  transition t3 := {
    from   := f17;
    to     := f23;
    guard  := 255 >= H;
    action := I' = G1, J' = 0, K' = H1, L' = 0, G1' = ?, H1' = ?;
  };
  transition t4 := {
    from   := f23;
    to     := f23;
    guard  := 7 >= L;
    action := K' = G1, L' = L + 1, G1' = ?, H1' = ?;
  };
  transition t5 := {
    from   := f36;
    to     := f42;
    guard  := E >= 0;
    action := G' = G1, H' = 1, G1' = ?, H1' = ?;
  };
  transition t6 := {
    from   := f36;
    to     := f42;
    guard  := 0 > E && F >= 0;
    action := H' = 1, G1' = ?, H1' = ?;
  };
  transition t7 := {
    from   := f36;
    to     := f42;
    guard  := 0 > E && 0 > F;
    action := G' = G1, H' = 1, G1' = ?, H1' = ?;
  };
  transition t8 := {
    from   := f42;
    to     := f42;
    guard  := 0 > F && D >= H;
    action := G' = G1, H' = H + 1, M' = H1, G1' = ?, H1' = ?;
  };
  transition t9 := {
    from   := f42;
    to     := f42;
    guard  := F >= 0 && D >= H;
    action := G' = G1, H' = H + 1, M' = H1, G1' = ?, H1' = ?;
  };
  transition t10 := {
    from   := f56;
    to     := f85;
    guard  := 0 > A;
    action := N' = O, P' = O, Q' = B + 2, R' = 0, S' = 1, T' = O, G1' = ?, H1' = ?;
  };
  transition t11 := {
    from   := f56;
    to     := f85;
    guard  := A > 0;
    action := N' = O, P' = O, Q' = B + 2, R' = 0, S' = 1, T' = O, G1' = ?, H1' = ?;
  };
  transition t12 := {
    from   := f56;
    to     := f66;
    guard  := A = 0;
    action := A' = 1, N' = O, P' = O, Q' = B + 2, R' = 0, S' = 1, T' = O, U' = 0, G1' = ?, H1' = ?;
  };
  transition t13 := {
    from   := f66;
    to     := f72;
    guard  := 255 >= U;
    action := V' = G1, W' = 0, X' = H1, Y' = 0, G1' = ?, H1' = ?;
  };
  transition t14 := {
    from   := f72;
    to     := f72;
    guard  := 7 >= Y;
    action := X' = G1, Y' = Y + 1, G1' = ?, H1' = ?;
  };
  transition t15 := {
    from   := f85;
    to     := f91;
    guard  := R >= 0;
    action := T' = G1, U' = 1, G1' = ?, H1' = ?;
  };
  transition t16 := {
    from   := f85;
    to     := f91;
    guard  := 0 > R && S >= 0;
    action := U' = 1, G1' = ?, H1' = ?;
  };
  transition t17 := {
    from   := f85;
    to     := f91;
    guard  := 0 > R && 0 > S;
    action := T' = G1, U' = 1, G1' = ?, H1' = ?;
  };
  transition t18 := {
    from   := f91;
    to     := f91;
    guard  := 0 > S && Q >= U;
    action := T' = G1, U' = U + 1, Z' = H1, G1' = ?, H1' = ?;
  };
  transition t19 := {
    from   := f91;
    to     := f91;
    guard  := S >= 0 && Q >= U;
    action := T' = G1, U' = U + 1, Z' = H1, G1' = ?, H1' = ?;
  };
  transition t20 := {
    from   := f91;
    to     := f106;
    guard  := S >= 0 && U > Q;
    action := A1' = T, B1' = T, C1' = T, G1' = ?, H1' = ?;
  };
  transition t21 := {
    from   := f91;
    to     := f106;
    guard  := 0 > S && U > Q;
    action := A1' = G1, B1' = G1, C1' = G1, G1' = ?, H1' = ?;
  };
  transition t22 := {
    from   := f72;
    to     := f66;
    guard  := Y > 7;
    action := U' = U + 1, D1' = X, G1' = ?, H1' = ?;
  };
  transition t23 := {
    from   := f66;
    to     := f85;
    guard  := U > 255;
    action := G1' = ?, H1' = ?;
  };
  transition t24 := {
    from   := f42;
    to     := f56;
    guard  := F >= 0 && H > D;
    action := E1' = G, O' = G, G1' = ?, H1' = ?;
  };
  transition t25 := {
    from   := f42;
    to     := f56;
    guard  := 0 > F && H > D;
    action := E1' = G1, O' = G1, G1' = ?, H1' = ?;
  };
  transition t26 := {
    from   := f23;
    to     := f17;
    guard  := L > 7;
    action := H' = H + 1, F1' = K, G1' = ?, H1' = ?;
  };
  transition t27 := {
    from   := f17;
    to     := f36;
    guard  := H > 255;
    action := G1' = ?, H1' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
