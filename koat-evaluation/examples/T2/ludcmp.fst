model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M;
  states f69, f71, f0, f12, f15, f28, f30, f33, f42, f45, f59, f73, f82;
  transition t0 := {
    from   := f69;
    to     := f71;
    guard  := 0 > L;
    action := L' = ?, M' = ?;
  };
  transition t1 := {
    from   := f69;
    to     := f71;
    guard  := true;
    action := L' = ?, M' = ?;
  };
  transition t2 := {
    from   := f0;
    to     := f12;
    guard  := true;
    action := L' = ?, M' = ?;
  };
  transition t3 := {
    from   := f12;
    to     := f15;
    guard  := A >= B;
    action := C' = 0, L' = ?, M' = ?;
  };
  transition t4 := {
    from   := f15;
    to     := f15;
    guard  := C >= L && A >= D;
    action := D' = D + 1, E' = L, F' = L, L' = ?, M' = ?;
  };
  transition t5 := {
    from   := f15;
    to     := f15;
    guard  := L > C && A >= D;
    action := C' = L, D' = D + 1, E' = L, F' = L, L' = ?, M' = ?;
  };
  transition t6 := {
    from   := f28;
    to     := f30;
    guard  := A >= D;
    action := L' = ?, M' = ?;
  };
  transition t7 := {
    from   := f30;
    to     := f33;
    guard  := D > B;
    action := G' = L, L' = ?, M' = ?;
  };
  transition t8 := {
    from   := f33;
    to     := f33;
    guard  := B > H;
    action := G' = L, H' = H + 1, L' = ?, M' = ?;
  };
  transition t9 := {
    from   := f42;
    to     := f45;
    guard  := A >= B;
    action := G' = L, L' = ?, M' = ?;
  };
  transition t10 := {
    from   := f45;
    to     := f45;
    guard  := D > H;
    action := G' = L, H' = H + 1, L' = ?, M' = ?;
  };
  transition t11 := {
    from   := f59;
    to     := f59;
    guard  := A >= H;
    action := H' = H + 1, I' = L, L' = ?, M' = ?;
  };
  transition t12 := {
    from   := f71;
    to     := f73;
    guard  := A > D;
    action := I' = L, L' = ?, M' = ?;
  };
  transition t13 := {
    from   := f71;
    to     := f73;
    guard  := D > A;
    action := I' = L, L' = ?, M' = ?;
  };
  transition t14 := {
    from   := f73;
    to     := f73;
    guard  := A >= B;
    action := B' = B + 1, L' = ?, M' = ?;
  };
  transition t15 := {
    from   := f71;
    to     := f28;
    guard  := A = D;
    action := D' = A + 1, L' = ?, M' = ?;
  };
  transition t16 := {
    from   := f73;
    to     := f28;
    guard  := B > A;
    action := D' = D + 1, L' = ?, M' = ?;
  };
  transition t17 := {
    from   := f59;
    to     := f69;
    guard  := H > A;
    action := L' = ?, M' = ?;
  };
  transition t18 := {
    from   := f45;
    to     := f42;
    guard  := C > M && H >= D;
    action := B' = B + 1, J' = L, I' = M, L' = ?, M' = ?;
  };
  transition t19 := {
    from   := f45;
    to     := f42;
    guard  := L >= C && H >= D;
    action := B' = B + 1, C' = L, J' = M, I' = L, K' = B, L' = ?, M' = ?;
  };
  transition t20 := {
    from   := f42;
    to     := f59;
    guard  := B > A && K > D;
    action := L' = ?, M' = ?;
  };
  transition t21 := {
    from   := f42;
    to     := f59;
    guard  := B > A && D > K;
    action := L' = ?, M' = ?;
  };
  transition t22 := {
    from   := f42;
    to     := f69;
    guard  := B > A && D = K;
    action := K' = D, L' = ?, M' = ?;
  };
  transition t23 := {
    from   := f33;
    to     := f30;
    guard  := H >= B;
    action := B' = B + 1, L' = ?, M' = ?;
  };
  transition t24 := {
    from   := f30;
    to     := f42;
    guard  := B >= D;
    action := C' = 0, L' = ?, M' = ?;
  };
  transition t25 := {
    from   := f28;
    to     := f82;
    guard  := D > A;
    action := L' = ?, M' = ?;
  };
  transition t26 := {
    from   := f15;
    to     := f12;
    guard  := 0 > C && D > A;
    action := B' = B + 1, L' = ?, M' = ?;
  };
  transition t27 := {
    from   := f15;
    to     := f12;
    guard  := C > 0 && D > A;
    action := B' = B + 1, L' = ?, M' = ?;
  };
  transition t28 := {
    from   := f15;
    to     := f12;
    guard  := D > A && C = 0;
    action := B' = B + 1, C' = 0, L' = ?, M' = ?;
  };
  transition t29 := {
    from   := f12;
    to     := f28;
    guard  := B > A;
    action := L' = ?, M' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
