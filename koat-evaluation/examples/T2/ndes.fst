model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1, N1, O1, P1, Q1, R1, S1, T1, U1, V1, W1, X1, Y1, Z1, A2, B2, C2, D2, E2, F2, G2, H2, I2, J2, K2, L2, M2, N2, O2, P2, Q2, R2, S2, T2, U2, V2, W2, X2, Y2, Z2, A3, B3, C3, D3, E3, F3, G3, H3, I3, J3, K3, L3, M3, N3, O3, P3, Q3, R3, S3, T3, U3, V3, W3, X3, Y3, Z3, A4, B4, C4, D4, E4, F4, G4;
  states f90, f93, f96, f0, f34, f29, f41, f59, f81, f100, f113, f132, f150, f182, f200, f222, f237, f245, f250, f265, f276, f289, f314, f333, f358;
  transition t0 := {
    from   := f90;
    to     := f93;
    guard  := 1 >= A;
    action := C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t1 := {
    from   := f90;
    to     := f93;
    guard  := A > 2;
    action := C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t2 := {
    from   := f93;
    to     := f96;
    guard  := 8 >= A;
    action := C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t3 := {
    from   := f93;
    to     := f96;
    guard  := A > 9;
    action := C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t4 := {
    from   := f0;
    to     := f34;
    guard  := B = 0;
    action := C' = C4, D' = D4, E' = E4, F' = F4, G' = D4, B' = 0, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t5 := {
    from   := f0;
    to     := f29;
    guard  := 0 > B;
    action := C' = C4, D' = D4, E' = E4, F' = F4, G' = D4, B' = 0, H' = 1, I' = 2, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t6 := {
    from   := f0;
    to     := f29;
    guard  := B > 0;
    action := C' = C4, D' = D4, E' = E4, F' = F4, G' = D4, B' = 0, H' = 1, I' = 2, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t7 := {
    from   := f29;
    to     := f29;
    guard  := 32 >= I;
    action := H' = C4, I' = I + 1, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t8 := {
    from   := f34;
    to     := f41;
    guard  := 0 > C4;
    action := I' = 28, J' = 56, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t9 := {
    from   := f34;
    to     := f41;
    guard  := true;
    action := I' = 28, J' = 56, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t10 := {
    from   := f41;
    to     := f59;
    guard  := 32 >= C4 && I > 0;
    action := K' = F, L' = C4, M' = 32, N' = 1, O' = 1, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t11 := {
    from   := f41;
    to     := f59;
    guard  := 32 >= C4 && I > 0;
    action := K' = F, L' = C4, M' = 32, N' = 0, O' = 0, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t12 := {
    from   := f41;
    to     := f59;
    guard  := C4 > 32 && I > 0;
    action := K' = F, L' = C4, M' = 32, O' = 1, P' = 1, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t13 := {
    from   := f41;
    to     := f59;
    guard  := C4 > 32 && I > 0;
    action := K' = F, L' = C4, M' = 32, O' = 0, P' = 0, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t14 := {
    from   := f81;
    to     := f90;
    guard  := 0 >= Q && 16 >= Q;
    action := R' = C4, A' = Q, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t15 := {
    from   := f81;
    to     := f90;
    guard  := 16 >= Q && Q > 1;
    action := R' = C4, A' = Q, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t16 := {
    from   := f96;
    to     := f100;
    guard  := 15 >= A;
    action := S' = 1, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t17 := {
    from   := f96;
    to     := f100;
    guard  := A > 16;
    action := S' = 1, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t18 := {
    from   := f100;
    to     := f100;
    guard  := 2 >= S;
    action := S' = S + 1, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t19 := {
    from   := f81;
    to     := f113;
    guard  := Q = 1;
    action := Q' = 1, R' = C4, A' = 1, T' = 0, U' = 0, V' = 16, W' = 32, X' = 48, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t20 := {
    from   := f90;
    to     := f113;
    guard  := A = 2;
    action := A' = 2, T' = 0, U' = 0, V' = 16, W' = 32, X' = 48, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t21 := {
    from   := f93;
    to     := f113;
    guard  := A = 9;
    action := A' = 9, T' = 0, U' = 0, V' = 16, W' = 32, X' = 48, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t22 := {
    from   := f96;
    to     := f113;
    guard  := A = 16;
    action := A' = 16, T' = 0, U' = 0, V' = 16, W' = 32, X' = 48, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t23 := {
    from   := f113;
    to     := f132;
    guard  := 28 >= E4 && V > 0;
    action := Y' = C4, Z' = D4, A1' = E4, B1' = 28, C1' = 1, D1' = 1, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t24 := {
    from   := f113;
    to     := f132;
    guard  := 28 >= E4 && V > 0;
    action := Y' = C4, Z' = D4, A1' = E4, B1' = 28, C1' = 0, D1' = 0, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t25 := {
    from   := f113;
    to     := f132;
    guard  := E4 > 28 && V > 0;
    action := Y' = C4, Z' = D4, A1' = E4, B1' = 28, D1' = 1, E1' = 1, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t26 := {
    from   := f113;
    to     := f132;
    guard  := E4 > 28 && V > 0;
    action := Y' = C4, Z' = D4, A1' = E4, B1' = 28, D1' = 0, E1' = 0, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t27 := {
    from   := f132;
    to     := f150;
    guard  := 28 >= E4;
    action := F1' = D1, G1' = C4, H1' = D4, I1' = E4, J1' = 28, K1' = 1, L1' = 1, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t28 := {
    from   := f132;
    to     := f150;
    guard  := 28 >= E4;
    action := F1' = D1, G1' = C4, H1' = D4, I1' = E4, J1' = 28, K1' = 0, L1' = 0, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t29 := {
    from   := f132;
    to     := f150;
    guard  := E4 > 28;
    action := F1' = D1, G1' = C4, H1' = D4, I1' = E4, J1' = 28, L1' = 1, M1' = 1, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t30 := {
    from   := f132;
    to     := f150;
    guard  := E4 > 28;
    action := F1' = D1, G1' = C4, H1' = D4, I1' = E4, J1' = 28, L1' = 0, M1' = 0, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t31 := {
    from   := f34;
    to     := f182;
    guard  := true;
    action := I' = 32, J' = 64, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t32 := {
    from   := f182;
    to     := f200;
    guard  := 32 >= C4 && I > 0;
    action := N1' = E, O1' = C4, P1' = 32, Q1' = 1, R1' = 1, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t33 := {
    from   := f182;
    to     := f200;
    guard  := 32 >= C4 && I > 0;
    action := N1' = E, O1' = C4, P1' = 32, Q1' = 0, R1' = 0, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t34 := {
    from   := f182;
    to     := f200;
    guard  := C4 > 32 && I > 0;
    action := N1' = E, O1' = C4, P1' = 32, R1' = 1, S1' = 1, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t35 := {
    from   := f182;
    to     := f200;
    guard  := C4 > 32 && I > 0;
    action := N1' = E, O1' = C4, P1' = 32, R1' = 0, S1' = 0, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t36 := {
    from   := f222;
    to     := f237;
    guard  := 16 >= Q && G = 1;
    action := G' = 1, T1' = 17 - Q, U1' = C4, V1' = D4, W1' = 16, X1' = 32, Y1' = 48, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t37 := {
    from   := f222;
    to     := f237;
    guard  := 16 >= Q && 0 >= G;
    action := T1' = Q, U1' = C4, V1' = D4, W1' = 16, X1' = 32, Y1' = 48, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t38 := {
    from   := f222;
    to     := f237;
    guard  := 16 >= Q && G > 1;
    action := T1' = Q, U1' = C4, V1' = D4, W1' = 16, X1' = 32, Y1' = 48, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t39 := {
    from   := f237;
    to     := f245;
    guard  := W1 > 0;
    action := Z1' = 1, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t40 := {
    from   := f237;
    to     := f245;
    guard  := W1 > 0;
    action := Z1' = 0, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t41 := {
    from   := f245;
    to     := f250;
    guard  := true;
    action := A2' = 1, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t42 := {
    from   := f245;
    to     := f250;
    guard  := true;
    action := A2' = 0, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t43 := {
    from   := f250;
    to     := f237;
    guard  := true;
    action := W1' = W1 - 1, X1' = X1 - 1, Y1' = Y1 - 1, B2' = 1, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t44 := {
    from   := f250;
    to     := f237;
    guard  := true;
    action := W1' = W1 - 1, X1' = X1 - 1, Y1' = Y1 - 1, B2' = 0, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t45 := {
    from   := f265;
    to     := f265;
    guard  := 4 >= W1;
    action := W1' = W1 + 1, Y1' = Y1 + 1, C2' = C4, D2' = D4, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t46 := {
    from   := f276;
    to     := f276;
    guard  := E2 > 0;
    action := W1' = C4, F2' = D4, E2' = E2 - 1, G2' = E4, H2' = F4, I2' = G4, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t47 := {
    from   := f289;
    to     := f289;
    guard  := W1 > 0;
    action := W1' = W1 - 1, J2' = C4, K2' = 1, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t48 := {
    from   := f289;
    to     := f289;
    guard  := W1 > 0;
    action := W1' = W1 - 1, J2' = C4, K2' = 0, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t49 := {
    from   := f314;
    to     := f333;
    guard  := 32 >= E4 && I > 0;
    action := L2' = C4, M2' = D4, N2' = E4, O2' = 32, P2' = 1, Q2' = 1, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t50 := {
    from   := f314;
    to     := f333;
    guard  := 32 >= E4 && I > 0;
    action := L2' = C4, M2' = D4, N2' = E4, O2' = 32, P2' = 0, Q2' = 0, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t51 := {
    from   := f314;
    to     := f333;
    guard  := E4 > 32 && I > 0;
    action := L2' = C4, M2' = D4, N2' = E4, O2' = 32, Q2' = 1, R2' = 1, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t52 := {
    from   := f314;
    to     := f333;
    guard  := E4 > 32 && I > 0;
    action := L2' = C4, M2' = D4, N2' = E4, O2' = 32, Q2' = 0, R2' = 0, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t53 := {
    from   := f333;
    to     := f314;
    guard  := 32 >= E4;
    action := I' = I - 1, J' = J - 1, S2' = Q2, T2' = C4, U2' = D4, V2' = E4, W2' = 32, X2' = 1, Y2' = 1, Z2' = 1, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t54 := {
    from   := f333;
    to     := f314;
    guard  := 32 >= E4;
    action := I' = I - 1, J' = J - 1, S2' = Q2, T2' = C4, U2' = D4, V2' = E4, W2' = 32, X2' = 0, Y2' = 0, Z2' = 0, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t55 := {
    from   := f333;
    to     := f314;
    guard  := E4 > 32;
    action := I' = I - 1, J' = J - 1, S2' = Q2, T2' = C4, U2' = D4, V2' = E4, W2' = 32, Y2' = 1, A3' = 1, Z2' = 1, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t56 := {
    from   := f333;
    to     := f314;
    guard  := E4 > 32;
    action := I' = I - 1, J' = J - 1, S2' = Q2, T2' = C4, U2' = D4, V2' = E4, W2' = 32, Y2' = 0, A3' = 0, Z2' = 0, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t57 := {
    from   := f314;
    to     := f358;
    guard  := 0 >= I;
    action := C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t58 := {
    from   := f289;
    to     := f222;
    guard  := 0 >= W1;
    action := Q' = Q + 1, B3' = C4, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t59 := {
    from   := f276;
    to     := f289;
    guard  := 0 >= E2;
    action := W1' = 32, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t60 := {
    from   := f265;
    to     := f276;
    guard  := W1 > 4;
    action := F2' = 0, E2' = 8, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t61 := {
    from   := f237;
    to     := f265;
    guard  := 0 >= W1;
    action := W1' = 1, Y1' = 5, C2' = C4, D2' = D4, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t62 := {
    from   := f222;
    to     := f314;
    guard  := Q > 16;
    action := I' = 32, J' = 64, B3' = C4, C3' = 0, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t63 := {
    from   := f200;
    to     := f182;
    guard  := 32 >= C4;
    action := I' = I - 1, J' = J - 1, D3' = R1, E3' = E, F3' = C4, G3' = 32, H3' = 1, I3' = 1, J3' = 1, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t64 := {
    from   := f200;
    to     := f182;
    guard  := 32 >= C4;
    action := I' = I - 1, J' = J - 1, D3' = R1, E3' = E, F3' = C4, G3' = 32, H3' = 0, I3' = 0, J3' = 0, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t65 := {
    from   := f200;
    to     := f182;
    guard  := C4 > 32;
    action := I' = I - 1, J' = J - 1, D3' = R1, E3' = E, F3' = C4, G3' = 32, I3' = 1, K3' = 1, J3' = 1, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t66 := {
    from   := f200;
    to     := f182;
    guard  := C4 > 32;
    action := I' = I - 1, J' = J - 1, D3' = R1, E3' = E, F3' = C4, G3' = 32, I3' = 0, K3' = 0, J3' = 0, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t67 := {
    from   := f182;
    to     := f222;
    guard  := 0 >= I;
    action := Q' = 1, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t68 := {
    from   := f150;
    to     := f113;
    guard  := 28 >= E4;
    action := V' = V - 1, W' = W - 1, X' = X - 1, L3' = L1, M3' = C4, N3' = D4, O3' = E4, P3' = 28, Q3' = 1, R3' = 1, S3' = 1, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t69 := {
    from   := f150;
    to     := f113;
    guard  := 28 >= E4;
    action := V' = V - 1, W' = W - 1, X' = X - 1, L3' = L1, M3' = C4, N3' = D4, O3' = E4, P3' = 28, Q3' = 0, R3' = 0, S3' = 0, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t70 := {
    from   := f150;
    to     := f113;
    guard  := E4 > 28;
    action := V' = V - 1, W' = W - 1, X' = X - 1, L3' = L1, M3' = C4, N3' = D4, O3' = E4, P3' = 28, R3' = 1, T3' = 1, S3' = 1, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t71 := {
    from   := f150;
    to     := f113;
    guard  := E4 > 28;
    action := V' = V - 1, W' = W - 1, X' = X - 1, L3' = L1, M3' = C4, N3' = D4, O3' = E4, P3' = 28, R3' = 0, T3' = 0, S3' = 0, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t72 := {
    from   := f113;
    to     := f81;
    guard  := 0 >= V;
    action := Q' = Q + 1, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t73 := {
    from   := f100;
    to     := f113;
    guard  := S > 2;
    action := T' = 0, U' = 0, V' = 16, W' = 32, X' = 48, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t74 := {
    from   := f81;
    to     := f182;
    guard  := Q > 16;
    action := I' = 32, J' = 64, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t75 := {
    from   := f59;
    to     := f41;
    guard  := 32 >= C4;
    action := I' = I - 1, J' = J - 1, U3' = O, V3' = F, W3' = C4, X3' = 32, Y3' = 1, Z3' = 1, A4' = 1, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t76 := {
    from   := f59;
    to     := f41;
    guard  := 32 >= C4;
    action := I' = I - 1, J' = J - 1, U3' = O, V3' = F, W3' = C4, X3' = 32, Y3' = 0, Z3' = 0, A4' = 0, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t77 := {
    from   := f59;
    to     := f41;
    guard  := C4 > 32;
    action := I' = I - 1, J' = J - 1, U3' = O, V3' = F, W3' = C4, X3' = 32, Z3' = 1, B4' = 1, A4' = 1, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t78 := {
    from   := f59;
    to     := f41;
    guard  := C4 > 32;
    action := I' = I - 1, J' = J - 1, U3' = O, V3' = F, W3' = C4, X3' = 32, Z3' = 0, B4' = 0, A4' = 0, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t79 := {
    from   := f41;
    to     := f81;
    guard  := 0 >= I;
    action := Q' = 1, C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
  transition t80 := {
    from   := f29;
    to     := f34;
    guard  := I > 32;
    action := C4' = ?, D4' = ?, E4' = ?, F4' = ?, G4' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
