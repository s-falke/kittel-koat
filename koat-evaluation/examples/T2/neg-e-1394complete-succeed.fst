model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1, N1, O1, P1, Q1, R1, S1, T1, U1, V1, W1, X1, Y1, Z1, A2, B2, C2, D2, E2, F2, G2, H2, I2;
  states f79, f81, f34, f44, f65, f75, f206, f208, f211, f190, f130, f155, f100, f0;
  transition t0 := {
    from   := f79;
    to     := f81;
    guard  := 0 >= A;
    action := F2' = ?, G2' = ?, H2' = ?, I2' = ?;
  };
  transition t1 := {
    from   := f34;
    to     := f34;
    guard  := B > 0 && 0 >= F2;
    action := B' = B - 1, C' = F2, F2' = ?, G2' = ?, H2' = ?, I2' = ?;
  };
  transition t2 := {
    from   := f34;
    to     := f44;
    guard  := 0 >= G2 && B > 0 && F2 > 0;
    action := B' = B - 1, C' = F2, D' = G2, E' = H2, F2' = ?, G2' = ?, H2' = ?, I2' = ?;
  };
  transition t3 := {
    from   := f81;
    to     := f65;
    guard  := 0 >= F;
    action := F2' = ?, G2' = ?, H2' = ?, I2' = ?;
  };
  transition t4 := {
    from   := f65;
    to     := f75;
    guard  := G > 0 && 0 >= G2;
    action := G' = G - 1, F' = F2, H' = G2, I' = H2, F2' = ?, G2' = ?, H2' = ?, I2' = ?;
  };
  transition t5 := {
    from   := f75;
    to     := f79;
    guard  := 0 >= I;
    action := A' = F2, F2' = ?, G2' = ?, H2' = ?, I2' = ?;
  };
  transition t6 := {
    from   := f206;
    to     := f206;
    guard  := true;
    action := F2' = ?, G2' = ?, H2' = ?, I2' = ?;
  };
  transition t7 := {
    from   := f208;
    to     := f211;
    guard  := true;
    action := F2' = ?, G2' = ?, H2' = ?, I2' = ?;
  };
  transition t8 := {
    from   := f190;
    to     := f190;
    guard  := J > 0;
    action := K' = 1, J' = J - 1, L' = 1, F2' = ?, G2' = ?, H2' = ?, I2' = ?;
  };
  transition t9 := {
    from   := f190;
    to     := f206;
    guard  := 0 >= J && M = 2;
    action := N' = 0, M' = 2, O' = F2, F2' = ?, G2' = ?, H2' = ?, I2' = ?;
  };
  transition t10 := {
    from   := f190;
    to     := f206;
    guard  := 1 >= M && 0 >= J;
    action := N' = 0, P' = 0, O' = F2, F2' = ?, G2' = ?, H2' = ?, I2' = ?;
  };
  transition t11 := {
    from   := f190;
    to     := f206;
    guard  := M > 2 && 0 >= J;
    action := N' = 0, P' = 0, O' = F2, F2' = ?, G2' = ?, H2' = ?, I2' = ?;
  };
  transition t12 := {
    from   := f130;
    to     := f190;
    guard  := 0 >= F2;
    action := N' = 0, Q' = 0, R' = F2, S' = F2, T' = G2, U' = H2, J' = H2, F2' = ?, G2' = ?, H2' = ?, I2' = ?;
  };
  transition t13 := {
    from   := f155;
    to     := f130;
    guard  := V > 0;
    action := Q' = 0, M' = 0, W' = V, X' = V, Y' = 0, Z' = A1, B1' = V, C1' = 0, D1' = V, E1' = A1, F2' = ?, G2' = ?, H2' = ?, I2' = ?;
  };
  transition t14 := {
    from   := f155;
    to     := f130;
    guard  := 0 >= V;
    action := Q' = 0, W' = V, F1' = A1, F2' = ?, G2' = ?, H2' = ?, I2' = ?;
  };
  transition t15 := {
    from   := f130;
    to     := f130;
    guard  := F2 > 0 && 0 >= G2;
    action := N' = 0, Q' = 0, R' = F2, S' = F2 - 1, G1' = G2, H1' = H2, F2' = ?, G2' = ?, H2' = ?, I2' = ?;
  };
  transition t16 := {
    from   := f130;
    to     := f130;
    guard  := F2 > 0 && G2 > 0;
    action := N' = 0, Q' = 0, R' = F2, S' = F2 - 1, G1' = G2, H1' = H2, W' = I2, A1' = 0, I1' = 1, J1' = 0, K1' = 0, F2' = ?, G2' = ?, H2' = ?, I2' = ?;
  };
  transition t17 := {
    from   := f100;
    to     := f130;
    guard  := 0 >= L1;
    action := N' = 0, Q' = 0, M1' = F2, F2' = ?, G2' = ?, H2' = ?, I2' = ?;
  };
  transition t18 := {
    from   := f100;
    to     := f100;
    guard  := L1 > 0;
    action := N' = 0, Q' = 0, L1' = L1 - 1, N1' = F2, O1' = G2, P1' = H2, Q1' = F2, F2' = ?, G2' = ?, H2' = ?, I2' = ?;
  };
  transition t19 := {
    from   := f81;
    to     := f65;
    guard  := F > 0;
    action := F2' = ?, G2' = ?, H2' = ?, I2' = ?;
  };
  transition t20 := {
    from   := f79;
    to     := f81;
    guard  := A > 0;
    action := F2' = ?, G2' = ?, H2' = ?, I2' = ?;
  };
  transition t21 := {
    from   := f75;
    to     := f79;
    guard  := I > 0;
    action := A' = F2, F2' = ?, G2' = ?, H2' = ?, I2' = ?;
  };
  transition t22 := {
    from   := f65;
    to     := f75;
    guard  := G > 0 && G2 > 0;
    action := G' = G - 1, F' = F2, H' = G2, I' = H2, F2' = ?, G2' = ?, H2' = ?, I2' = ?;
  };
  transition t23 := {
    from   := f65;
    to     := f100;
    guard  := 0 >= G;
    action := N' = 0, Q' = 0, R1' = F2, S1' = G2, L1' = G2, F2' = ?, G2' = ?, H2' = ?, I2' = ?;
  };
  transition t24 := {
    from   := f44;
    to     := f34;
    guard  := 0 >= E;
    action := T1' = C, F2' = ?, G2' = ?, H2' = ?, I2' = ?;
  };
  transition t25 := {
    from   := f44;
    to     := f34;
    guard  := E > 0;
    action := T1' = C, F2' = ?, G2' = ?, H2' = ?, I2' = ?;
  };
  transition t26 := {
    from   := f34;
    to     := f44;
    guard  := G2 > 0 && B > 0 && F2 > 0;
    action := B' = B - 1, C' = F2, D' = G2, E' = H2, F2' = ?, G2' = ?, H2' = ?, I2' = ?;
  };
  transition t27 := {
    from   := f34;
    to     := f65;
    guard  := 0 >= B;
    action := N' = 0, Q' = 0, U1' = F2, V1' = G2, G' = G2, F2' = ?, G2' = ?, H2' = ?, I2' = ?;
  };
  transition t28 := {
    from   := f0;
    to     := f34;
    guard  := 0 >= G2;
    action := W1' = 0, X1' = 0, N' = 0, Q' = 0, P' = 0, K' = 0, Y1' = F2, Z1' = G2, M' = 0, A2' = 0, B2' = H2, B' = H2, F2' = ?, G2' = ?, H2' = ?, I2' = ?;
  };
  transition t29 := {
    from   := f0;
    to     := f34;
    guard  := G2 > 0;
    action := W1' = 0, X1' = 0, N' = 0, Q' = 0, P' = 0, K' = 0, Y1' = F2, Z1' = G2, C2' = 1, D2' = H2, E2' = 0, M' = 0, A2' = 0, B2' = I2, B' = I2, F2' = ?, G2' = ?, H2' = ?, I2' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
