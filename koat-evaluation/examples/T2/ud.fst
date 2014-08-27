model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N;
  states f0, f15, f19, f33, f36, f41, f50, f54, f66, f70, f80, f84, f96;
  transition t0 := {
    from   := f0;
    to     := f15;
    guard  := true;
    action := A' = 50, B' = 5, C' = 0, N' = ?;
  };
  transition t1 := {
    from   := f15;
    to     := f19;
    guard  := B >= C;
    action := D' = 0, E' = 0, N' = ?;
  };
  transition t2 := {
    from   := f19;
    to     := f19;
    guard  := B >= E && E > C;
    action := D' = D + N, E' = E + 1, N' = ?;
  };
  transition t3 := {
    from   := f19;
    to     := f19;
    guard  := C > E && B >= E;
    action := D' = D + N, E' = E + 1, N' = ?;
  };
  transition t4 := {
    from   := f19;
    to     := f19;
    guard  := B >= E && C = E;
    action := D' = D + N, E' = C + 1, N' = ?;
  };
  transition t5 := {
    from   := f33;
    to     := f36;
    guard  := F > G;
    action := H' = G + 1, N' = ?;
  };
  transition t6 := {
    from   := f36;
    to     := f41;
    guard  := 0 > G && F >= H;
    action := I' = N, J' = 0, N' = ?;
  };
  transition t7 := {
    from   := f36;
    to     := f41;
    guard  := G > 0 && F >= H;
    action := I' = N, J' = 0, N' = ?;
  };
  transition t8 := {
    from   := f41;
    to     := f41;
    guard  := G > J;
    action := I' = N, J' = J + 1, N' = ?;
  };
  transition t9 := {
    from   := f36;
    to     := f36;
    guard  := F >= H && G = 0;
    action := G' = 0, H' = H + 1, I' = N, N' = ?;
  };
  transition t10 := {
    from   := f50;
    to     := f54;
    guard  := F >= H;
    action := I' = N, J' = 0, N' = ?;
  };
  transition t11 := {
    from   := f54;
    to     := f54;
    guard  := G >= J;
    action := I' = N, J' = J + 1, N' = ?;
  };
  transition t12 := {
    from   := f66;
    to     := f70;
    guard  := F >= G;
    action := H' = 0, I' = N, N' = ?;
  };
  transition t13 := {
    from   := f70;
    to     := f70;
    guard  := G > H;
    action := H' = H + 1, I' = N, N' = ?;
  };
  transition t14 := {
    from   := f80;
    to     := f84;
    guard  := G >= 0;
    action := H' = G + 1, I' = N, N' = ?;
  };
  transition t15 := {
    from   := f84;
    to     := f84;
    guard  := F >= H;
    action := H' = H + 1, I' = N, N' = ?;
  };
  transition t16 := {
    from   := f84;
    to     := f80;
    guard  := H > F;
    action := G' = G - 1, N' = ?;
  };
  transition t17 := {
    from   := f80;
    to     := f96;
    guard  := 0 > G;
    action := K' = 0, L' = 0, N' = ?;
  };
  transition t18 := {
    from   := f70;
    to     := f66;
    guard  := H >= G;
    action := G' = G + 1, N' = ?;
  };
  transition t19 := {
    from   := f66;
    to     := f80;
    guard  := G > F;
    action := G' = F - 1, N' = ?;
  };
  transition t20 := {
    from   := f54;
    to     := f50;
    guard  := J > G;
    action := H' = H + 1, N' = ?;
  };
  transition t21 := {
    from   := f50;
    to     := f33;
    guard  := H > F;
    action := G' = G + 1, N' = ?;
  };
  transition t22 := {
    from   := f41;
    to     := f36;
    guard  := J >= G;
    action := H' = H + 1, N' = ?;
  };
  transition t23 := {
    from   := f36;
    to     := f50;
    guard  := H > F;
    action := H' = G + 1, N' = ?;
  };
  transition t24 := {
    from   := f33;
    to     := f66;
    guard  := G >= F;
    action := G' = 1, N' = ?;
  };
  transition t25 := {
    from   := f19;
    to     := f15;
    guard  := E > B;
    action := C' = C + 1, N' = ?;
  };
  transition t26 := {
    from   := f15;
    to     := f33;
    guard  := C > B;
    action := M' = A, F' = B, G' = 0, N' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
