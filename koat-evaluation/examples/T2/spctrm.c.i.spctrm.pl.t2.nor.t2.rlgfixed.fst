model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1;
  states f2, f13, f24, f31, f37, f40, f44, f50, f57, f64, f71, f86, f91, f99, f103, f107, f118, f1;
  transition t0 := {
    from   := f2;
    to     := f13;
    guard  := true;
    action := A' = 0, B' = 0, C' = 2*D, E' = 4*D, F' = 4*D + 3, G' = 4*D + 4, H' = D, I' = B1, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t1 := {
    from   := f13;
    to     := f13;
    guard  := C >= J;
    action := J' = J + 1, K' = 1, L' = 0, M' = 0, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t2 := {
    from   := f13;
    to     := f13;
    guard  := C1 > 1 && C >= J;
    action := A' = A + B1, J' = J + 1, K' = C1, L' = 1 - C1, M' = B1, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t3 := {
    from   := f13;
    to     := f13;
    guard  := 0 >= C1 && C >= J;
    action := A' = A + B1, J' = J + 1, K' = C1, L' = 1 - C1, M' = B1, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t4 := {
    from   := f24;
    to     := f24;
    guard  := D >= J;
    action := J' = J + 1, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t5 := {
    from   := f31;
    to     := f31;
    guard  := D >= J;
    action := J' = J + 1, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t6 := {
    from   := f37;
    to     := f40;
    guard  := N >= O;
    action := B1' = ?, C1' = ?, D1' = ?;
  };
  transition t7 := {
    from   := f40;
    to     := f44;
    guard  := 0 > P && 0 >= Q;
    action := B1' = ?, C1' = ?, D1' = ?;
  };
  transition t8 := {
    from   := f40;
    to     := f44;
    guard  := P > 0 && 0 >= Q;
    action := B1' = ?, C1' = ?, D1' = ?;
  };
  transition t9 := {
    from   := f44;
    to     := f44;
    guard  := D >= J;
    action := J' = J + 1, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t10 := {
    from   := f50;
    to     := f50;
    guard  := D >= J;
    action := J' = J + 1, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t11 := {
    from   := f57;
    to     := f57;
    guard  := D >= J;
    action := J' = J + 1, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t12 := {
    from   := f40;
    to     := f64;
    guard  := 0 >= Q && P = 0;
    action := P' = 0, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t13 := {
    from   := f64;
    to     := f64;
    guard  := E >= J;
    action := J' = J + 2, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t14 := {
    from   := f71;
    to     := f71;
    guard  := C >= J;
    action := J' = J + 1, R' = 2*J, S' = B1, T' = 1 - B1, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t15 := {
    from   := f86;
    to     := f91;
    guard  := L = 0;
    action := L' = 0, U' = 0, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t16 := {
    from   := f86;
    to     := f91;
    guard  := 0 > L;
    action := U' = B1, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t17 := {
    from   := f86;
    to     := f91;
    guard  := L > 0;
    action := U' = B1, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t18 := {
    from   := f91;
    to     := f99;
    guard  := D >= J;
    action := L' = B1, R' = 2*J, V' = 0, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t19 := {
    from   := f91;
    to     := f99;
    guard  := 0 > D1 && D >= J;
    action := L' = B1, R' = 2*J, V' = C1, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t20 := {
    from   := f91;
    to     := f99;
    guard  := D1 > 0 && D >= J;
    action := L' = B1, R' = 2*J, V' = C1, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t21 := {
    from   := f99;
    to     := f103;
    guard  := L = 0;
    action := L' = B1, W' = 0, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t22 := {
    from   := f99;
    to     := f103;
    guard  := 0 > L;
    action := L' = B1, W' = C1, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t23 := {
    from   := f99;
    to     := f103;
    guard  := L > 0;
    action := L' = B1, W' = C1, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t24 := {
    from   := f103;
    to     := f107;
    guard  := L = 0;
    action := L' = B1, X' = 0, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t25 := {
    from   := f103;
    to     := f107;
    guard  := 0 > L;
    action := L' = B1, X' = C1, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t26 := {
    from   := f103;
    to     := f107;
    guard  := L > 0;
    action := L' = B1, X' = C1, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t27 := {
    from   := f107;
    to     := f91;
    guard  := L = 0;
    action := J' = J + 1, L' = 0, Y' = 0, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t28 := {
    from   := f107;
    to     := f91;
    guard  := 0 > L;
    action := J' = J + 1, Y' = B1, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t29 := {
    from   := f107;
    to     := f91;
    guard  := L > 0;
    action := J' = J + 1, Y' = B1, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t30 := {
    from   := f118;
    to     := f118;
    guard  := D >= J;
    action := J' = J + 1, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t31 := {
    from   := f118;
    to     := f1;
    guard  := J > D;
    action := B1' = ?, C1' = ?, D1' = ?;
  };
  transition t32 := {
    from   := f91;
    to     := f37;
    guard  := J > D;
    action := B' = B + A, O' = O + 1, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t33 := {
    from   := f71;
    to     := f86;
    guard  := J > C;
    action := L' = B1, Z' = 0, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t34 := {
    from   := f71;
    to     := f86;
    guard  := 0 > D1 && J > C;
    action := L' = B1, Z' = C1, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t35 := {
    from   := f71;
    to     := f86;
    guard  := D1 > 0 && J > C;
    action := L' = B1, Z' = C1, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t36 := {
    from   := f64;
    to     := f40;
    guard  := J > E;
    action := Q' = Q + 1, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t37 := {
    from   := f57;
    to     := f40;
    guard  := J > D;
    action := Q' = Q + 1, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t38 := {
    from   := f50;
    to     := f57;
    guard  := J > D;
    action := A1' = Q + C, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t39 := {
    from   := f44;
    to     := f50;
    guard  := J > D;
    action := B1' = ?, C1' = ?, D1' = ?;
  };
  transition t40 := {
    from   := f40;
    to     := f71;
    guard  := Q > 0;
    action := B1' = ?, C1' = ?, D1' = ?;
  };
  transition t41 := {
    from   := f37;
    to     := f118;
    guard  := O > N;
    action := B' = B1, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t42 := {
    from   := f31;
    to     := f37;
    guard  := J > D;
    action := B1' = ?, C1' = ?, D1' = ?;
  };
  transition t43 := {
    from   := f24;
    to     := f31;
    guard  := 0 > P && J > D;
    action := B1' = ?, C1' = ?, D1' = ?;
  };
  transition t44 := {
    from   := f24;
    to     := f31;
    guard  := P > 0 && J > D;
    action := B1' = ?, C1' = ?, D1' = ?;
  };
  transition t45 := {
    from   := f24;
    to     := f37;
    guard  := J > D && P = 0;
    action := P' = 0, B1' = ?, C1' = ?, D1' = ?;
  };
  transition t46 := {
    from   := f13;
    to     := f24;
    guard  := J > C;
    action := B1' = ?, C1' = ?, D1' = ?;
  };
}
strategy dumb {
  Region init := { state = f2 };
}
