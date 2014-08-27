model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N;
  states f63, f11, f0, f40, f59, f43, f48, f54, f69;
  transition t0 := {
    from   := f63;
    to     := f11;
    guard  := A > B;
    action := L' = ?, M' = ?, N' = ?;
  };
  transition t1 := {
    from   := f0;
    to     := f11;
    guard  := true;
    action := B' = 10, C' = 20, D' = 1, E' = 20, F' = 0, G' = 0, L' = ?, M' = ?, N' = ?;
  };
  transition t2 := {
    from   := f11;
    to     := f11;
    guard  := D >= E && G = 0;
    action := G' = 1, L' = ?, M' = ?, N' = ?;
  };
  transition t3 := {
    from   := f11;
    to     := f11;
    guard  := D + 1 >= E && E > 1 + D && G = 0;
    action := G' = 1, L' = ?, M' = ?, N' = ?;
  };
  transition t4 := {
    from   := f11;
    to     := f11;
    guard  := E = D + 1 && G = 0;
    action := E' = D + 1, G' = 1, L' = ?, M' = ?, N' = ?;
  };
  transition t5 := {
    from   := f11;
    to     := f11;
    guard  := L > M && E = D + 1 && G = 0;
    action := E' = D + 1, G' = 1, H' = N, L' = ?, M' = ?, N' = ?;
  };
  transition t6 := {
    from   := f11;
    to     := f40;
    guard  := E > 1 + D && G = 0;
    action := G' = 0, H' = N, I' = L, J' = D + 1, A' = E, K' = M, L' = ?, M' = ?, N' = ?;
  };
  transition t7 := {
    from   := f40;
    to     := f59;
    guard  := 0 > F;
    action := L' = ?, M' = ?, N' = ?;
  };
  transition t8 := {
    from   := f40;
    to     := f59;
    guard  := F > 0;
    action := L' = ?, M' = ?, N' = ?;
  };
  transition t9 := {
    from   := f40;
    to     := f43;
    guard  := F = 0;
    action := F' = 0, J' = J + 1, L' = ?, M' = ?, N' = ?;
  };
  transition t10 := {
    from   := f43;
    to     := f43;
    guard  := K > N;
    action := J' = J + 1, L' = ?, M' = ?, N' = ?;
  };
  transition t11 := {
    from   := f48;
    to     := f48;
    guard  := true;
    action := A' = A - 1, L' = ?, M' = ?, N' = ?;
  };
  transition t12 := {
    from   := f54;
    to     := f40;
    guard  := 0 > F;
    action := L' = ?, M' = ?, N' = ?;
  };
  transition t13 := {
    from   := f54;
    to     := f40;
    guard  := F > 0;
    action := L' = ?, M' = ?, N' = ?;
  };
  transition t14 := {
    from   := f54;
    to     := f40;
    guard  := F = 0;
    action := F' = 0, H' = N, L' = ?, M' = ?, N' = ?;
  };
  transition t15 := {
    from   := f59;
    to     := f63;
    guard  := B > A;
    action := L' = ?, M' = ?, N' = ?;
  };
  transition t16 := {
    from   := f59;
    to     := f63;
    guard  := A >= B;
    action := E' = A - 1, L' = ?, M' = ?, N' = ?;
  };
  transition t17 := {
    from   := f63;
    to     := f11;
    guard  := B >= A;
    action := D' = J, L' = ?, M' = ?, N' = ?;
  };
  transition t18 := {
    from   := f48;
    to     := f54;
    guard  := A >= J;
    action := L' = ?, M' = ?, N' = ?;
  };
  transition t19 := {
    from   := f48;
    to     := f54;
    guard  := J > A;
    action := F' = 1, L' = ?, M' = ?, N' = ?;
  };
  transition t20 := {
    from   := f43;
    to     := f48;
    guard  := true;
    action := A' = A - 1, L' = ?, M' = ?, N' = ?;
  };
  transition t21 := {
    from   := f11;
    to     := f69;
    guard  := 0 > G;
    action := L' = ?, M' = ?, N' = ?;
  };
  transition t22 := {
    from   := f11;
    to     := f69;
    guard  := G > 0;
    action := L' = ?, M' = ?, N' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
