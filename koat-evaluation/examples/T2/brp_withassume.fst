model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S;
  states f47, f51, f45, f0, f10, f14, f22, f26, f41, f43, f58, f62, f81;
  transition t0 := {
    from   := f47;
    to     := f51;
    guard  := A > 0;
    action := R' = ?, S' = ?;
  };
  transition t1 := {
    from   := f51;
    to     := f45;
    guard  := 0 >= B;
    action := R' = ?, S' = ?;
  };
  transition t2 := {
    from   := f0;
    to     := f10;
    guard  := R > 0 && S >= 0;
    action := C' = R, D' = S, E' = 0, F' = 1, G' = 0, R' = ?, S' = ?;
  };
  transition t3 := {
    from   := f10;
    to     := f14;
    guard  := C > G && 0 >= G;
    action := H' = 1, R' = ?, S' = ?;
  };
  transition t4 := {
    from   := f10;
    to     := f14;
    guard  := C > G && G > 0;
    action := H' = 0, R' = ?, S' = ?;
  };
  transition t5 := {
    from   := f14;
    to     := f22;
    guard  := G + 1 >= C && 1 >= R && R >= 0;
    action := I' = 1, J' = K, L' = R, R' = ?, S' = ?;
  };
  transition t6 := {
    from   := f14;
    to     := f22;
    guard  := C > 1 + G && 1 >= R && R >= 0;
    action := I' = 0, J' = K, L' = R, R' = ?, S' = ?;
  };
  transition t7 := {
    from   := f22;
    to     := f26;
    guard  := L > 0 && 0 >= D && 0 >= E;
    action := E' = E + 1, R' = ?, S' = ?;
  };
  transition t8 := {
    from   := f22;
    to     := f26;
    guard  := L > 0 && 0 >= D && E = 1;
    action := E' = E + 1, R' = ?, S' = ?;
  };
  transition t9 := {
    from   := f22;
    to     := f26;
    guard  := E > 1 && 0 >= D && R >= 0;
    action := D' = R, E' = 0, F' = F + 1, R' = ?, S' = ?;
  };
  transition t10 := {
    from   := f22;
    to     := f26;
    guard  := D > 0;
    action := D' = D - 1, R' = ?, S' = ?;
  };
  transition t11 := {
    from   := f26;
    to     := f41;
    guard  := M > 0 && L > 0;
    action := A' = H, B' = I, N' = J, M' = 1, R' = ?, S' = ?;
  };
  transition t12 := {
    from   := f26;
    to     := f41;
    guard  := 0 >= M && L > 0;
    action := A' = H, B' = I, N' = J, M' = 1, O' = J, R' = ?, S' = ?;
  };
  transition t13 := {
    from   := f41;
    to     := f43;
    guard  := 0 > A && N = O;
    action := O' = N, R' = ?, S' = ?;
  };
  transition t14 := {
    from   := f41;
    to     := f43;
    guard  := A > 0 && N = O;
    action := O' = N, R' = ?, S' = ?;
  };
  transition t15 := {
    from   := f41;
    to     := f47;
    guard  := A = 0 && N = O;
    action := A' = 0, O' = N, R' = ?, S' = ?;
  };
  transition t16 := {
    from   := f43;
    to     := f45;
    guard  := B = 0;
    action := B' = 0, P' = 1, R' = ?, S' = ?;
  };
  transition t17 := {
    from   := f43;
    to     := f47;
    guard  := 0 > B;
    action := R' = ?, S' = ?;
  };
  transition t18 := {
    from   := f43;
    to     := f47;
    guard  := B > 0;
    action := R' = ?, S' = ?;
  };
  transition t19 := {
    from   := f47;
    to     := f45;
    guard  := 0 >= B && 0 >= A;
    action := P' = 2, R' = ?, S' = ?;
  };
  transition t20 := {
    from   := f47;
    to     := f51;
    guard  := B > 0 && 0 >= A;
    action := R' = ?, S' = ?;
  };
  transition t21 := {
    from   := f51;
    to     := f45;
    guard  := B > 0;
    action := P' = 3, R' = ?, S' = ?;
  };
  transition t22 := {
    from   := f41;
    to     := f58;
    guard  := R >= 0 && N > O && 1 >= R;
    action := Q' = R, R' = ?, S' = ?;
  };
  transition t23 := {
    from   := f41;
    to     := f58;
    guard  := R >= 0 && O > N && 1 >= R;
    action := Q' = R, R' = ?, S' = ?;
  };
  transition t24 := {
    from   := f45;
    to     := f58;
    guard  := R >= 0 && O > 0 && 1 >= R;
    action := O' = 0, Q' = R, R' = ?, S' = ?;
  };
  transition t25 := {
    from   := f45;
    to     := f58;
    guard  := R >= 0 && 0 >= O && 1 >= R;
    action := O' = 1, Q' = R, R' = ?, S' = ?;
  };
  transition t26 := {
    from   := f58;
    to     := f62;
    guard  := 0 >= E && 0 >= D && Q > 0;
    action := E' = E + 1, R' = ?, S' = ?;
  };
  transition t27 := {
    from   := f58;
    to     := f62;
    guard  := 0 >= D && Q > 0 && E = 1;
    action := E' = E + 1, R' = ?, S' = ?;
  };
  transition t28 := {
    from   := f58;
    to     := f62;
    guard  := E > 1 && 0 >= D && R >= 0;
    action := D' = R, E' = 0, F' = F + 1, R' = ?, S' = ?;
  };
  transition t29 := {
    from   := f58;
    to     := f62;
    guard  := D > 0;
    action := D' = D - 1, R' = ?, S' = ?;
  };
  transition t30 := {
    from   := f62;
    to     := f22;
    guard  := C >= F && R >= 0 && 0 >= Q && 1 >= R;
    action := L' = R, R' = ?, S' = ?;
  };
  transition t31 := {
    from   := f62;
    to     := f22;
    guard  := C >= F && R >= 0 && Q > 1 && 1 >= R;
    action := L' = R, R' = ?, S' = ?;
  };
  transition t32 := {
    from   := f26;
    to     := f22;
    guard  := 0 >= L && C >= F && 1 >= R && R >= 0;
    action := L' = R, R' = ?, S' = ?;
  };
  transition t33 := {
    from   := f62;
    to     := f10;
    guard  := K > 0 && C >= F && Q = 1;
    action := G' = G + 1, Q' = 1, K' = 0, R' = ?, S' = ?;
  };
  transition t34 := {
    from   := f62;
    to     := f10;
    guard  := 0 >= K && C >= F && Q = 1;
    action := G' = G + 1, Q' = 1, K' = 1, R' = ?, S' = ?;
  };
  transition t35 := {
    from   := f10;
    to     := f81;
    guard  := G >= C;
    action := R' = ?, S' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
