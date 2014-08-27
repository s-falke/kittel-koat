model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1, C1, D1, E1, F1, G1, H1, I1;
  states f2, f5, f8, f17, f27, f31, f34, f46, f50, f53, f69, f80, f92, f101, f110, f119, f132, f1;
  transition t0 := {
    from   := f2;
    to     := f5;
    guard  := true;
    action := B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t1 := {
    from   := f5;
    to     := f8;
    guard  := A >= B;
    action := B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t2 := {
    from   := f8;
    to     := f8;
    guard  := A >= C;
    action := C' = C + 1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t3 := {
    from   := f17;
    to     := f17;
    guard  := A >= B;
    action := B' = B + 1, D' = B1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t4 := {
    from   := f27;
    to     := f31;
    guard  := 50 >= E;
    action := F' = 0, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t5 := {
    from   := f31;
    to     := f34;
    guard  := A > B;
    action := B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t6 := {
    from   := f34;
    to     := f34;
    guard  := A >= C;
    action := C' = C + 1, F' = F + B1, G' = B1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t7 := {
    from   := f46;
    to     := f50;
    guard  := 3 >= E;
    action := H' = B1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t8 := {
    from   := f46;
    to     := f50;
    guard  := E > 3;
    action := H' = 0, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t9 := {
    from   := f50;
    to     := f53;
    guard  := A > B;
    action := B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t10 := {
    from   := f69;
    to     := f53;
    guard  := H >= I;
    action := C' = C + 1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t11 := {
    from   := f53;
    to     := f53;
    guard  := A >= C && E > 4;
    action := C' = C + 1, J' = B1, K' = C1, L' = D1, M' = D1 + C1, N' = E1, O' = E1 + C1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t12 := {
    from   := f53;
    to     := f69;
    guard  := A >= C && 4 >= E;
    action := J' = B1, K' = C1, I' = D1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t13 := {
    from   := f53;
    to     := f69;
    guard  := E > 4 && A >= C && F1 > E1 + C1;
    action := J' = B1, K' = C1, L' = D1, M' = D1 + C1, N' = E1, O' = F1, I' = G1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t14 := {
    from   := f53;
    to     := f69;
    guard  := E > 4 && A >= C && E1 + C1 > F1;
    action := J' = B1, K' = C1, L' = D1, M' = D1 + C1, N' = E1, O' = F1, I' = G1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t15 := {
    from   := f53;
    to     := f69;
    guard  := E > 4 && A >= C && E1 > D1 + C1;
    action := J' = B1, K' = C1, L' = D1, M' = E1, I' = F1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t16 := {
    from   := f53;
    to     := f69;
    guard  := E > 4 && A >= C && D1 + C1 > E1;
    action := J' = B1, K' = C1, L' = D1, M' = E1, I' = F1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t17 := {
    from   := f69;
    to     := f80;
    guard  := I > H && E1 > D1 + K;
    action := P' = B1 - C1, Q' = D1, R' = E1, S' = F1, T' = G1, U' = H1, V' = I1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t18 := {
    from   := f69;
    to     := f80;
    guard  := I > H && D1 + K > E1;
    action := P' = B1 - C1, Q' = D1, R' = E1, S' = F1, T' = G1, U' = H1, V' = I1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t19 := {
    from   := f80;
    to     := f92;
    guard  := T >= 0;
    action := P' = B1, W' = C1, X' = D1, Y' = E1, Z' = F1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t20 := {
    from   := f69;
    to     := f92;
    guard  := I > H;
    action := P' = B1, Q' = C1, R' = C1 + K, S' = D1, W' = E1, X' = F1, Y' = G1, Z' = H1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t21 := {
    from   := f80;
    to     := f92;
    guard  := 0 > T;
    action := P' = B1, S' = -S, W' = C1, X' = D1, Y' = E1, Z' = F1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t22 := {
    from   := f92;
    to     := f92;
    guard  := B > A1;
    action := K' = B1, P' = C1, A1' = A1 + 1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t23 := {
    from   := f101;
    to     := f101;
    guard  := C > A1;
    action := K' = B1, P' = C1, A1' = A1 + 1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t24 := {
    from   := f110;
    to     := f110;
    guard  := A >= A1;
    action := K' = B1, P' = C1, A1' = A1 + 1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t25 := {
    from   := f119;
    to     := f119;
    guard  := A >= A1;
    action := K' = B1, P' = C1, A1' = A1 + 1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t26 := {
    from   := f132;
    to     := f132;
    guard  := A >= B;
    action := B' = B + 1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t27 := {
    from   := f132;
    to     := f27;
    guard  := B > A;
    action := E' = E + 1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t28 := {
    from   := f119;
    to     := f53;
    guard  := A1 > A;
    action := C' = C + 1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t29 := {
    from   := f110;
    to     := f119;
    guard  := A1 > A;
    action := B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t30 := {
    from   := f101;
    to     := f110;
    guard  := A1 >= C;
    action := B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t31 := {
    from   := f92;
    to     := f101;
    guard  := A1 >= B;
    action := B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t32 := {
    from   := f53;
    to     := f50;
    guard  := C > A;
    action := B' = B + 1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t33 := {
    from   := f50;
    to     := f132;
    guard  := B >= A;
    action := B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t34 := {
    from   := f34;
    to     := f31;
    guard  := C > A;
    action := B' = B + 1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t35 := {
    from   := f31;
    to     := f46;
    guard  := B >= A && 0 > F;
    action := B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t36 := {
    from   := f31;
    to     := f46;
    guard  := B >= A && F > 0;
    action := B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t37 := {
    from   := f31;
    to     := f1;
    guard  := B >= A && F = 0;
    action := F' = 0, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t38 := {
    from   := f27;
    to     := f1;
    guard  := E > 50;
    action := B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t39 := {
    from   := f17;
    to     := f27;
    guard  := B > A;
    action := B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t40 := {
    from   := f8;
    to     := f5;
    guard  := C > A;
    action := B' = B + 1, B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
  transition t41 := {
    from   := f5;
    to     := f17;
    guard  := B > A;
    action := B1' = ?, C1' = ?, D1' = ?, E1' = ?, F1' = ?, G1' = ?, H1' = ?, I1' = ?;
  };
}
strategy dumb {
  Region init := { state = f2 };
}
