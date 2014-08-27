model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N;
  states f0, f16, f25, f50, f74;
  transition t0 := {
    from   := f0;
    to     := f16;
    guard  := K >= 0 && L >= K && L >= 0 && M >= L && N >= 0 && M >= 0;
    action := A' = 1, B' = 0, C' = 1, D' = N, E' = 0, F' = M, G' = L, H' = K, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t1 := {
    from   := f16;
    to     := f25;
    guard  := H > 0 && 0 >= E && 0 >= D;
    action := E' = E + 1, I' = 0, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t2 := {
    from   := f16;
    to     := f25;
    guard  := H > 0 && E > 1 && 0 >= D && 1 >= N && N >= 0;
    action := I' = N, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t3 := {
    from   := f16;
    to     := f25;
    guard  := H > 0 && 0 >= D && 0 >= B && E = 1;
    action := B' = B + 1, I' = 1, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t4 := {
    from   := f16;
    to     := f25;
    guard  := H > 0 && 0 >= D && C > 0 && E = 1 && B = 1;
    action := B' = 0, C' = C - 1, I' = 0, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t5 := {
    from   := f16;
    to     := f25;
    guard  := H > 0 && 0 >= D && M >= 0 && 1 >= M && B > 1 && N >= 0 && E = 1;
    action := A' = A + 1, B' = 0, C' = A + 1, D' = N, E' = 0, I' = M, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t6 := {
    from   := f16;
    to     := f25;
    guard  := H > 0 && 0 >= D && 0 >= C && M >= 0 && 1 >= M && N >= 0 && E = 1 && B = 1;
    action := A' = A + 1, B' = 0, C' = A + 1, D' = N, E' = 0, I' = M, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t7 := {
    from   := f16;
    to     := f25;
    guard  := H > 0 && D > 0 && 1 >= N && N >= 0;
    action := D' = D - 1, I' = N, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t8 := {
    from   := f25;
    to     := f50;
    guard  := I > 0 && 0 >= E && 0 >= D;
    action := E' = E + 1, J' = 0, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t9 := {
    from   := f25;
    to     := f50;
    guard  := I > 0 && E > 1 && 0 >= D && 1 >= N && N >= 0;
    action := J' = N, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t10 := {
    from   := f25;
    to     := f50;
    guard  := I > 0 && 0 >= D && 0 >= B && E = 1;
    action := B' = B + 1, J' = 1, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t11 := {
    from   := f25;
    to     := f50;
    guard  := I > 0 && 0 >= D && C > 0 && E = 1 && B = 1;
    action := B' = 0, C' = C - 1, J' = 0, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t12 := {
    from   := f25;
    to     := f50;
    guard  := I > 0 && 0 >= D && M >= 0 && 1 >= M && B > 1 && N >= 0 && E = 1;
    action := A' = A + 1, B' = 0, C' = A + 1, D' = N, E' = 0, J' = M, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t13 := {
    from   := f25;
    to     := f50;
    guard  := I > 0 && 0 >= D && 0 >= C && M >= 0 && 1 >= M && N >= 0 && E = 1 && B = 1;
    action := A' = A + 1, B' = 0, C' = A + 1, D' = N, E' = 0, J' = M, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t14 := {
    from   := f25;
    to     := f50;
    guard  := I > 0 && D > 0 && 1 >= N && N >= 0;
    action := D' = D - 1, J' = N, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t15 := {
    from   := f25;
    to     := f16;
    guard  := F + 1 >= A && 0 >= I;
    action := K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t16 := {
    from   := f50;
    to     := f16;
    guard  := J > 0 && F + 1 >= A && H >= G;
    action := K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t17 := {
    from   := f50;
    to     := f16;
    guard  := J > 0 && F + 1 >= A && G > H;
    action := H' = H + 1, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t18 := {
    from   := f50;
    to     := f16;
    guard  := F + 1 >= A && 0 >= J;
    action := H' = H - 1, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t19 := {
    from   := f16;
    to     := f74;
    guard  := 0 >= H;
    action := K' = ?, L' = ?, M' = ?, N' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
