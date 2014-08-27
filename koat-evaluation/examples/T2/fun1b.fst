model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q;
  states f0, f1, f7, f2, f3, f6, f4;
  transition t0 := {
    from   := f0;
    to     := f1;
    guard  := true;
    action := P' = ?, Q' = ?;
  };
  transition t1 := {
    from   := f1;
    to     := f7;
    guard  := A > 0 && 7 >= P && 7 >= Q && 3 >= P && P > 0 && Q > 0;
    action := A' = A - 1, B' = 1, C' = D, E' = F, G' = Q, H' = P, I' = 0, J' = 1, K' = Q, L' = P, M' = 7, P' = ?, Q' = ?;
  };
  transition t2 := {
    from   := f1;
    to     := f7;
    guard  := 7 >= P && 7 >= Q && P > 4 && Q > 0;
    action := B' = 1, C' = D, E' = F, G' = Q, H' = P, I' = 0, J' = 1, K' = Q, L' = P, M' = 7, P' = ?, Q' = ?;
  };
  transition t3 := {
    from   := f1;
    to     := f7;
    guard  := 7 >= Q && Q > 0;
    action := B' = 1, C' = D + 1, E' = F + 1, G' = Q, H' = 4, I' = 1, J' = 1, D' = D + 1, F' = F + 1, K' = Q, L' = 4, M' = 7, P' = ?, Q' = ?;
  };
  transition t4 := {
    from   := f1;
    to     := f2;
    guard  := 7 >= Q && 3 >= Q && Q > 0;
    action := B' = 0, C' = D, E' = F, G' = 3, H' = Q, I' = 0, J' = 0, K' = 3, L' = Q, M' = 2, P' = ?, Q' = ?;
  };
  transition t5 := {
    from   := f1;
    to     := f2;
    guard  := 7 >= Q && Q > 4;
    action := B' = 0, C' = D, E' = F, G' = 3, H' = Q, I' = 0, J' = 0, K' = 3, L' = Q, M' = 2, P' = ?, Q' = ?;
  };
  transition t6 := {
    from   := f1;
    to     := f2;
    guard  := true;
    action := B' = 0, C' = D + 1, E' = F + 1, G' = 3, H' = 4, I' = 1, J' = 0, D' = D + 1, F' = F + 1, K' = 3, L' = 4, M' = 2, P' = ?, Q' = ?;
  };
  transition t7 := {
    from   := f2;
    to     := f7;
    guard  := 7 >= P && 7 >= Q && 3 >= P && P > 0 && Q > 0;
    action := B' = 1, C' = D, E' = F, G' = Q, H' = P, J' = 1, K' = Q, L' = P, M' = 7, P' = ?, Q' = ?;
  };
  transition t8 := {
    from   := f2;
    to     := f7;
    guard  := 7 >= P && 7 >= Q && P > 4 && Q > 0;
    action := B' = 1, C' = D, E' = F, G' = Q, H' = P, J' = 1, K' = Q, L' = P, M' = 7, P' = ?, Q' = ?;
  };
  transition t9 := {
    from   := f2;
    to     := f7;
    guard  := 7 >= Q && Q > 0;
    action := B' = 1, C' = D + 1, E' = F + 1, G' = Q, H' = 4, I' = 1, J' = 1, D' = D + 1, F' = F + 1, K' = Q, L' = 4, M' = 7, P' = ?, Q' = ?;
  };
  transition t10 := {
    from   := f2;
    to     := f3;
    guard  := 7 >= P && 7 >= Q && 3 >= P && P > 0 && Q > 0;
    action := B' = 0, C' = D, E' = F, G' = Q, H' = P, J' = 0, K' = Q, L' = P, M' = 3, P' = ?, Q' = ?;
  };
  transition t11 := {
    from   := f2;
    to     := f3;
    guard  := 7 >= P && 7 >= Q && P > 4 && Q > 0;
    action := B' = 0, C' = D, E' = F, G' = Q, H' = P, J' = 0, K' = Q, L' = P, M' = 3, P' = ?, Q' = ?;
  };
  transition t12 := {
    from   := f2;
    to     := f3;
    guard  := 7 >= Q && Q > 0;
    action := B' = 0, C' = D + 1, E' = F + 1, G' = Q, H' = 4, I' = 1, J' = 0, D' = D + 1, F' = F + 1, K' = Q, L' = 4, M' = 3, P' = ?, Q' = ?;
  };
  transition t13 := {
    from   := f3;
    to     := f6;
    guard  := 7 >= P && 7 >= Q && 3 >= P && P > 0 && Q > 0;
    action := B' = 1, C' = D, E' = F, G' = Q, H' = P, J' = 1, K' = Q, L' = P, M' = 6, P' = ?, Q' = ?;
  };
  transition t14 := {
    from   := f3;
    to     := f6;
    guard  := 7 >= P && 7 >= Q && P > 4 && Q > 0;
    action := B' = 1, C' = D, E' = F, G' = Q, H' = P, J' = 1, K' = Q, L' = P, M' = 6, P' = ?, Q' = ?;
  };
  transition t15 := {
    from   := f3;
    to     := f6;
    guard  := 7 >= Q && Q > 0;
    action := B' = 1, C' = D + 1, E' = F + 1, G' = Q, H' = 4, I' = 1, J' = 1, D' = D + 1, F' = F + 1, K' = Q, L' = 4, M' = 6, P' = ?, Q' = ?;
  };
  transition t16 := {
    from   := f6;
    to     := f4;
    guard  := Q > 0 && 7 >= Q;
    action := B' = 1, C' = D, E' = F, G' = Q, H' = 2, I' = 0, J' = 1, K' = Q, L' = 2, M' = 4, P' = ?, Q' = ?;
  };
  transition t17 := {
    from   := f6;
    to     := f4;
    guard  := 7 >= P && 1 >= Q && Q >= 0 && P > 0 && I = 1;
    action := B' = Q, C' = D, E' = F, G' = P, H' = 7, I' = 1, J' = Q, K' = P, L' = 7, M' = 4, P' = ?, Q' = ?;
  };
  transition t18 := {
    from   := f4;
    to     := f2;
    guard  := N > 0 && N > F && O > 0 && O > D && 7 >= P && 7 >= Q && 3 >= P && P > 0 && Q > 0 && I = 1;
    action := B' = 0, C' = D, E' = F, G' = Q, H' = P, I' = 1, J' = 0, K' = Q, L' = P, M' = 2, P' = ?, Q' = ?;
  };
  transition t19 := {
    from   := f4;
    to     := f2;
    guard  := N > 0 && N > F && O > 0 && O > D && 7 >= P && 7 >= Q && P > 4 && Q > 0 && I = 1;
    action := B' = 0, C' = D, E' = F, G' = Q, H' = P, I' = 1, J' = 0, K' = Q, L' = P, M' = 2, P' = ?, Q' = ?;
  };
  transition t20 := {
    from   := f4;
    to     := f2;
    guard  := N > F + 1 && O > D + 1 && N > 0 && O > 0 && 7 >= Q && Q > 0;
    action := B' = 0, C' = D + 1, E' = F + 1, G' = Q, H' = 4, I' = 1, J' = 0, D' = D + 1, F' = F + 1, K' = Q, L' = 4, M' = 2, P' = ?, Q' = ?;
  };
  transition t21 := {
    from   := f4;
    to     := f7;
    guard  := F >= N && D >= O && 7 >= P && 7 >= Q && 3 >= P && P > 0 && Q > 0;
    action := B' = 0, C' = D, E' = F, G' = Q, H' = P, J' = 0, K' = Q, L' = P, M' = 7, P' = ?, Q' = ?;
  };
  transition t22 := {
    from   := f4;
    to     := f7;
    guard  := F >= N && D >= O && 7 >= P && 7 >= Q && P > 4 && Q > 0;
    action := B' = 0, C' = D, E' = F, G' = Q, H' = P, J' = 0, K' = Q, L' = P, M' = 7, P' = ?, Q' = ?;
  };
  transition t23 := {
    from   := f4;
    to     := f7;
    guard  := F + 1 >= N && D + 1 >= O && 7 >= Q && Q > 0;
    action := B' = 0, C' = D + 1, E' = F + 1, G' = Q, H' = 4, I' = 1, J' = 0, D' = D + 1, F' = F + 1, K' = Q, L' = 4, M' = 7, P' = ?, Q' = ?;
  };
  transition t24 := {
    from   := f4;
    to     := f7;
    guard  := 7 >= P && 7 >= Q && 3 >= P && P > 0 && Q > 0;
    action := B' = 1, C' = D, E' = F, G' = Q, H' = P, J' = 1, K' = Q, L' = P, M' = 7, P' = ?, Q' = ?;
  };
  transition t25 := {
    from   := f4;
    to     := f7;
    guard  := 7 >= P && 7 >= Q && P > 4 && Q > 0;
    action := B' = 1, C' = D, E' = F, G' = Q, H' = P, J' = 1, K' = Q, L' = P, M' = 7, P' = ?, Q' = ?;
  };
  transition t26 := {
    from   := f4;
    to     := f7;
    guard  := 7 >= Q && Q > 0;
    action := B' = 1, C' = D + 1, E' = F + 1, G' = Q, H' = 4, I' = 1, J' = 1, D' = D + 1, F' = F + 1, K' = Q, L' = 4, M' = 7, P' = ?, Q' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
