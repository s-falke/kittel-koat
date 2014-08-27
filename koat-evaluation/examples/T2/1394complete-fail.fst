model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1, N1, O1, P1, Q1, R1, S1, T1, U1, V1, W1, X1, Y1, Z1, A2, B2, C2, D2, E2, F2, G2, H2, I2, J2, K2, L2, M2, N2, O2, P2;
  states f79, f81, f34, f44, f65, f75, f216, f218, f221, f191, f130, f156, f100, f0;
  transition t0 := {
    from   := f79;
    to     := f81;
    guard  := 0 >= A;
    action := L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t1 := {
    from   := f34;
    to     := f34;
    guard  := B > 0 && 0 >= L2;
    action := B' = B - 1, C' = L2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t2 := {
    from   := f34;
    to     := f44;
    guard  := 0 >= M2 && B > 0 && L2 > 0;
    action := B' = B - 1, C' = L2, D' = M2, E' = N2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t3 := {
    from   := f81;
    to     := f65;
    guard  := 0 >= F;
    action := L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t4 := {
    from   := f65;
    to     := f75;
    guard  := G > 0 && 0 >= M2;
    action := G' = G - 1, F' = L2, H' = M2, I' = N2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t5 := {
    from   := f75;
    to     := f79;
    guard  := 0 >= I;
    action := A' = L2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t6 := {
    from   := f216;
    to     := f216;
    guard  := true;
    action := L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t7 := {
    from   := f218;
    to     := f221;
    guard  := true;
    action := L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t8 := {
    from   := f191;
    to     := f191;
    guard  := J > 0;
    action := K' = 1, J' = J - 1, L' = 0, M' = L2, N' = 0, O' = 0, P' = 2, Q' = L2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t9 := {
    from   := f191;
    to     := f216;
    guard  := 0 >= J && R = 2;
    action := S' = 0, R' = 2, T' = L2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t10 := {
    from   := f191;
    to     := f216;
    guard  := 1 >= R && 0 >= J;
    action := S' = 0, U' = 1, T' = L2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t11 := {
    from   := f191;
    to     := f216;
    guard  := R > 2 && 0 >= J;
    action := S' = 0, U' = 1, T' = L2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t12 := {
    from   := f130;
    to     := f191;
    guard  := 0 >= L2;
    action := S' = 0, V' = 0, W' = L2, X' = L2, Y' = M2, Z' = N2, J' = N2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t13 := {
    from   := f156;
    to     := f130;
    guard  := A1 > 0;
    action := V' = 0, R' = 0, B1' = A1, C1' = A1, D1' = 0, E1' = F1, G1' = A1, H1' = 0, I1' = A1, J1' = F1, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t14 := {
    from   := f156;
    to     := f130;
    guard  := 0 >= A1;
    action := V' = 0, B1' = A1, K1' = F1, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t15 := {
    from   := f130;
    to     := f130;
    guard  := L2 > 0 && 0 >= M2;
    action := S' = 0, V' = 0, W' = L2, X' = L2 - 1, L1' = M2, M1' = N2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t16 := {
    from   := f130;
    to     := f130;
    guard  := L2 > 0 && M2 > 0;
    action := S' = 0, V' = 0, W' = L2, X' = L2 - 1, L1' = M2, M1' = N2, B1' = O2, F1' = 0, N1' = P2, O1' = P2, P1' = 0, Q1' = 0, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t17 := {
    from   := f100;
    to     := f130;
    guard  := 0 >= R1;
    action := S' = 0, V' = 0, S1' = L2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t18 := {
    from   := f100;
    to     := f100;
    guard  := R1 > 0;
    action := S' = 0, V' = 0, R1' = R1 - 1, T1' = L2, U1' = M2, V1' = N2, W1' = L2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t19 := {
    from   := f81;
    to     := f65;
    guard  := F > 0;
    action := L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t20 := {
    from   := f79;
    to     := f81;
    guard  := A > 0;
    action := L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t21 := {
    from   := f75;
    to     := f79;
    guard  := I > 0;
    action := A' = L2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t22 := {
    from   := f65;
    to     := f75;
    guard  := G > 0 && M2 > 0;
    action := G' = G - 1, F' = L2, H' = M2, I' = N2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t23 := {
    from   := f65;
    to     := f100;
    guard  := 0 >= G;
    action := S' = 0, V' = 0, X1' = L2, Y1' = M2, R1' = M2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t24 := {
    from   := f44;
    to     := f34;
    guard  := 0 >= E;
    action := Z1' = C, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t25 := {
    from   := f44;
    to     := f34;
    guard  := E > 0;
    action := Z1' = C, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t26 := {
    from   := f34;
    to     := f44;
    guard  := M2 > 0 && B > 0 && L2 > 0;
    action := B' = B - 1, C' = L2, D' = M2, E' = N2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t27 := {
    from   := f34;
    to     := f65;
    guard  := 0 >= B;
    action := S' = 0, V' = 0, A2' = L2, B2' = M2, G' = M2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t28 := {
    from   := f0;
    to     := f34;
    guard  := 0 >= M2;
    action := C2' = 0, D2' = 0, S' = 0, V' = 0, U' = 0, K' = 0, E2' = L2, F2' = M2, R' = 0, G2' = 0, H2' = N2, B' = N2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
  transition t29 := {
    from   := f0;
    to     := f34;
    guard  := M2 > 0;
    action := C2' = 0, D2' = 0, S' = 0, V' = 0, U' = 0, K' = 0, E2' = L2, F2' = M2, I2' = N2, J2' = O2, K2' = 0, R' = 0, G2' = 0, H2' = P2, B' = P2, L2' = ?, M2' = ?, N2' = ?, O2' = ?, P2' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
