model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1, N1, O1, P1, Q1, R1, S1, T1, U1, V1;
  states f0, f422, f437, f441, f455, f461, f485, f501, f526, f540, f543, f546, f584;
  transition t0 := {
    from   := f0;
    to     := f422;
    guard  := true;
    action := A' = 3, B' = 43690, C' = 3, D' = Q1, E' = 0, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t1 := {
    from   := f422;
    to     := f422;
    guard  := 149 >= E;
    action := C' = Q1, D' = R1, E' = E + 1, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t2 := {
    from   := f437;
    to     := f441;
    guard  := 49 >= F;
    action := G' = 0, H' = 0, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t3 := {
    from   := f441;
    to     := f441;
    guard  := 49 >= H;
    action := G' = Q1, H' = H + 1, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t4 := {
    from   := f455;
    to     := f461;
    guard  := 99 >= I;
    action := J' = 0, K' = 0, L' = Q1, M' = 0, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t5 := {
    from   := f461;
    to     := f461;
    guard  := 31 >= M;
    action := J' = Q1, K' = R1, L' = S1, M' = M + 2, N' = T1, O' = U1, P' = V1, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t6 := {
    from   := f485;
    to     := f485;
    guard  := Q >= 0;
    action := R' = Q1, Q' = Q - 1, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t7 := {
    from   := f501;
    to     := f501;
    guard  := 49 >= S;
    action := T' = Q1, S' = S + 1, U' = R1, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t8 := {
    from   := f526;
    to     := f526;
    guard  := V >= W;
    action := W' = W + 1, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t9 := {
    from   := f540;
    to     := f543;
    guard  := 8 >= X;
    action := Y' = 0, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t10 := {
    from   := f543;
    to     := f546;
    guard  := 7 >= Y;
    action := Z' = 0, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t11 := {
    from   := f546;
    to     := f546;
    guard  := 3 >= Z;
    action := Z' = Z + 1, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t12 := {
    from   := f546;
    to     := f543;
    guard  := Z > 3;
    action := Y' = Y + 1, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t13 := {
    from   := f543;
    to     := f540;
    guard  := Y > 7;
    action := X' = X + 7, A1' = A1 + 3, B1' = B1 + 3, C1' = C1 - 7, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t14 := {
    from   := f540;
    to     := f584;
    guard  := X > 8;
    action := Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t15 := {
    from   := f526;
    to     := f540;
    guard  := W > V;
    action := D1' = E1, F1' = E1, X' = 1, A1' = 0, B1' = 13, C1' = 8, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t16 := {
    from   := f501;
    to     := f526;
    guard  := S > 49;
    action := G1' = B, H1' = 1, V' = 17, I1' = Q1, E1' = B, J1' = A, K1' = 1, L1' = R1, W' = 2, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t17 := {
    from   := f485;
    to     := f501;
    guard  := 0 > Q;
    action := B' = R, M1' = R, T' = Q1, S' = 0, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t18 := {
    from   := f461;
    to     := f455;
    guard  := M > 31;
    action := I' = I + 2, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t19 := {
    from   := f455;
    to     := f485;
    guard  := I > 99;
    action := N1' = 100, R' = Q1, Q' = 98, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t20 := {
    from   := f441;
    to     := f437;
    guard  := H > 49;
    action := F' = F + 1, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t21 := {
    from   := f437;
    to     := f455;
    guard  := F > 49;
    action := I' = 0, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
  transition t22 := {
    from   := f422;
    to     := f437;
    guard  := E > 149;
    action := A' = C, O1' = C, P1' = C, F' = 0, Q1' = ?, R1' = ?, S1' = ?, T1' = ?, U1' = ?, V1' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
