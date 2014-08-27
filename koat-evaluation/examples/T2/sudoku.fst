model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y;
  states f135, f136, f137, f0, f26, f29, f38, f41, f44, f56, f59, f62, f65, f77, f80, f83, f86, f98, f101, f104, f107, f110, f113, f117, f146;
  transition t0 := {
    from   := f135;
    to     := f136;
    guard  := 0 > A;
    action := X' = ?, Y' = ?;
  };
  transition t1 := {
    from   := f135;
    to     := f136;
    guard  := A > 0;
    action := X' = ?, Y' = ?;
  };
  transition t2 := {
    from   := f136;
    to     := f137;
    guard  := 0 > B;
    action := X' = ?, Y' = ?;
  };
  transition t3 := {
    from   := f136;
    to     := f137;
    guard  := B > 0;
    action := X' = ?, Y' = ?;
  };
  transition t4 := {
    from   := f0;
    to     := f26;
    guard  := true;
    action := C' = 3, D' = X, E' = 1, A' = 1, B' = 1, F' = 1, G' = Y, H' = 0, X' = ?, Y' = ?;
  };
  transition t5 := {
    from   := f26;
    to     := f29;
    guard  := D > H;
    action := I' = 0, X' = ?, Y' = ?;
  };
  transition t6 := {
    from   := f29;
    to     := f29;
    guard  := D > I;
    action := I' = I + 1, J' = X, X' = ?, Y' = ?;
  };
  transition t7 := {
    from   := f38;
    to     := f41;
    guard  := D > H;
    action := I' = 0, X' = ?, Y' = ?;
  };
  transition t8 := {
    from   := f41;
    to     := f44;
    guard  := 0 > E && D > I;
    action := X' = ?, Y' = ?;
  };
  transition t9 := {
    from   := f41;
    to     := f44;
    guard  := E > 0 && D > I;
    action := X' = ?, Y' = ?;
  };
  transition t10 := {
    from   := f44;
    to     := f41;
    guard  := true;
    action := E' = 1, I' = I + 1, K' = 1, X' = ?, Y' = ?;
  };
  transition t11 := {
    from   := f44;
    to     := f41;
    guard  := true;
    action := E' = 0, I' = I + 1, K' = 0, X' = ?, Y' = ?;
  };
  transition t12 := {
    from   := f41;
    to     := f41;
    guard  := D > I && E = 0;
    action := E' = 0, I' = I + 1, K' = 0, X' = ?, Y' = ?;
  };
  transition t13 := {
    from   := f56;
    to     := f59;
    guard  := D > H;
    action := L' = 0, X' = ?, Y' = ?;
  };
  transition t14 := {
    from   := f59;
    to     := f62;
    guard  := D > 1 + L;
    action := M' = L + 1, X' = ?, Y' = ?;
  };
  transition t15 := {
    from   := f62;
    to     := f65;
    guard  := D > M && 0 > A;
    action := X' = ?, Y' = ?;
  };
  transition t16 := {
    from   := f62;
    to     := f65;
    guard  := D > M && A > 0;
    action := X' = ?, Y' = ?;
  };
  transition t17 := {
    from   := f65;
    to     := f62;
    guard  := X > Y;
    action := A' = 1, M' = M + 1, N' = 1, X' = ?, Y' = ?;
  };
  transition t18 := {
    from   := f65;
    to     := f62;
    guard  := true;
    action := A' = 1, M' = M + 1, N' = 1, X' = ?, Y' = ?;
  };
  transition t19 := {
    from   := f65;
    to     := f62;
    guard  := true;
    action := A' = 0, M' = M + 1, N' = 0, X' = ?, Y' = ?;
  };
  transition t20 := {
    from   := f62;
    to     := f62;
    guard  := D > M && A = 0;
    action := A' = 0, M' = M + 1, N' = 0, X' = ?, Y' = ?;
  };
  transition t21 := {
    from   := f77;
    to     := f80;
    guard  := D > I;
    action := O' = 0, X' = ?, Y' = ?;
  };
  transition t22 := {
    from   := f80;
    to     := f83;
    guard  := D > 1 + O;
    action := P' = O + 1, X' = ?, Y' = ?;
  };
  transition t23 := {
    from   := f83;
    to     := f86;
    guard  := D > P && 0 > B;
    action := X' = ?, Y' = ?;
  };
  transition t24 := {
    from   := f83;
    to     := f86;
    guard  := D > P && B > 0;
    action := X' = ?, Y' = ?;
  };
  transition t25 := {
    from   := f86;
    to     := f83;
    guard  := X > Y;
    action := B' = 1, P' = P + 1, Q' = 1, X' = ?, Y' = ?;
  };
  transition t26 := {
    from   := f86;
    to     := f83;
    guard  := true;
    action := B' = 1, P' = P + 1, Q' = 1, X' = ?, Y' = ?;
  };
  transition t27 := {
    from   := f86;
    to     := f83;
    guard  := true;
    action := B' = 0, P' = P + 1, Q' = 0, X' = ?, Y' = ?;
  };
  transition t28 := {
    from   := f83;
    to     := f83;
    guard  := D > P && B = 0;
    action := B' = 0, P' = P + 1, Q' = 0, X' = ?, Y' = ?;
  };
  transition t29 := {
    from   := f98;
    to     := f101;
    guard  := C > H;
    action := I' = 0, X' = ?, Y' = ?;
  };
  transition t30 := {
    from   := f101;
    to     := f104;
    guard  := C > I;
    action := R' = 0, X' = ?, Y' = ?;
  };
  transition t31 := {
    from   := f104;
    to     := f107;
    guard  := C > R;
    action := S' = 0, X' = ?, Y' = ?;
  };
  transition t32 := {
    from   := f107;
    to     := f110;
    guard  := C > S;
    action := T' = 0, X' = ?, Y' = ?;
  };
  transition t33 := {
    from   := f110;
    to     := f113;
    guard  := C > T;
    action := U' = 0, X' = ?, Y' = ?;
  };
  transition t34 := {
    from   := f113;
    to     := f117;
    guard  := 0 > F && C*T + U > C*R + S && C > U;
    action := X' = ?, Y' = ?;
  };
  transition t35 := {
    from   := f113;
    to     := f117;
    guard  := F > 0 && C*T + U > C*R + S && C > U;
    action := X' = ?, Y' = ?;
  };
  transition t36 := {
    from   := f113;
    to     := f113;
    guard  := C*R + S >= C*T + U && C > U;
    action := U' = U + 1, X' = ?, Y' = ?;
  };
  transition t37 := {
    from   := f117;
    to     := f113;
    guard  := X > Y;
    action := F' = 1, U' = U + 1, V' = 1, X' = ?, Y' = ?;
  };
  transition t38 := {
    from   := f117;
    to     := f113;
    guard  := true;
    action := F' = 1, U' = U + 1, V' = 1, X' = ?, Y' = ?;
  };
  transition t39 := {
    from   := f117;
    to     := f113;
    guard  := true;
    action := F' = 0, U' = U + 1, V' = 0, X' = ?, Y' = ?;
  };
  transition t40 := {
    from   := f113;
    to     := f113;
    guard  := C*T + U > C*R + S && C > U && F = 0;
    action := F' = 0, U' = U + 1, V' = 0, X' = ?, Y' = ?;
  };
  transition t41 := {
    from   := f137;
    to     := f146;
    guard  := 0 > F;
    action := W' = 0, X' = ?, Y' = ?;
  };
  transition t42 := {
    from   := f137;
    to     := f146;
    guard  := F > 0;
    action := W' = 0, X' = ?, Y' = ?;
  };
  transition t43 := {
    from   := f137;
    to     := f146;
    guard  := F = 0;
    action := F' = 0, W' = 1, X' = ?, Y' = ?;
  };
  transition t44 := {
    from   := f136;
    to     := f146;
    guard  := B = 0;
    action := B' = 0, W' = 1, X' = ?, Y' = ?;
  };
  transition t45 := {
    from   := f135;
    to     := f146;
    guard  := A = 0;
    action := A' = 0, W' = 1, X' = ?, Y' = ?;
  };
  transition t46 := {
    from   := f113;
    to     := f110;
    guard  := U >= C;
    action := T' = T + 1, X' = ?, Y' = ?;
  };
  transition t47 := {
    from   := f110;
    to     := f107;
    guard  := T >= C;
    action := S' = S + 1, X' = ?, Y' = ?;
  };
  transition t48 := {
    from   := f107;
    to     := f104;
    guard  := S >= C;
    action := R' = R + 1, X' = ?, Y' = ?;
  };
  transition t49 := {
    from   := f104;
    to     := f101;
    guard  := R >= C;
    action := I' = I + 1, X' = ?, Y' = ?;
  };
  transition t50 := {
    from   := f101;
    to     := f98;
    guard  := I >= C;
    action := H' = H + 1, X' = ?, Y' = ?;
  };
  transition t51 := {
    from   := f98;
    to     := f135;
    guard  := 0 > E && H >= C;
    action := X' = ?, Y' = ?;
  };
  transition t52 := {
    from   := f98;
    to     := f135;
    guard  := E > 0 && H >= C;
    action := X' = ?, Y' = ?;
  };
  transition t53 := {
    from   := f98;
    to     := f146;
    guard  := H >= C && E = 0;
    action := E' = 0, W' = 1, X' = ?, Y' = ?;
  };
  transition t54 := {
    from   := f83;
    to     := f80;
    guard  := P >= D;
    action := O' = O + 1, X' = ?, Y' = ?;
  };
  transition t55 := {
    from   := f80;
    to     := f77;
    guard  := O + 1 >= D;
    action := I' = I + 1, X' = ?, Y' = ?;
  };
  transition t56 := {
    from   := f77;
    to     := f98;
    guard  := I >= D;
    action := H' = 0, X' = ?, Y' = ?;
  };
  transition t57 := {
    from   := f62;
    to     := f59;
    guard  := M >= D;
    action := L' = L + 1, X' = ?, Y' = ?;
  };
  transition t58 := {
    from   := f59;
    to     := f56;
    guard  := L + 1 >= D;
    action := H' = H + 1, X' = ?, Y' = ?;
  };
  transition t59 := {
    from   := f56;
    to     := f77;
    guard  := H >= D;
    action := I' = 0, X' = ?, Y' = ?;
  };
  transition t60 := {
    from   := f41;
    to     := f38;
    guard  := I >= D;
    action := H' = H + 1, X' = ?, Y' = ?;
  };
  transition t61 := {
    from   := f38;
    to     := f56;
    guard  := H >= D;
    action := H' = 0, X' = ?, Y' = ?;
  };
  transition t62 := {
    from   := f29;
    to     := f26;
    guard  := I >= D;
    action := H' = H + 1, X' = ?, Y' = ?;
  };
  transition t63 := {
    from   := f26;
    to     := f38;
    guard  := H >= D;
    action := H' = 0, X' = ?, Y' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
