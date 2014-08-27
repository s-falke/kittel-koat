model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M;
  states f13, f31, f29, f19, f8, f27, f30, f28, f9, f300;
  transition t0 := {
    from   := f13;
    to     := f31;
    guard  := 0 > K;
    action := A' = L, B' = K, C' = -1 + C, D' = -1 + C, K' = ?, L' = ?, M' = ?;
  };
  transition t1 := {
    from   := f13;
    to     := f31;
    guard  := K > 0;
    action := A' = L, B' = K, C' = -1 + C, D' = -1 + C, K' = ?, L' = ?, M' = ?;
  };
  transition t2 := {
    from   := f13;
    to     := f29;
    guard  := true;
    action := A' = L, B' = 0, C' = -2 + D, D' = -1 + D, K' = ?, L' = ?, M' = ?;
  };
  transition t3 := {
    from   := f19;
    to     := f31;
    guard  := 0 > K;
    action := A' = L, B' = K, C' = -1 + C, D' = -1 + C, K' = ?, L' = ?, M' = ?;
  };
  transition t4 := {
    from   := f19;
    to     := f31;
    guard  := K > 0;
    action := A' = L, B' = K, C' = -1 + C, D' = -1 + C, K' = ?, L' = ?, M' = ?;
  };
  transition t5 := {
    from   := f19;
    to     := f29;
    guard  := true;
    action := A' = L, B' = 0, C' = -2 + D, D' = -1 + D, K' = ?, L' = ?, M' = ?;
  };
  transition t6 := {
    from   := f8;
    to     := f27;
    guard  := true;
    action := E' = 0, F' = 0, K' = ?, L' = ?, M' = ?;
  };
  transition t7 := {
    from   := f27;
    to     := f27;
    guard  := D > 0 && C + D > 0 && C > 0 && E = 0;
    action := A' = L, B' = 0, C' = -2 + D, D' = -1 + D, E' = 0, G' = 0, K' = ?, L' = ?, M' = ?;
  };
  transition t8 := {
    from   := f27;
    to     := f27;
    guard  := D > 0 && C > 0 && 0 > K && C + D > 0 && E = 0;
    action := A' = L, B' = K, C' = -1 + C, D' = -1 + C, E' = 0, G' = 0, K' = ?, L' = ?, M' = ?;
  };
  transition t9 := {
    from   := f27;
    to     := f27;
    guard  := D > 0 && C > 0 && K > 0 && C + D > 0 && E = 0;
    action := A' = L, B' = K, C' = -1 + C, D' = -1 + C, E' = 0, G' = 0, K' = ?, L' = ?, M' = ?;
  };
  transition t10 := {
    from   := f27;
    to     := f30;
    guard  := D > 0 && C > 0 && C + D > 0 && 0 > K && 0 > M && E = 0;
    action := A' = L, B' = K, C' = -1 + C, D' = -1 + C, E' = 1, H' = C, I' = D, G' = M, K' = ?, L' = ?, M' = ?;
  };
  transition t11 := {
    from   := f27;
    to     := f30;
    guard  := D > 0 && C > 0 && C + D > 0 && 0 > K && M > 0 && E = 0;
    action := A' = L, B' = K, C' = -1 + C, D' = -1 + C, E' = 1, H' = C, I' = D, G' = M, K' = ?, L' = ?, M' = ?;
  };
  transition t12 := {
    from   := f27;
    to     := f30;
    guard  := D > 0 && C > 0 && C + D > 0 && K > 0 && 0 > M && E = 0;
    action := A' = L, B' = K, C' = -1 + C, D' = -1 + C, E' = 1, H' = C, I' = D, G' = M, K' = ?, L' = ?, M' = ?;
  };
  transition t13 := {
    from   := f27;
    to     := f30;
    guard  := D > 0 && C > 0 && C + D > 0 && K > 0 && M > 0 && E = 0;
    action := A' = L, B' = K, C' = -1 + C, D' = -1 + C, E' = 1, H' = C, I' = D, G' = M, K' = ?, L' = ?, M' = ?;
  };
  transition t14 := {
    from   := f27;
    to     := f28;
    guard  := D > 0 && C > 0 && 0 > K && C + D > 0 && E = 0;
    action := A' = L, B' = 0, C' = -2 + D, D' = -1 + D, E' = 1, H' = C, I' = D, G' = K, K' = ?, L' = ?, M' = ?;
  };
  transition t15 := {
    from   := f27;
    to     := f28;
    guard  := D > 0 && C > 0 && K > 0 && C + D > 0 && E = 0;
    action := A' = L, B' = 0, C' = -2 + D, D' = -1 + D, E' = 1, H' = C, I' = D, G' = K, K' = ?, L' = ?, M' = ?;
  };
  transition t16 := {
    from   := f27;
    to     := f9;
    guard  := 0 >= C;
    action := J' = L, K' = ?, L' = ?, M' = ?;
  };
  transition t17 := {
    from   := f27;
    to     := f9;
    guard  := C > 0 && 0 >= D;
    action := J' = L, K' = ?, L' = ?, M' = ?;
  };
  transition t18 := {
    from   := f28;
    to     := f300;
    guard  := D >= I && C >= H && C + D >= H + I && D > 0 && C + D > 0 && C > 0 && E = 1;
    action := E' = 1, F' = 1, K' = ?, L' = ?, M' = ?;
  };
  transition t19 := {
    from   := f28;
    to     := f30;
    guard  := H > C && D > 0 && C > 0 && 0 > K && C + D > 0 && E = 1;
    action := A' = L, B' = K, C' = -1 + C, D' = -1 + C, E' = 1, K' = ?, L' = ?, M' = ?;
  };
  transition t20 := {
    from   := f28;
    to     := f30;
    guard  := H > C && D > 0 && C > 0 && K > 0 && C + D > 0 && E = 1;
    action := A' = L, B' = K, C' = -1 + C, D' = -1 + C, E' = 1, K' = ?, L' = ?, M' = ?;
  };
  transition t21 := {
    from   := f28;
    to     := f28;
    guard  := H > C && D > 0 && C + D > 0 && C > 0 && E = 1;
    action := A' = L, B' = 0, C' = -2 + D, D' = -1 + D, E' = 1, K' = ?, L' = ?, M' = ?;
  };
  transition t22 := {
    from   := f28;
    to     := f30;
    guard  := I > D && C >= H && D > 0 && C > 0 && 0 > K && C + D > 0 && E = 1;
    action := A' = L, B' = K, C' = -1 + C, D' = -1 + C, E' = 1, K' = ?, L' = ?, M' = ?;
  };
  transition t23 := {
    from   := f28;
    to     := f30;
    guard  := I > D && C >= H && D > 0 && C > 0 && K > 0 && C + D > 0 && E = 1;
    action := A' = L, B' = K, C' = -1 + C, D' = -1 + C, E' = 1, K' = ?, L' = ?, M' = ?;
  };
  transition t24 := {
    from   := f28;
    to     := f28;
    guard  := I > D && C >= H && D > 0 && C + D > 0 && C > 0 && E = 1;
    action := A' = L, B' = 0, C' = -2 + D, D' = -1 + D, E' = 1, K' = ?, L' = ?, M' = ?;
  };
  transition t25 := {
    from   := f28;
    to     := f9;
    guard  := 0 >= C;
    action := J' = L, K' = ?, L' = ?, M' = ?;
  };
  transition t26 := {
    from   := f28;
    to     := f9;
    guard  := C > 0 && 0 >= D;
    action := J' = L, K' = ?, L' = ?, M' = ?;
  };
  transition t27 := {
    from   := f29;
    to     := f300;
    guard  := D >= I && C >= H && C + D >= H + I && D > 0 && C + D > 0 && C > 0 && E = 1;
    action := E' = 1, F' = 1, K' = ?, L' = ?, M' = ?;
  };
  transition t28 := {
    from   := f29;
    to     := f31;
    guard  := H > C && D > 0 && C > 0 && 0 > K && C + D > 0 && E = 1;
    action := A' = L, B' = K, C' = -1 + C, D' = -1 + C, E' = 1, K' = ?, L' = ?, M' = ?;
  };
  transition t29 := {
    from   := f29;
    to     := f31;
    guard  := H > C && D > 0 && C > 0 && K > 0 && C + D > 0 && E = 1;
    action := A' = L, B' = K, C' = -1 + C, D' = -1 + C, E' = 1, K' = ?, L' = ?, M' = ?;
  };
  transition t30 := {
    from   := f29;
    to     := f29;
    guard  := H > C && D > 0 && C + D > 0 && C > 0 && E = 1;
    action := A' = L, B' = 0, C' = -2 + D, D' = -1 + D, E' = 1, K' = ?, L' = ?, M' = ?;
  };
  transition t31 := {
    from   := f29;
    to     := f31;
    guard  := I > D && C >= H && D > 0 && C > 0 && 0 > K && C + D > 0 && E = 1;
    action := A' = L, B' = K, C' = -1 + C, D' = -1 + C, E' = 1, K' = ?, L' = ?, M' = ?;
  };
  transition t32 := {
    from   := f29;
    to     := f31;
    guard  := I > D && C >= H && D > 0 && C > 0 && K > 0 && C + D > 0 && E = 1;
    action := A' = L, B' = K, C' = -1 + C, D' = -1 + C, E' = 1, K' = ?, L' = ?, M' = ?;
  };
  transition t33 := {
    from   := f29;
    to     := f29;
    guard  := I > D && C >= H && D > 0 && C + D > 0 && C > 0 && E = 1;
    action := A' = L, B' = 0, C' = -2 + D, D' = -1 + D, E' = 1, K' = ?, L' = ?, M' = ?;
  };
  transition t34 := {
    from   := f29;
    to     := f9;
    guard  := 0 >= C;
    action := J' = L, K' = ?, L' = ?, M' = ?;
  };
  transition t35 := {
    from   := f29;
    to     := f9;
    guard  := C > 0 && 0 >= D;
    action := J' = L, K' = ?, L' = ?, M' = ?;
  };
  transition t36 := {
    from   := f30;
    to     := f300;
    guard  := D >= I && C >= H && C + D >= H + I && D > 0 && C + D > 0 && C > 0 && E = 1;
    action := E' = 1, F' = 1, K' = ?, L' = ?, M' = ?;
  };
  transition t37 := {
    from   := f30;
    to     := f30;
    guard  := H > C && D > 0 && C > 0 && 0 > K && C + D > 0 && E = 1;
    action := A' = L, B' = K, C' = -1 + C, D' = -1 + C, E' = 1, K' = ?, L' = ?, M' = ?;
  };
  transition t38 := {
    from   := f30;
    to     := f30;
    guard  := H > C && D > 0 && C > 0 && K > 0 && C + D > 0 && E = 1;
    action := A' = L, B' = K, C' = -1 + C, D' = -1 + C, E' = 1, K' = ?, L' = ?, M' = ?;
  };
  transition t39 := {
    from   := f30;
    to     := f28;
    guard  := H > C && D > 0 && C + D > 0 && C > 0 && E = 1;
    action := A' = L, B' = 0, C' = -2 + D, D' = -1 + D, E' = 1, K' = ?, L' = ?, M' = ?;
  };
  transition t40 := {
    from   := f30;
    to     := f30;
    guard  := I > D && C >= H && D > 0 && C > 0 && 0 > K && C + D > 0 && E = 1;
    action := A' = L, B' = K, C' = -1 + C, D' = -1 + C, E' = 1, K' = ?, L' = ?, M' = ?;
  };
  transition t41 := {
    from   := f30;
    to     := f30;
    guard  := I > D && C >= H && D > 0 && C > 0 && K > 0 && C + D > 0 && E = 1;
    action := A' = L, B' = K, C' = -1 + C, D' = -1 + C, E' = 1, K' = ?, L' = ?, M' = ?;
  };
  transition t42 := {
    from   := f30;
    to     := f28;
    guard  := I > D && C >= H && D > 0 && C + D > 0 && C > 0 && E = 1;
    action := A' = L, B' = 0, C' = -2 + D, D' = -1 + D, E' = 1, K' = ?, L' = ?, M' = ?;
  };
  transition t43 := {
    from   := f30;
    to     := f9;
    guard  := 0 >= C;
    action := J' = L, K' = ?, L' = ?, M' = ?;
  };
  transition t44 := {
    from   := f31;
    to     := f300;
    guard  := D >= I && C >= H && C + D >= H + I && D > 0 && C + D > 0 && C > 0 && E = 1;
    action := E' = 1, F' = 1, K' = ?, L' = ?, M' = ?;
  };
  transition t45 := {
    from   := f31;
    to     := f31;
    guard  := H > C && D > 0 && C > 0 && 0 > K && C + D > 0 && E = 1;
    action := A' = L, B' = K, C' = -1 + C, D' = -1 + C, E' = 1, K' = ?, L' = ?, M' = ?;
  };
  transition t46 := {
    from   := f31;
    to     := f31;
    guard  := H > C && D > 0 && C > 0 && K > 0 && C + D > 0 && E = 1;
    action := A' = L, B' = K, C' = -1 + C, D' = -1 + C, E' = 1, K' = ?, L' = ?, M' = ?;
  };
  transition t47 := {
    from   := f31;
    to     := f29;
    guard  := H > C && D > 0 && C + D > 0 && C > 0 && E = 1;
    action := A' = L, B' = 0, C' = -2 + D, D' = -1 + D, E' = 1, K' = ?, L' = ?, M' = ?;
  };
  transition t48 := {
    from   := f31;
    to     := f31;
    guard  := I > D && C >= H && D > 0 && C > 0 && 0 > K && C + D > 0 && E = 1;
    action := A' = L, B' = K, C' = -1 + C, D' = -1 + C, E' = 1, K' = ?, L' = ?, M' = ?;
  };
  transition t49 := {
    from   := f31;
    to     := f31;
    guard  := I > D && C >= H && D > 0 && C > 0 && K > 0 && C + D > 0 && E = 1;
    action := A' = L, B' = K, C' = -1 + C, D' = -1 + C, E' = 1, K' = ?, L' = ?, M' = ?;
  };
  transition t50 := {
    from   := f31;
    to     := f29;
    guard  := I > D && C >= H && D > 0 && C + D > 0 && C > 0 && E = 1;
    action := A' = L, B' = 0, C' = -2 + D, D' = -1 + D, E' = 1, K' = ?, L' = ?, M' = ?;
  };
  transition t51 := {
    from   := f31;
    to     := f9;
    guard  := 0 >= C;
    action := J' = L, K' = ?, L' = ?, M' = ?;
  };
}
strategy dumb {
  Region init := { state = f8 };
}
