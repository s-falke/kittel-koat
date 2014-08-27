model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1, N1, O1, P1, Q1, R1, S1, T1, U1, V1, W1, X1, Y1, Z1, A2, B2, C2, D2, E2, F2, G2, H2, I2, J2, K2, L2, M2, N2, O2;
  states f79, f81, f34, f44, f65, f75, f213, f215, f218, f191, f130, f156, f100, f0;
  transition t0 := {
    from   := f79;
    to     := f81;
    guard  := 0 >= A;
    action := K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?;
  };
  transition t1 := {
    from   := f34;
    to     := f34;
    guard  := B > 0 && 0 >= K2;
    action := B' = B - 1, C' = K2, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?;
  };
  transition t2 := {
    from   := f34;
    to     := f44;
    guard  := 0 >= L2 && B > 0 && K2 > 0;
    action := B' = B - 1, C' = K2, D' = L2, E' = M2, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?;
  };
  transition t3 := {
    from   := f81;
    to     := f65;
    guard  := 0 >= F;
    action := K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?;
  };
  transition t4 := {
    from   := f65;
    to     := f75;
    guard  := G > 0 && 0 >= L2;
    action := G' = G - 1, F' = K2, H' = L2, I' = M2, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?;
  };
  transition t5 := {
    from   := f75;
    to     := f79;
    guard  := 0 >= I;
    action := A' = K2, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?;
  };
  transition t6 := {
    from   := f213;
    to     := f213;
    guard  := true;
    action := K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?;
  };
  transition t7 := {
    from   := f215;
    to     := f218;
    guard  := true;
    action := K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?;
  };
  transition t8 := {
    from   := f191;
    to     := f191;
    guard  := J > 0;
    action := K' = 1, J' = J - 1, L' = 0, M' = K2, N' = 0, O' = 0, P' = K2, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?;
  };
  transition t9 := {
    from   := f191;
    to     := f213;
    guard  := 0 >= J && Q = 2;
    action := R' = 0, Q' = 2, S' = K2, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?;
  };
  transition t10 := {
    from   := f191;
    to     := f213;
    guard  := 1 >= Q && 0 >= J;
    action := R' = 0, T' = 1, S' = K2, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?;
  };
  transition t11 := {
    from   := f191;
    to     := f213;
    guard  := Q > 2 && 0 >= J;
    action := R' = 0, T' = 1, S' = K2, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?;
  };
  transition t12 := {
    from   := f130;
    to     := f191;
    guard  := 0 >= K2;
    action := R' = 0, U' = 0, V' = K2, W' = K2, X' = L2, Y' = M2, J' = M2, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?;
  };
  transition t13 := {
    from   := f156;
    to     := f130;
    guard  := Z > 0;
    action := U' = 0, Q' = 0, A1' = Z, B1' = Z, C1' = 0, D1' = E1, F1' = Z, G1' = 0, H1' = Z, I1' = E1, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?;
  };
  transition t14 := {
    from   := f156;
    to     := f130;
    guard  := 0 >= Z;
    action := U' = 0, A1' = Z, J1' = E1, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?;
  };
  transition t15 := {
    from   := f130;
    to     := f130;
    guard  := K2 > 0 && 0 >= L2;
    action := R' = 0, U' = 0, V' = K2, W' = K2 - 1, K1' = L2, L1' = M2, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?;
  };
  transition t16 := {
    from   := f130;
    to     := f130;
    guard  := K2 > 0 && L2 > 0;
    action := R' = 0, U' = 0, V' = K2, W' = K2 - 1, K1' = L2, L1' = M2, A1' = N2, E1' = 0, M1' = O2, N1' = O2, O1' = 0, P1' = 0, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?;
  };
  transition t17 := {
    from   := f100;
    to     := f130;
    guard  := 0 >= Q1;
    action := R' = 0, U' = 0, R1' = K2, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?;
  };
  transition t18 := {
    from   := f100;
    to     := f100;
    guard  := Q1 > 0;
    action := R' = 0, U' = 0, Q1' = Q1 - 1, S1' = K2, T1' = L2, U1' = M2, V1' = K2, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?;
  };
  transition t19 := {
    from   := f81;
    to     := f65;
    guard  := F > 0;
    action := K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?;
  };
  transition t20 := {
    from   := f79;
    to     := f81;
    guard  := A > 0;
    action := K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?;
  };
  transition t21 := {
    from   := f75;
    to     := f79;
    guard  := I > 0;
    action := A' = K2, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?;
  };
  transition t22 := {
    from   := f65;
    to     := f75;
    guard  := G > 0 && L2 > 0;
    action := G' = G - 1, F' = K2, H' = L2, I' = M2, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?;
  };
  transition t23 := {
    from   := f65;
    to     := f100;
    guard  := 0 >= G;
    action := R' = 0, U' = 0, W1' = K2, X1' = L2, Q1' = L2, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?;
  };
  transition t24 := {
    from   := f44;
    to     := f34;
    guard  := 0 >= E;
    action := Y1' = C, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?;
  };
  transition t25 := {
    from   := f44;
    to     := f34;
    guard  := E > 0;
    action := Y1' = C, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?;
  };
  transition t26 := {
    from   := f34;
    to     := f44;
    guard  := L2 > 0 && B > 0 && K2 > 0;
    action := B' = B - 1, C' = K2, D' = L2, E' = M2, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?;
  };
  transition t27 := {
    from   := f34;
    to     := f65;
    guard  := 0 >= B;
    action := R' = 0, U' = 0, Z1' = K2, A2' = L2, G' = L2, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?;
  };
  transition t28 := {
    from   := f0;
    to     := f34;
    guard  := 0 >= L2;
    action := B2' = 0, C2' = 0, R' = 0, U' = 0, T' = 0, K' = 0, D2' = K2, E2' = L2, Q' = 0, F2' = 0, G2' = M2, B' = M2, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?;
  };
  transition t29 := {
    from   := f0;
    to     := f34;
    guard  := L2 > 0;
    action := B2' = 0, C2' = 0, R' = 0, U' = 0, T' = 0, K' = 0, D2' = K2, E2' = L2, H2' = M2, I2' = N2, J2' = 0, Q' = 0, F2' = 0, G2' = O2, B' = O2, K2' = ?, L2' = ?, M2' = ?, N2' = ?, O2' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
