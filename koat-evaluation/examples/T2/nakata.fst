model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N;
  states f25, f16, f0, f50, f73;
  transition t0 := {
    from   := f25;
    to     := f16;
    guard  := 0 >= A;
    action := K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t1 := {
    from   := f0;
    to     := f16;
    guard  := K >= 0 && L >= K && L >= 0 && M >= L && N >= 0 && M >= 0;
    action := B' = 1, C' = 0, D' = 1, E' = N, F' = 0, G' = M, H' = L, I' = K, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t2 := {
    from   := f16;
    to     := f25;
    guard  := I > 0 && 0 >= F && 0 >= E;
    action := F' = F + 1, A' = 0, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t3 := {
    from   := f16;
    to     := f25;
    guard  := I > 0 && F > 1 && 0 >= E && 1 >= N && N >= 0;
    action := A' = N, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t4 := {
    from   := f16;
    to     := f25;
    guard  := I > 0 && 0 >= E && 0 >= C && F = 1;
    action := C' = C + 1, A' = 1, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t5 := {
    from   := f16;
    to     := f25;
    guard  := I > 0 && 0 >= E && D > 0 && F = 1 && C = 1;
    action := C' = 0, D' = D - 1, A' = 0, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t6 := {
    from   := f16;
    to     := f25;
    guard  := I > 0 && 0 >= E && M >= 0 && 1 >= M && C > 1 && N >= 0 && F = 1;
    action := B' = B + 1, C' = 0, D' = B + 1, E' = N, F' = 0, A' = M, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t7 := {
    from   := f16;
    to     := f25;
    guard  := I > 0 && 0 >= E && 0 >= D && M >= 0 && 1 >= M && N >= 0 && F = 1 && C = 1;
    action := B' = B + 1, C' = 0, D' = B + 1, E' = N, F' = 0, A' = M, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t8 := {
    from   := f16;
    to     := f25;
    guard  := I > 0 && E > 0 && 1 >= N && N >= 0;
    action := E' = E - 1, A' = N, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t9 := {
    from   := f25;
    to     := f50;
    guard  := A > 0 && 0 >= F && 0 >= E;
    action := F' = F + 1, J' = 0, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t10 := {
    from   := f25;
    to     := f50;
    guard  := A > 0 && F > 1 && 0 >= E && 1 >= N && N >= 0;
    action := J' = N, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t11 := {
    from   := f25;
    to     := f50;
    guard  := A > 0 && 0 >= E && 0 >= C && F = 1;
    action := C' = C + 1, J' = 1, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t12 := {
    from   := f25;
    to     := f50;
    guard  := A > 0 && 0 >= E && D > 0 && F = 1 && C = 1;
    action := C' = 0, D' = D - 1, J' = 0, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t13 := {
    from   := f25;
    to     := f50;
    guard  := A > 0 && 0 >= E && M >= 0 && 1 >= M && C > 1 && N >= 0 && F = 1;
    action := B' = B + 1, C' = 0, D' = B + 1, E' = N, F' = 0, J' = M, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t14 := {
    from   := f25;
    to     := f50;
    guard  := A > 0 && 0 >= E && 0 >= D && M >= 0 && 1 >= M && N >= 0 && F = 1 && C = 1;
    action := B' = B + 1, C' = 0, D' = B + 1, E' = N, F' = 0, J' = M, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t15 := {
    from   := f25;
    to     := f50;
    guard  := A > 0 && E > 0 && 1 >= N && N >= 0;
    action := E' = E - 1, J' = N, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t16 := {
    from   := f50;
    to     := f16;
    guard  := I >= H && J > 0;
    action := K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t17 := {
    from   := f50;
    to     := f16;
    guard  := H > I && J > 0;
    action := I' = I + 1, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t18 := {
    from   := f50;
    to     := f16;
    guard  := 0 >= J;
    action := I' = I - 1, K' = ?, L' = ?, M' = ?, N' = ?;
  };
  transition t19 := {
    from   := f16;
    to     := f73;
    guard  := 0 >= I;
    action := K' = ?, L' = ?, M' = ?, N' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
