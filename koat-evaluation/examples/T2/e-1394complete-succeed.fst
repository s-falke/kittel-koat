model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1, N1, O1, P1, Q1, R1, S1, T1, U1, V1, W1, X1, Y1, Z1, A2, B2, C2, D2, E2, F2, G2, H2, I2, J2;
  states f79, f81, f34, f44, f65, f75, f209, f211, f214, f190, f130, f155, f100, f0;
  transition t0 := {
    from   := f79;
    to     := f81;
    guard  := 0 >= A;
    action := G2' = ?, H2' = ?, I2' = ?, J2' = ?;
  };
  transition t1 := {
    from   := f34;
    to     := f34;
    guard  := B > 0 && 0 >= G2;
    action := B' = B - 1, C' = G2, G2' = ?, H2' = ?, I2' = ?, J2' = ?;
  };
  transition t2 := {
    from   := f34;
    to     := f44;
    guard  := 0 >= H2 && B > 0 && G2 > 0;
    action := B' = B - 1, C' = G2, D' = H2, E' = I2, G2' = ?, H2' = ?, I2' = ?, J2' = ?;
  };
  transition t3 := {
    from   := f81;
    to     := f65;
    guard  := 0 >= F;
    action := G2' = ?, H2' = ?, I2' = ?, J2' = ?;
  };
  transition t4 := {
    from   := f65;
    to     := f75;
    guard  := G > 0 && 0 >= H2;
    action := G' = G - 1, F' = G2, H' = H2, I' = I2, G2' = ?, H2' = ?, I2' = ?, J2' = ?;
  };
  transition t5 := {
    from   := f75;
    to     := f79;
    guard  := 0 >= I;
    action := A' = G2, G2' = ?, H2' = ?, I2' = ?, J2' = ?;
  };
  transition t6 := {
    from   := f209;
    to     := f209;
    guard  := true;
    action := G2' = ?, H2' = ?, I2' = ?, J2' = ?;
  };
  transition t7 := {
    from   := f211;
    to     := f214;
    guard  := true;
    action := G2' = ?, H2' = ?, I2' = ?, J2' = ?;
  };
  transition t8 := {
    from   := f190;
    to     := f190;
    guard  := J > 0;
    action := K' = 1, J' = J - 1, L' = 2, M' = 1, G2' = ?, H2' = ?, I2' = ?, J2' = ?;
  };
  transition t9 := {
    from   := f190;
    to     := f209;
    guard  := 0 >= J && N = 2;
    action := O' = 0, N' = 2, P' = G2, G2' = ?, H2' = ?, I2' = ?, J2' = ?;
  };
  transition t10 := {
    from   := f190;
    to     := f209;
    guard  := 1 >= N && 0 >= J;
    action := O' = 0, Q' = 1, P' = G2, G2' = ?, H2' = ?, I2' = ?, J2' = ?;
  };
  transition t11 := {
    from   := f190;
    to     := f209;
    guard  := N > 2 && 0 >= J;
    action := O' = 0, Q' = 1, P' = G2, G2' = ?, H2' = ?, I2' = ?, J2' = ?;
  };
  transition t12 := {
    from   := f130;
    to     := f190;
    guard  := 0 >= G2;
    action := O' = 0, R' = 0, S' = G2, T' = G2, U' = H2, V' = I2, J' = I2, G2' = ?, H2' = ?, I2' = ?, J2' = ?;
  };
  transition t13 := {
    from   := f155;
    to     := f130;
    guard  := W > 0;
    action := R' = 0, N' = 0, X' = W, Y' = W, Z' = 0, A1' = B1, C1' = W, D1' = 0, E1' = W, F1' = B1, G2' = ?, H2' = ?, I2' = ?, J2' = ?;
  };
  transition t14 := {
    from   := f155;
    to     := f130;
    guard  := 0 >= W;
    action := R' = 0, X' = W, G1' = B1, G2' = ?, H2' = ?, I2' = ?, J2' = ?;
  };
  transition t15 := {
    from   := f130;
    to     := f130;
    guard  := G2 > 0 && 0 >= H2;
    action := O' = 0, R' = 0, S' = G2, T' = G2 - 1, H1' = H2, I1' = I2, G2' = ?, H2' = ?, I2' = ?, J2' = ?;
  };
  transition t16 := {
    from   := f130;
    to     := f130;
    guard  := G2 > 0 && H2 > 0;
    action := O' = 0, R' = 0, S' = G2, T' = G2 - 1, H1' = H2, I1' = I2, X' = J2, B1' = 0, J1' = 1, K1' = 0, L1' = 0, G2' = ?, H2' = ?, I2' = ?, J2' = ?;
  };
  transition t17 := {
    from   := f100;
    to     := f130;
    guard  := 0 >= M1;
    action := O' = 0, R' = 0, N1' = G2, G2' = ?, H2' = ?, I2' = ?, J2' = ?;
  };
  transition t18 := {
    from   := f100;
    to     := f100;
    guard  := M1 > 0;
    action := O' = 0, R' = 0, M1' = M1 - 1, O1' = G2, P1' = H2, Q1' = I2, R1' = G2, G2' = ?, H2' = ?, I2' = ?, J2' = ?;
  };
  transition t19 := {
    from   := f81;
    to     := f65;
    guard  := F > 0;
    action := G2' = ?, H2' = ?, I2' = ?, J2' = ?;
  };
  transition t20 := {
    from   := f79;
    to     := f81;
    guard  := A > 0;
    action := G2' = ?, H2' = ?, I2' = ?, J2' = ?;
  };
  transition t21 := {
    from   := f75;
    to     := f79;
    guard  := I > 0;
    action := A' = G2, G2' = ?, H2' = ?, I2' = ?, J2' = ?;
  };
  transition t22 := {
    from   := f65;
    to     := f75;
    guard  := G > 0 && H2 > 0;
    action := G' = G - 1, F' = G2, H' = H2, I' = I2, G2' = ?, H2' = ?, I2' = ?, J2' = ?;
  };
  transition t23 := {
    from   := f65;
    to     := f100;
    guard  := 0 >= G;
    action := O' = 0, R' = 0, S1' = G2, T1' = H2, M1' = H2, G2' = ?, H2' = ?, I2' = ?, J2' = ?;
  };
  transition t24 := {
    from   := f44;
    to     := f34;
    guard  := 0 >= E;
    action := U1' = C, G2' = ?, H2' = ?, I2' = ?, J2' = ?;
  };
  transition t25 := {
    from   := f44;
    to     := f34;
    guard  := E > 0;
    action := U1' = C, G2' = ?, H2' = ?, I2' = ?, J2' = ?;
  };
  transition t26 := {
    from   := f34;
    to     := f44;
    guard  := H2 > 0 && B > 0 && G2 > 0;
    action := B' = B - 1, C' = G2, D' = H2, E' = I2, G2' = ?, H2' = ?, I2' = ?, J2' = ?;
  };
  transition t27 := {
    from   := f34;
    to     := f65;
    guard  := 0 >= B;
    action := O' = 0, R' = 0, V1' = G2, W1' = H2, G' = H2, G2' = ?, H2' = ?, I2' = ?, J2' = ?;
  };
  transition t28 := {
    from   := f0;
    to     := f34;
    guard  := 0 >= H2;
    action := X1' = 0, Y1' = 0, O' = 0, R' = 0, Q' = 0, K' = 0, Z1' = G2, A2' = H2, N' = 0, B2' = 0, C2' = I2, B' = I2, G2' = ?, H2' = ?, I2' = ?, J2' = ?;
  };
  transition t29 := {
    from   := f0;
    to     := f34;
    guard  := H2 > 0;
    action := X1' = 0, Y1' = 0, O' = 0, R' = 0, Q' = 0, K' = 0, Z1' = G2, A2' = H2, D2' = 1, E2' = I2, F2' = 0, N' = 0, B2' = 0, C2' = J2, B' = J2, G2' = ?, H2' = ?, I2' = ?, J2' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
