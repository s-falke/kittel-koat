model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1, N1, O1, P1, Q1, R1, S1, T1, U1, V1, W1, X1, Y1, Z1, A2, B2, C2, D2, E2, F2, G2, H2, I2, J2, K2, L2, M2, N2, O2, P2, Q2, R2, S2, T2, U2, V2, W2, X2, Y2, Z2, A3, B3, C3, D3, E3, F3, G3, H3, I3, J3, K3, L3, M3, N3, O3, P3, Q3, R3, S3, T3, U3, V3, W3, X3, Y3, Z3, A4, B4, C4, D4, E4, F4, G4, H4, I4, J4, K4, L4, M4, N4, O4, P4, Q4, R4, S4, T4, U4, V4, W4, X4, Y4, Z4, A5, B5, C5, D5, E5, F5, G5, H5, I5, J5, K5, L5, M5, N5, O5, P5, Q5, R5, S5, T5, U5, V5, W5, X5, Y5, Z5, A6, B6, C6, D6, E6, F6, G6, H6, I6, J6, K6, L6, M6, N6, O6, P6, Q6;
  states f38, f17, f19, f34, f50, f16, f0, f33, f35, f36, f10, f1, f2, f14;
  transition t0 := {
    from   := f38;
    to     := f17;
    guard  := B6 > A && B > C;
    action := D' = B, E' = C, F' = -G + C6, H' = C6, I' = -G + C6, J' = C6, K' = D6, L' = B6, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?, M6' = ?, N6' = ?, O6' = ?, P6' = ?, Q6' = ?;
  };
  transition t1 := {
    from   := f19;
    to     := f34;
    guard  := C6 > M && N > O;
    action := D' = N, E' = O, P' = Q, R' = C6, Q' = D6, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?, M6' = ?, N6' = ?, O6' = ?, P6' = ?, Q6' = ?;
  };
  transition t2 := {
    from   := f50;
    to     := f34;
    guard  := D6 > S && T > U;
    action := D' = T, E' = U, P' = C6, V' = D6, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?, M6' = ?, N6' = ?, O6' = ?, P6' = ?, Q6' = ?;
  };
  transition t3 := {
    from   := f16;
    to     := f0;
    guard  := 0 >= W && 0 >= E6 && X > Y && Z > A1 && D6 > B1 && F6 > C1;
    action := D1' = C6, E1' = D6, D' = B6, E' = G6, F1' = H6, G' = W, W' = E6, G1' = I6, H1' = H6, I1' = F6, J1' = J6, K1' = K6, L1' = L6, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?, M6' = ?, N6' = ?, O6' = ?, P6' = ?, Q6' = ?;
  };
  transition t4 := {
    from   := f17;
    to     := f0;
    guard  := 0 >= W && 0 >= E6 && M1 > N1 && O1 > P1 && D6 > Q1 && F6 > R1;
    action := D1' = C6, E1' = D6, D' = B6, E' = G6, F1' = H6, G' = W, W' = E6, S1' = I6, H1' = H6, I1' = F6, T1' = J6, U1' = K6, L1' = L6, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?, M6' = ?, N6' = ?, O6' = ?, P6' = ?, Q6' = ?;
  };
  transition t5 := {
    from   := f33;
    to     := f34;
    guard  := V1 > 0 && C6 > W1 && 0 >= X1 && Y1 > Z1;
    action := D' = Y1, E' = Z1, G' = V1, P' = Q, R' = C6, Q' = D6, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?, M6' = ?, N6' = ?, O6' = ?, P6' = ?, Q6' = ?;
  };
  transition t6 := {
    from   := f34;
    to     := f34;
    guard  := A2 > 0 && C6 > W1 && 0 >= B2 && Y1 > Z1;
    action := D' = Y1, E' = Z1, G' = A2, P' = Q, R' = C6, Q' = D6, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?, M6' = ?, N6' = ?, O6' = ?, P6' = ?, Q6' = ?;
  };
  transition t7 := {
    from   := f33;
    to     := f17;
    guard  := C2 > 0 && X1 > 0 && G6 > D2 && E2 > F2;
    action := D' = E2, E' = F2, G' = C2, I' = C6, J' = D6, K' = B6, L' = G6, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?, M6' = ?, N6' = ?, O6' = ?, P6' = ?, Q6' = ?;
  };
  transition t8 := {
    from   := f34;
    to     := f17;
    guard  := G2 > 0 && B2 > 0 && G6 > D2 && E2 > F2;
    action := D' = E2, E' = F2, G' = G2, I' = C6, J' = D6, K' = B6, L' = G6, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?, M6' = ?, N6' = ?, O6' = ?, P6' = ?, Q6' = ?;
  };
  transition t9 := {
    from   := f35;
    to     := f35;
    guard  := H2 > 0 && C6 > I2 && 0 >= J2 && K2 > L2;
    action := D' = K2, E' = L2, G' = H2, P' = Q, R' = C6, Q' = D6, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?, M6' = ?, N6' = ?, O6' = ?, P6' = ?, Q6' = ?;
  };
  transition t10 := {
    from   := f35;
    to     := f0;
    guard  := 0 >= W && 0 >= E6 && M2 > 0 && J2 > 0 && N2 > O2 && P2 > Q2 && R2 > S2 && M6 > T2 && D6 > U2 && F6 > V2;
    action := D1' = C6, E1' = D6, D' = B6, E' = G6, F1' = H6, G' = W, W' = E6, W2' = I6, H1' = H6, I1' = F6, X2' = J6, Y2' = K6, K' = L6, Z2' = N6, L' = M6, A3' = O6, L1' = P6, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?, M6' = ?, N6' = ?, O6' = ?, P6' = ?, Q6' = ?;
  };
  transition t11 := {
    from   := f36;
    to     := f36;
    guard  := 0 >= C6 && D6 > B3 && 0 >= C3 && D3 > E3;
    action := D' = D3, E' = E3, G' = C6, P' = Q, R' = D6, Q' = B6, F3' = C6, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?, M6' = ?, N6' = ?, O6' = ?, P6' = ?, Q6' = ?;
  };
  transition t12 := {
    from   := f36;
    to     := f0;
    guard  := 0 >= W && 0 >= P6 && 0 >= E6 && C3 > 0 && G3 > H3 && I3 > J3 && K3 > L3 && N6 > M3 && D6 > N3 && F6 > O3;
    action := D1' = C6, E1' = D6, D' = B6, E' = G6, F1' = H6, G' = W, W' = E6, P3' = I6, H1' = H6, I1' = F6, Q3' = J6, R3' = K6, K' = L6, L' = N6, S3' = M6, T3' = O6, U3' = P6, L1' = Q6, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?, M6' = ?, N6' = ?, O6' = ?, P6' = ?, Q6' = ?;
  };
  transition t13 := {
    from   := f10;
    to     := f34;
    guard  := W > 0 && V3 > 0 && W3 > X3 && D6 > Y3;
    action := D' = W3, E' = X3, G' = V3, W' = -1 + W, P' = C6, V' = D6, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?, M6' = ?, N6' = ?, O6' = ?, P6' = ?, Q6' = ?;
  };
  transition t14 := {
    from   := f1;
    to     := f34;
    guard  := W > 0 && Z3 > 0 && A4 > B4 && C4 > D4 && I6 > Y3 && H6 > E4 && W3 > X3 && D6 > F4;
    action := D1' = C6, E1' = D6, D' = W3, E' = X3, F1' = B6, G' = Z3, W' = -1 + W, H1' = B6, G4' = G6, I1' = H6, P' = E6, V' = I6, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?, M6' = ?, N6' = ?, O6' = ?, P6' = ?, Q6' = ?;
  };
  transition t15 := {
    from   := f2;
    to     := f34;
    guard  := W > 0 && Z3 > 0 && H4 > I4 && J4 > K4 && I6 > Y3 && G6 > L4 && W3 > X3 && D6 > M4;
    action := D1' = C6, E1' = D6, D' = W3, E' = X3, F1' = B6, G' = Z3, W' = -1 + W, H1' = B6, I1' = G6, N4' = H6, P' = E6, V' = I6, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?, M6' = ?, N6' = ?, O6' = ?, P6' = ?, Q6' = ?;
  };
  transition t16 := {
    from   := f16;
    to     := f34;
    guard  := W > 0 && Z3 > 0 && O4 > P4 && F6 > Y3 && G6 > Q4 && D6 > R4 && S4 > T4 && W3 > X3;
    action := D1' = C6, E1' = D6, D' = W3, E' = X3, F1' = B6, G' = Z3, W' = -1 + W, H1' = B6, I1' = G6, U4' = H6, F' = K1, H' = -W + E6, V4' = E6, U1' = K1, I' = -W + E6, J' = E6, P' = I6, V' = F6, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?, M6' = ?, N6' = ?, O6' = ?, P6' = ?, Q6' = ?;
  };
  transition t17 := {
    from   := f17;
    to     := f34;
    guard  := W > 0 && Z3 > 0 && O4 > P4 && F6 > Y3 && G6 > Q4 && D6 > R4 && S4 > T4 && W3 > X3;
    action := D1' = C6, E1' = D6, D' = W3, E' = X3, F1' = B6, G' = Z3, W' = -1 + W, H1' = B6, I1' = G6, U4' = H6, U1' = E6, P' = I6, V' = F6, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?, M6' = ?, N6' = ?, O6' = ?, P6' = ?, Q6' = ?;
  };
  transition t18 := {
    from   := f35;
    to     := f34;
    guard  := W > 0 && Z3 > 0 && M2 > 0 && J2 > 0 && N2 > O2 && O4 > P4 && L6 > Y3 && J6 > T2 && G6 > Q4 && D6 > R4 && S4 > T4 && W3 > X3;
    action := D1' = C6, E1' = D6, D' = W3, E' = X3, F1' = B6, G' = Z3, W' = -1 + W, H1' = B6, I1' = G6, U4' = H6, F' = W4, H' = -W + E6, V4' = E6, U1' = W4, I' = -W + E6, J' = E6, K' = I6, Z2' = F6, L' = J6, P' = K6, A3' = E6, V' = L6, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?, M6' = ?, N6' = ?, O6' = ?, P6' = ?, Q6' = ?;
  };
  transition t19 := {
    from   := f36;
    to     := f34;
    guard  := W > 0 && 0 >= N6 && Z3 > 0 && C3 > 0 && G3 > H3 && X4 > Y4 && M6 > Y3 && F6 > M3 && G6 > Z4 && D6 > A5 && W3 > X3 && B5 > C5;
    action := D1' = C6, E1' = D6, D' = W3, E' = X3, F1' = B6, G' = Z3, W' = -1 + W, H1' = B6, I1' = G6, D5' = H6, R3' = E6, K' = I6, L' = F6, S3' = J6, P' = K6, T3' = L6, U3' = N6, V' = M6, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?, M6' = ?, N6' = ?, O6' = ?, P6' = ?, Q6' = ?;
  };
  transition t20 := {
    from   := f14;
    to     := f36;
    guard  := 0 >= I6 && D6 > 0 && 0 >= C6 && E6 > E5 && G6 > F5 && G5 > H5 && I5 > J5;
    action := D' = G5, E' = H5, G' = C6, W' = -1 + D6, P' = B6, V' = G6, K5' = C6, L5' = H6, M5' = E6, N5' = I6, O5' = F6, P5' = J6, Q5' = K6, R5' = L6, S5' = N6, T5' = D6, W4' = D6, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?, M6' = ?, N6' = ?, O6' = ?, P6' = ?, Q6' = ?;
  };
  transition t21 := {
    from   := f14;
    to     := f35;
    guard  := E6 > 0 && C6 > 0 && U5 > 0 && H6 > V5 && B6 > W5 && X5 > Y5 && Z5 > A6;
    action := D' = X5, E' = Y5, G' = U5, W' = -1 + C6, P' = D6, V' = B6, L5' = G6, M5' = H6, N5' = E6, O5' = I6, P5' = F6, Q5' = J6, R5' = K6, S5' = L6, T5' = C6, W4' = C6, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?, H6' = ?, I6' = ?, J6' = ?, K6' = ?, L6' = ?, M6' = ?, N6' = ?, O6' = ?, P6' = ?, Q6' = ?;
  };
}
strategy dumb {
  Region init := { state = f14 };
}
