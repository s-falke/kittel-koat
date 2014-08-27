model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1;
  states f20, f26, f68, f33, f39, f52, f59, f63, f71, f73, f76, f0;
  transition t0 := {
    from   := f20;
    to     := f26;
    guard  := A > 0;
    action := B' = 1, C' = D, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t1 := {
    from   := f20;
    to     := f26;
    guard  := 0 >= D && 0 >= A;
    action := B' = 1, C' = D, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t2 := {
    from   := f20;
    to     := f26;
    guard  := D > 0 && 0 >= A;
    action := B' = 0, C' = D, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t3 := {
    from   := f26;
    to     := f68;
    guard  := C >= E;
    action := Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t4 := {
    from   := f26;
    to     := f33;
    guard  := Z > 0 && E > C;
    action := F' = Z, G' = A1, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t5 := {
    from   := f26;
    to     := f33;
    guard  := E > C && 0 >= Z && 0 >= A1;
    action := F' = Z, G' = A1, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t6 := {
    from   := f33;
    to     := f39;
    guard  := H > I;
    action := Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t7 := {
    from   := f33;
    to     := f39;
    guard  := I >= H && J + 1 = 0;
    action := J' = -1, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t8 := {
    from   := f33;
    to     := f33;
    guard  := I >= H && 0 > 1 + J;
    action := I' = I + 1, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t9 := {
    from   := f33;
    to     := f33;
    guard  := I >= H && J >= 0;
    action := I' = I + 1, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t10 := {
    from   := f39;
    to     := f68;
    guard  := I >= H;
    action := Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t11 := {
    from   := f39;
    to     := f52;
    guard  := 0 >= A1 && H > I && 0 >= Z;
    action := K' = Z, L' = Z, M' = A1, N' = B1, O' = B1, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t12 := {
    from   := f39;
    to     := f52;
    guard  := 0 >= B1 && A1 > 0 && H > I && 0 >= Z;
    action := K' = Z, L' = Z, M' = A1, P' = B1, N' = C1, O' = C1, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t13 := {
    from   := f52;
    to     := f68;
    guard  := O >= 0 && 0 >= Z && Q = 3;
    action := Q' = 3, R' = Z, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t14 := {
    from   := f52;
    to     := f68;
    guard  := O >= 0 && Z > 1 && Q = 3;
    action := Q' = 3, R' = Z, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t15 := {
    from   := f52;
    to     := f59;
    guard  := O >= 0 && 2 >= Q;
    action := S' = Z, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t16 := {
    from   := f52;
    to     := f59;
    guard  := O >= 0 && Q > 3;
    action := S' = Z, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t17 := {
    from   := f52;
    to     := f59;
    guard  := O >= 0 && Q = 3;
    action := Q' = 3, R' = 1, S' = Z, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t18 := {
    from   := f59;
    to     := f63;
    guard  := 10 >= S;
    action := O' = Z, T' = Z, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t19 := {
    from   := f59;
    to     := f63;
    guard  := S > 10;
    action := O' = Z, S' = 10, T' = Z, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t20 := {
    from   := f63;
    to     := f26;
    guard  := 0 > O;
    action := C' = C + 1, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t21 := {
    from   := f26;
    to     := f26;
    guard  := E > C && 0 >= Z && A1 > 0;
    action := C' = C + 1, F' = Z, G' = A1, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t22 := {
    from   := f39;
    to     := f26;
    guard  := H > I && Z > 0;
    action := C' = C + 1, K' = Z, L' = Z, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t23 := {
    from   := f39;
    to     := f26;
    guard  := B1 > 0 && A1 > 0 && H > I && 0 >= Z;
    action := C' = C + 1, K' = Z, L' = Z, M' = A1, P' = B1, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t24 := {
    from   := f52;
    to     := f26;
    guard  := 0 > O;
    action := C' = C + 1, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t25 := {
    from   := f63;
    to     := f26;
    guard  := O >= 0;
    action := U' = U + 1, C' = C + 1, J' = L, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t26 := {
    from   := f71;
    to     := f71;
    guard  := true;
    action := Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t27 := {
    from   := f68;
    to     := f71;
    guard  := 0 >= U;
    action := A' = 0, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t28 := {
    from   := f68;
    to     := f71;
    guard  := U > 0;
    action := A' = 1, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t29 := {
    from   := f73;
    to     := f76;
    guard  := true;
    action := Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t30 := {
    from   := f0;
    to     := f20;
    guard  := A1 >= 0 && B1 > 0 && V = 3;
    action := W' = 1, I' = 0, U' = 0, E' = Z, D' = A1, X' = B1, A' = C1, V' = 3, Y' = C1, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t31 := {
    from   := f0;
    to     := f20;
    guard  := 2 >= V && A1 >= 0 && B1 > 0;
    action := W' = 1, I' = 0, U' = 0, E' = Z, D' = A1, X' = B1, A' = C1, Y' = C1, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
  transition t32 := {
    from   := f0;
    to     := f20;
    guard  := V > 3 && A1 >= 0 && B1 > 0;
    action := W' = 1, I' = 0, U' = 0, E' = Z, D' = A1, X' = B1, A' = C1, Y' = C1, Z' = ?, A1' = ?, B1' = ?, C1' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
