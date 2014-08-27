model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, K1, L1, M1;
  states f81, f83, f34, f39, f44, f64, f69, f87, f80, f56, f96, f98, f100, f0;
  transition t0 := {
    from   := f81;
    to     := f83;
    guard  := A = 0;
    action := A' = 0, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t1 := {
    from   := f34;
    to     := f39;
    guard  := 0 > B;
    action := C' = 1, D' = B, E' = H1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t2 := {
    from   := f34;
    to     := f39;
    guard  := B > 0;
    action := C' = 1, D' = B, E' = H1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t3 := {
    from   := f39;
    to     := f44;
    guard  := 0 > E;
    action := F' = E, G' = 10, H' = H1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t4 := {
    from   := f39;
    to     := f44;
    guard  := E > 0;
    action := F' = E, G' = 10, H' = H1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t5 := {
    from   := f64;
    to     := f69;
    guard  := 0 > I;
    action := J' = I, K' = 0, L' = H1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t6 := {
    from   := f64;
    to     := f69;
    guard  := I > 0;
    action := J' = I, K' = 0, L' = H1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t7 := {
    from   := f83;
    to     := f87;
    guard  := 0 > K;
    action := H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t8 := {
    from   := f83;
    to     := f87;
    guard  := K > 0;
    action := H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t9 := {
    from   := f80;
    to     := f81;
    guard  := 0 > M;
    action := H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t10 := {
    from   := f80;
    to     := f81;
    guard  := M > 0;
    action := H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t11 := {
    from   := f80;
    to     := f83;
    guard  := M = 0;
    action := M' = 0, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t12 := {
    from   := f81;
    to     := f83;
    guard  := 0 > A;
    action := K' = 1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t13 := {
    from   := f81;
    to     := f83;
    guard  := A > 0;
    action := K' = 1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t14 := {
    from   := f56;
    to     := f44;
    guard  := N >= 0;
    action := H' = H1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t15 := {
    from   := f56;
    to     := f44;
    guard  := 0 > 1 + N;
    action := H' = H1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t16 := {
    from   := f64;
    to     := f44;
    guard  := I = 0;
    action := H' = H1, I' = 0, J' = 0, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t17 := {
    from   := f87;
    to     := f44;
    guard  := K = 0;
    action := H' = H1, K' = 0, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t18 := {
    from   := f96;
    to     := f96;
    guard  := true;
    action := H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t19 := {
    from   := f34;
    to     := f96;
    guard  := B = 0;
    action := C' = 1, B' = 0, D' = 0, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t20 := {
    from   := f39;
    to     := f96;
    guard  := E = 0;
    action := C' = 1, E' = 0, F' = 0, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t21 := {
    from   := f98;
    to     := f100;
    guard  := true;
    action := H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t22 := {
    from   := f87;
    to     := f44;
    guard  := 0 > K;
    action := H' = H1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t23 := {
    from   := f87;
    to     := f44;
    guard  := K > 0;
    action := H' = H1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t24 := {
    from   := f83;
    to     := f87;
    guard  := K = 0;
    action := K' = 0, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t25 := {
    from   := f69;
    to     := f87;
    guard  := 0 > H1;
    action := O' = L, P' = H1, Q' = H1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t26 := {
    from   := f69;
    to     := f87;
    guard  := H1 > 0;
    action := O' = L, P' = H1, Q' = H1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t27 := {
    from   := f69;
    to     := f83;
    guard  := true;
    action := O' = L, P' = 0, Q' = 0, R' = 0, S' = 0, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t28 := {
    from   := f69;
    to     := f80;
    guard  := 0 > H1;
    action := O' = L, P' = 0, Q' = 0, R' = H1, S' = H1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t29 := {
    from   := f69;
    to     := f80;
    guard  := H1 > 0;
    action := O' = L, P' = 0, Q' = 0, R' = H1, S' = H1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t30 := {
    from   := f56;
    to     := f64;
    guard  := 0 > H1 && N + 1 = 0;
    action := N' = -1, T' = H1, U' = H1, I' = I1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t31 := {
    from   := f56;
    to     := f64;
    guard  := H1 > 0 && N + 1 = 0;
    action := N' = -1, T' = H1, U' = H1, I' = I1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t32 := {
    from   := f56;
    to     := f44;
    guard  := N + 1 = 0;
    action := H' = H1, N' = -1, T' = 0, U' = 0, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t33 := {
    from   := f44;
    to     := f56;
    guard  := 0 > V;
    action := N' = H, W' = 0, X' = 0, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t34 := {
    from   := f44;
    to     := f56;
    guard  := V > 0;
    action := N' = H, W' = 0, X' = 0, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t35 := {
    from   := f44;
    to     := f44;
    guard  := V = 0;
    action := V' = 0, H' = H1, N' = H, W' = 0, X' = 0, Y' = 0, Z' = 0, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t36 := {
    from   := f44;
    to     := f44;
    guard  := 0 > I1 && V = 0;
    action := C' = 0, V' = 0, H' = H1, N' = H, W' = 0, X' = 0, Y' = I1, Z' = I1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t37 := {
    from   := f44;
    to     := f44;
    guard  := I1 > 0 && V = 0;
    action := C' = 0, V' = 0, H' = H1, N' = H, W' = 0, X' = 0, Y' = I1, Z' = I1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t38 := {
    from   := f44;
    to     := f96;
    guard  := 0 > H1;
    action := C' = 1, N' = H, W' = H1, X' = H1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t39 := {
    from   := f44;
    to     := f96;
    guard  := H1 > 0;
    action := C' = 1, N' = H, W' = H1, X' = H1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t40 := {
    from   := f0;
    to     := f96;
    guard  := 0 >= I1;
    action := A1' = H1, B1' = H1, C1' = I1, D1' = I1, E1' = J1, C' = 1, F1' = K1, V' = K1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t41 := {
    from   := f0;
    to     := f34;
    guard  := I1 > 0 && 4 >= L1;
    action := A1' = H1, B1' = 5, C1' = I1, D1' = I1, E1' = J1, C' = J1, F1' = K1, V' = K1, G1' = L1, B' = M1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t42 := {
    from   := f0;
    to     := f34;
    guard  := J1 > 0 && 20 >= I1 && I1 > 4;
    action := A1' = H1, B1' = I1, C1' = J1, D1' = J1, E1' = K1, C' = K1, F1' = L1, V' = L1, G1' = I1, B' = M1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
  transition t43 := {
    from   := f0;
    to     := f34;
    guard  := I1 > 0 && L1 > 20;
    action := A1' = H1, B1' = 20, C1' = I1, D1' = I1, E1' = J1, C' = J1, F1' = K1, V' = K1, G1' = L1, B' = M1, H1' = ?, I1' = ?, J1' = ?, K1' = ?, L1' = ?, M1' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
