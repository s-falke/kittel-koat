model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M;
  states f69, f71, f2, f5, f9, f23, f26, f30, f40, f44, f59, f74, f1;
  transition t0 := {
    from   := f69;
    to     := f71;
    guard  := 0 > L;
    action := L' = ?, M' = ?;
  };
  transition t1 := {
    from   := f69;
    to     := f71;
    guard  := L > 0;
    action := L' = ?, M' = ?;
  };
  transition t2 := {
    from   := f2;
    to     := f5;
    guard  := true;
    action := L' = ?, M' = ?;
  };
  transition t3 := {
    from   := f5;
    to     := f9;
    guard  := A >= B;
    action := C' = 0, L' = ?, M' = ?;
  };
  transition t4 := {
    from   := f9;
    to     := f9;
    guard  := C >= L && A >= D;
    action := D' = D + 1, E' = L, F' = L, L' = ?, M' = ?;
  };
  transition t5 := {
    from   := f9;
    to     := f9;
    guard  := L > C && A >= D;
    action := C' = L, D' = D + 1, E' = L, F' = L, L' = ?, M' = ?;
  };
  transition t6 := {
    from   := f23;
    to     := f26;
    guard  := A >= D;
    action := L' = ?, M' = ?;
  };
  transition t7 := {
    from   := f26;
    to     := f30;
    guard  := D > B;
    action := G' = L, L' = ?, M' = ?;
  };
  transition t8 := {
    from   := f30;
    to     := f30;
    guard  := B > H;
    action := G' = G - L*M, H' = H + 1, L' = ?, M' = ?;
  };
  transition t9 := {
    from   := f40;
    to     := f44;
    guard  := A >= B;
    action := G' = L, L' = ?, M' = ?;
  };
  transition t10 := {
    from   := f44;
    to     := f44;
    guard  := D > H;
    action := G' = G - L*M, H' = H + 1, L' = ?, M' = ?;
  };
  transition t11 := {
    from   := f59;
    to     := f59;
    guard  := A >= H;
    action := H' = H + 1, I' = L, L' = ?, M' = ?;
  };
  transition t12 := {
    from   := f69;
    to     := f71;
    guard  := true;
    action := L' = ?, M' = ?;
  };
  transition t13 := {
    from   := f71;
    to     := f74;
    guard  := A > D;
    action := I' = L, L' = ?, M' = ?;
  };
  transition t14 := {
    from   := f71;
    to     := f74;
    guard  := D > A;
    action := I' = L, L' = ?, M' = ?;
  };
  transition t15 := {
    from   := f74;
    to     := f74;
    guard  := A >= B;
    action := B' = B + 1, L' = ?, M' = ?;
  };
  transition t16 := {
    from   := f71;
    to     := f23;
    guard  := A = D;
    action := D' = A + 1, L' = ?, M' = ?;
  };
  transition t17 := {
    from   := f74;
    to     := f23;
    guard  := B > A;
    action := D' = D + 1, L' = ?, M' = ?;
  };
  transition t18 := {
    from   := f59;
    to     := f69;
    guard  := H > A;
    action := L' = ?, M' = ?;
  };
  transition t19 := {
    from   := f44;
    to     := f40;
    guard  := C > L*M && H >= D;
    action := B' = B + 1, J' = L, I' = L*M, L' = ?, M' = ?;
  };
  transition t20 := {
    from   := f44;
    to     := f40;
    guard  := L*M >= C && H >= D;
    action := B' = B + 1, C' = L*M, J' = M, I' = L*M, K' = B, L' = ?, M' = ?;
  };
  transition t21 := {
    from   := f40;
    to     := f59;
    guard  := B > A && K > D;
    action := L' = ?, M' = ?;
  };
  transition t22 := {
    from   := f40;
    to     := f59;
    guard  := B > A && D > K;
    action := L' = ?, M' = ?;
  };
  transition t23 := {
    from   := f40;
    to     := f69;
    guard  := B > A && D = K;
    action := K' = D, L' = ?, M' = ?;
  };
  transition t24 := {
    from   := f30;
    to     := f26;
    guard  := H >= B;
    action := B' = B + 1, L' = ?, M' = ?;
  };
  transition t25 := {
    from   := f26;
    to     := f40;
    guard  := B >= D;
    action := C' = 0, L' = ?, M' = ?;
  };
  transition t26 := {
    from   := f23;
    to     := f1;
    guard  := D > A;
    action := L' = ?, M' = ?;
  };
  transition t27 := {
    from   := f9;
    to     := f5;
    guard  := 0 > C && D > A;
    action := B' = B + 1, L' = ?, M' = ?;
  };
  transition t28 := {
    from   := f9;
    to     := f5;
    guard  := C > 0 && D > A;
    action := B' = B + 1, L' = ?, M' = ?;
  };
  transition t29 := {
    from   := f9;
    to     := f5;
    guard  := D > A && C = 0;
    action := B' = B + 1, C' = 0, L' = ?, M' = ?;
  };
  transition t30 := {
    from   := f5;
    to     := f23;
    guard  := B > A;
    action := L' = ?, M' = ?;
  };
}
strategy dumb {
  Region init := { state = f2 };
}
