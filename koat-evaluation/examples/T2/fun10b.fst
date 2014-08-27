model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1, N1, O1, P1, Q1, R1, S1, T1, U1, V1, W1, X1, Y1, Z1, A2, B2, C2, D2, E2, F2, G2, H2, I2, J2, K2, L2, M2, N2, O2, P2, Q2, R2, S2, T2, U2, V2, W2, X2, Y2, Z2, A3, B3, C3, D3, E3, F3, G3, H3, I3, J3, K3, L3, M3, N3, O3, P3, Q3, R3, S3, T3, U3, V3, W3, X3, Y3, Z3, A4, B4, C4, D4, E4, F4, G4, H4, I4, J4, K4, L4, M4, N4, O4, P4, Q4, R4, S4, T4, U4, V4, W4, X4, Y4, Z4, A5, B5, C5, D5, E5, F5, G5, H5, I5, J5, K5, L5, M5, N5, O5, P5, Q5, R5, S5, T5, U5, V5, W5, X5, Y5, Z5, A6, B6, C6, D6, E6, F6, G6;
  states f38, f17, f19, f34, f50, f16, f0, f33, f35, f36, f10, f1, f2, f14;
  transition t0 := {
    from   := f38;
    to     := f17;
    guard  := T5 > A && B > C;
    action := D' = B, E' = C, F' = -G + U5, H' = U5, I' = -G + U5, J' = U5, K' = V5, L' = T5, T5' = ?, U5' = ?, V5' = ?, W5' = ?, X5' = ?, Y5' = ?, Z5' = ?, A6' = ?, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?;
  };
  transition t1 := {
    from   := f19;
    to     := f34;
    guard  := U5 > M && N > O;
    action := D' = N, E' = O, P' = Q, R' = U5, Q' = V5, T5' = ?, U5' = ?, V5' = ?, W5' = ?, X5' = ?, Y5' = ?, Z5' = ?, A6' = ?, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?;
  };
  transition t2 := {
    from   := f50;
    to     := f34;
    guard  := V5 > S && T > U;
    action := D' = T, E' = U, P' = U5, V' = V5, T5' = ?, U5' = ?, V5' = ?, W5' = ?, X5' = ?, Y5' = ?, Z5' = ?, A6' = ?, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?;
  };
  transition t3 := {
    from   := f16;
    to     := f0;
    guard  := 0 >= W && 0 >= V5 && X > Y && Z > A1 && W5 > B1 && X5 > C1;
    action := D' = U5, W' = V5, D1' = T5, E1' = W5, E' = Y5, F1' = Z5, G' = W, G1' = A6, H1' = B6, T5' = ?, U5' = ?, V5' = ?, W5' = ?, X5' = ?, Y5' = ?, Z5' = ?, A6' = ?, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?;
  };
  transition t4 := {
    from   := f17;
    to     := f0;
    guard  := W > 0 && 0 >= W && 0 >= V5 && I1 > J1 && X5 > K1 && L1 > M1 && W5 > N1;
    action := D' = U5, W' = V5, D1' = T5, E1' = W5, E' = Y5, O1' = Z5, G' = W, P1' = A6, H1' = B6, T5' = ?, U5' = ?, V5' = ?, W5' = ?, X5' = ?, Y5' = ?, Z5' = ?, A6' = ?, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?;
  };
  transition t5 := {
    from   := f33;
    to     := f34;
    guard  := Q1 > 0 && R1 > S1 && 0 >= T1 && U5 > U1;
    action := D' = R1, E' = S1, G' = Q1, P' = Q, R' = U5, Q' = V5, T5' = ?, U5' = ?, V5' = ?, W5' = ?, X5' = ?, Y5' = ?, Z5' = ?, A6' = ?, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?;
  };
  transition t6 := {
    from   := f34;
    to     := f34;
    guard  := V1 > 0 && R1 > S1 && 0 >= W1 && U5 > U1;
    action := D' = R1, E' = S1, G' = V1, P' = Q, R' = U5, Q' = V5, T5' = ?, U5' = ?, V5' = ?, W5' = ?, X5' = ?, Y5' = ?, Z5' = ?, A6' = ?, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?;
  };
  transition t7 := {
    from   := f33;
    to     := f17;
    guard  := X1 > 0 && T1 > 0 && W5 > Y1 && Z1 > A2;
    action := D' = Z1, E' = A2, G' = X1, I' = U5, J' = V5, K' = T5, L' = W5, T5' = ?, U5' = ?, V5' = ?, W5' = ?, X5' = ?, Y5' = ?, Z5' = ?, A6' = ?, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?;
  };
  transition t8 := {
    from   := f34;
    to     := f17;
    guard  := B2 > 0 && W1 > 0 && W5 > Y1 && Z1 > A2;
    action := D' = Z1, E' = A2, G' = B2, I' = U5, J' = V5, K' = T5, L' = W5, T5' = ?, U5' = ?, V5' = ?, W5' = ?, X5' = ?, Y5' = ?, Z5' = ?, A6' = ?, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?;
  };
  transition t9 := {
    from   := f35;
    to     := f35;
    guard  := C2 > 0 && D2 > E2 && 0 >= F2 && U5 > G2;
    action := D' = D2, E' = E2, G' = C2, P' = Q, R' = U5, Q' = V5, T5' = ?, U5' = ?, V5' = ?, W5' = ?, X5' = ?, Y5' = ?, Z5' = ?, A6' = ?, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?;
  };
  transition t10 := {
    from   := f35;
    to     := f0;
    guard  := 0 >= W && 0 >= V5 && H2 > 0 && F2 > 0 && I2 > J2 && K2 > L2 && M2 > N2 && C6 > O2 && W5 > P2 && D6 > Q2;
    action := D' = U5, W' = V5, D1' = T5, E1' = W5, E' = Y5, R2' = Z5, S2' = A6, G' = W, K' = B6, T2' = X5, L' = D6, U2' = E6, H1' = F6, T5' = ?, U5' = ?, V5' = ?, W5' = ?, X5' = ?, Y5' = ?, Z5' = ?, A6' = ?, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?;
  };
  transition t11 := {
    from   := f36;
    to     := f36;
    guard  := 0 >= U5 && V2 > W2 && 0 >= X2 && V5 > Y2;
    action := D' = V2, E' = W2, G' = U5, P' = Q, R' = V5, Q' = T5, Z2' = U5, T5' = ?, U5' = ?, V5' = ?, W5' = ?, X5' = ?, Y5' = ?, Z5' = ?, A6' = ?, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?;
  };
  transition t12 := {
    from   := f36;
    to     := f0;
    guard  := 0 >= W && 0 >= F6 && 0 >= V5 && X2 > 0 && A3 > B3 && C3 > D3 && E3 > F3 && G6 > G3 && W5 > H3 && X5 > I3;
    action := D' = U5, W' = V5, D1' = T5, E1' = W5, E' = Y5, J3' = Z5, G' = W, K3' = A6, K' = B6, L' = X5, L3' = D6, M3' = E6, N3' = F6, H1' = C6, T5' = ?, U5' = ?, V5' = ?, W5' = ?, X5' = ?, Y5' = ?, Z5' = ?, A6' = ?, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?;
  };
  transition t13 := {
    from   := f10;
    to     := f34;
    guard  := W > 0 && O3 > 0 && P3 > Q3 && V5 > R3;
    action := D' = P3, W' = -1 + W, E' = Q3, G' = O3, P' = U5, V' = V5, T5' = ?, U5' = ?, V5' = ?, W5' = ?, X5' = ?, Y5' = ?, Z5' = ?, A6' = ?, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?;
  };
  transition t14 := {
    from   := f1;
    to     := f34;
    guard  := W > 0 && S3 > 0 && T3 > U3 && V3 > W3 && T5 > X3 && W5 > Y3 && P3 > Q3 && V5 > R3;
    action := D' = P3, W' = -1 + W, E' = Q3, G' = S3, P' = U5, V' = V5, T5' = ?, U5' = ?, V5' = ?, W5' = ?, X5' = ?, Y5' = ?, Z5' = ?, A6' = ?, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?;
  };
  transition t15 := {
    from   := f2;
    to     := f34;
    guard  := W > 0 && S3 > 0 && Z3 > A4 && B4 > C4 && Z5 > D4 && Y5 > R3 && P3 > Q3 && T5 > E4;
    action := D' = P3, W' = -1 + W, D1' = U5, F4' = V5, E1' = T5, E' = Q3, G' = S3, P' = W5, V' = Y5, T5' = ?, U5' = ?, V5' = ?, W5' = ?, X5' = ?, Y5' = ?, Z5' = ?, A6' = ?, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?;
  };
  transition t16 := {
    from   := f16;
    to     := f34;
    guard  := W > 0 && S3 > 0 && G4 > H4 && I4 > J4 && A6 > K4 && Z5 > R3 && P3 > Q3 && V5 > L4;
    action := D' = P3, W' = -1 + W, D1' = U5, E1' = V5, E' = Q3, M4' = T5, G' = S3, F' = G1, H' = -W + W5, N4' = W5, P1' = G1, I' = -W + W5, J' = W5, P' = Y5, V' = Z5, T5' = ?, U5' = ?, V5' = ?, W5' = ?, X5' = ?, Y5' = ?, Z5' = ?, A6' = ?, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?;
  };
  transition t17 := {
    from   := f17;
    to     := f34;
    guard  := W > 0 && S3 > 0 && G4 > H4 && I4 > J4 && A6 > K4 && Z5 > R3 && P3 > Q3 && V5 > L4;
    action := D' = P3, W' = -1 + W, D1' = U5, E1' = V5, E' = Q3, M4' = T5, G' = S3, P1' = W5, P' = Y5, V' = Z5, T5' = ?, U5' = ?, V5' = ?, W5' = ?, X5' = ?, Y5' = ?, Z5' = ?, A6' = ?, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?;
  };
  transition t18 := {
    from   := f35;
    to     := f34;
    guard  := W > 0 && S3 > 0 && H2 > 0 && F2 > 0 && G4 > H4 && I2 > J2 && I4 > J4 && D6 > K4 && X5 > R3 && A6 > Q2 && P3 > Q3 && V5 > L4;
    action := D' = P3, W' = -1 + W, D1' = U5, E1' = V5, E' = Q3, M4' = T5, G' = S3, F' = O4, H' = -W + W5, N4' = W5, P1' = O4, I' = -W + W5, J' = W5, K' = Y5, T2' = Z5, L' = A6, P' = B6, U2' = W5, V' = X5, T5' = ?, U5' = ?, V5' = ?, W5' = ?, X5' = ?, Y5' = ?, Z5' = ?, A6' = ?, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?;
  };
  transition t19 := {
    from   := f36;
    to     := f34;
    guard  := W > 0 && 0 >= D6 && S3 > 0 && X2 > 0 && A3 > B3 && P4 > Q4 && F6 > R4 && E6 > R3 && Z5 > I3 && V5 > S4 && T4 > U4 && P3 > Q3;
    action := D' = P3, W' = -1 + W, D1' = U5, E1' = V5, E' = Q3, V4' = T5, G' = S3, K3' = W5, K' = Y5, L' = Z5, L3' = A6, P' = B6, M3' = X5, N3' = D6, V' = E6, T5' = ?, U5' = ?, V5' = ?, W5' = ?, X5' = ?, Y5' = ?, Z5' = ?, A6' = ?, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?;
  };
  transition t20 := {
    from   := f14;
    to     := f36;
    guard  := 0 >= A6 && 0 >= V5 && U5 > 0 && Z5 > W4 && W5 > X4 && Y4 > Z4 && A5 > B5;
    action := D' = Y4, W' = -1 + U5, E' = Z4, G' = V5, P' = T5, V' = W5, C5' = V5, D5' = Y5, E5' = Z5, F5' = A6, G5' = B6, H5' = X5, I5' = D6, J5' = E6, K5' = F6, L5' = U5, O4' = U5, T5' = ?, U5' = ?, V5' = ?, W5' = ?, X5' = ?, Y5' = ?, Z5' = ?, A6' = ?, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?;
  };
  transition t21 := {
    from   := f14;
    to     := f35;
    guard  := Z5 > 0 && U5 > 0 && M5 > 0 && Y5 > N5 && T5 > O5 && P5 > Q5 && R5 > S5;
    action := D' = P5, W' = -1 + U5, E' = Q5, G' = M5, P' = V5, V' = T5, D5' = W5, E5' = Y5, F5' = Z5, G5' = A6, H5' = B6, I5' = X5, J5' = D6, K5' = E6, L5' = U5, O4' = U5, T5' = ?, U5' = ?, V5' = ?, W5' = ?, X5' = ?, Y5' = ?, Z5' = ?, A6' = ?, B6' = ?, C6' = ?, D6' = ?, E6' = ?, F6' = ?, G6' = ?;
  };
}
strategy dumb {
  Region init := { state = f14 };
}
