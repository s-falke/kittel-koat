model main {
  var A, B, C, D, E, F, G, H, I, J, K, L;
  states f0, f15, f36, f77, f48, f81;
  transition t0 := {
    from   := f0;
    to     := f15;
    guard  := K >= 0 && L >= 0;
    action := A' = 1, B' = 4, C' = K, D' = 0, E' = L, F' = 0, G' = 0, H' = 0, I' = 0, J' = 0, K' = ?, L' = ?;
  };
  transition t1 := {
    from   := f15;
    to     := f36;
    guard  := 0 >= D && 0 >= C && B > 0 && I = 0;
    action := D' = D + 1, F' = 0, G' = 0, H' = 0, I' = 0, J' = 0, K' = ?, L' = ?;
  };
  transition t2 := {
    from   := f15;
    to     := f36;
    guard  := D > 0 && 0 >= C && K >= 0 && B > 0 && 1 >= K && I = 0;
    action := B' = B - 1, D' = 0, F' = K, G' = 0, H' = 0, I' = 0, J' = 0, K' = ?, L' = ?;
  };
  transition t3 := {
    from   := f15;
    to     := f36;
    guard  := 0 >= C && L >= 0 && 1 >= L && 0 >= B && K >= 0 && I = 0;
    action := A' = A + 1, B' = A + 4, C' = K, D' = 0, F' = L, G' = 0, H' = 0, I' = 0, J' = 0, K' = ?, L' = ?;
  };
  transition t4 := {
    from   := f15;
    to     := f36;
    guard  := C > 0 && 1 >= K && K >= 0 && I = 0;
    action := C' = C - 1, F' = K, G' = 0, H' = 0, I' = 0, J' = 0, K' = ?, L' = ?;
  };
  transition t5 := {
    from   := f36;
    to     := f77;
    guard  := 0 >= H && J > E;
    action := K' = ?, L' = ?;
  };
  transition t6 := {
    from   := f36;
    to     := f77;
    guard  := H > 0;
    action := K' = ?, L' = ?;
  };
  transition t7 := {
    from   := f36;
    to     := f48;
    guard  := E >= J && 0 >= H && 0 >= D && 0 >= C && B > 0;
    action := D' = D + 1, G' = 0, K' = ?, L' = ?;
  };
  transition t8 := {
    from   := f36;
    to     := f48;
    guard  := E >= J && 0 >= H && D > 0 && 0 >= C && K >= 0 && B > 0 && 1 >= K;
    action := B' = B - 1, D' = 0, G' = K, K' = ?, L' = ?;
  };
  transition t9 := {
    from   := f36;
    to     := f48;
    guard  := E >= J && 0 >= H && 0 >= C && L >= 0 && 1 >= L && 0 >= B && K >= 0;
    action := A' = A + 1, B' = A + 4, C' = K, D' = 0, G' = L, K' = ?, L' = ?;
  };
  transition t10 := {
    from   := f36;
    to     := f48;
    guard  := E >= J && 0 >= H && C > 0 && 1 >= K && K >= 0;
    action := C' = C - 1, G' = K, K' = ?, L' = ?;
  };
  transition t11 := {
    from   := f48;
    to     := f36;
    guard  := 0 >= G;
    action := J' = J + 1, K' = ?, L' = ?;
  };
  transition t12 := {
    from   := f48;
    to     := f36;
    guard  := F > 0 && G > 0;
    action := J' = J + 1, K' = ?, L' = ?;
  };
  transition t13 := {
    from   := f48;
    to     := f36;
    guard  := G > 0 && 0 >= F && E + 1 >= A && 0 >= D && 0 >= C && B > 0;
    action := D' = D + 1, H' = 0, J' = J + 1, K' = ?, L' = ?;
  };
  transition t14 := {
    from   := f48;
    to     := f36;
    guard  := G > 0 && 0 >= F && E + 1 >= A && D > 0 && 0 >= C && K >= 0 && B > 0 && 1 >= K;
    action := B' = B - 1, D' = 0, H' = K, J' = J + 1, K' = ?, L' = ?;
  };
  transition t15 := {
    from   := f48;
    to     := f36;
    guard  := G > 0 && 0 >= F && E >= A && 0 >= C && L >= 0 && 1 >= L && 0 >= B && K >= 0;
    action := A' = A + 1, B' = A + 4, C' = K, D' = 0, H' = L, J' = J + 1, K' = ?, L' = ?;
  };
  transition t16 := {
    from   := f48;
    to     := f36;
    guard  := G > 0 && 0 >= F && E + 1 >= A && C > 0 && 1 >= K && K >= 0;
    action := C' = C - 1, H' = K, J' = J + 1, K' = ?, L' = ?;
  };
  transition t17 := {
    from   := f77;
    to     := f15;
    guard  := H > 0;
    action := K' = ?, L' = ?;
  };
  transition t18 := {
    from   := f77;
    to     := f15;
    guard  := 0 >= H;
    action := I' = 1, K' = ?, L' = ?;
  };
  transition t19 := {
    from   := f15;
    to     := f81;
    guard  := 0 > I;
    action := K' = ?, L' = ?;
  };
  transition t20 := {
    from   := f15;
    to     := f81;
    guard  := I > 0;
    action := K' = ?, L' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
