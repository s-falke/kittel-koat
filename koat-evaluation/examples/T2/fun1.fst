model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P;
  states f0, f1, f7, f2, f3, f6, f4;
  transition t0 := {
    from   := f0;
    to     := f1;
    guard  := true;
    action := O' = ?, P' = ?;
  };
  transition t1 := {
    from   := f1;
    to     := f7;
    guard  := 7 >= O && 7 >= P && 3 >= O && O > 0 && P > 0;
    action := A' = 1, B' = C, D' = E, F' = P, G' = O, H' = 0, I' = 1, J' = P, K' = O, L' = 7, O' = ?, P' = ?;
  };
  transition t2 := {
    from   := f1;
    to     := f7;
    guard  := 7 >= O && 7 >= P && O > 4 && P > 0;
    action := A' = 1, B' = C, D' = E, F' = P, G' = O, H' = 0, I' = 1, J' = P, K' = O, L' = 7, O' = ?, P' = ?;
  };
  transition t3 := {
    from   := f1;
    to     := f7;
    guard  := 7 >= P && P > 0;
    action := A' = 1, B' = C + 1, D' = E + 1, F' = P, G' = 4, H' = 1, I' = 1, C' = C + 1, E' = E + 1, J' = P, K' = 4, L' = 7, O' = ?, P' = ?;
  };
  transition t4 := {
    from   := f1;
    to     := f2;
    guard  := 7 >= P && 3 >= P && P > 0;
    action := A' = 0, B' = C, D' = E, F' = 3, G' = P, H' = 0, I' = 0, J' = 3, K' = P, L' = 2, O' = ?, P' = ?;
  };
  transition t5 := {
    from   := f1;
    to     := f2;
    guard  := 7 >= P && P > 4;
    action := A' = 0, B' = C, D' = E, F' = 3, G' = P, H' = 0, I' = 0, J' = 3, K' = P, L' = 2, O' = ?, P' = ?;
  };
  transition t6 := {
    from   := f1;
    to     := f2;
    guard  := true;
    action := A' = 0, B' = C + 1, D' = E + 1, F' = 3, G' = 4, H' = 1, I' = 0, C' = C + 1, E' = E + 1, J' = 3, K' = 4, L' = 2, O' = ?, P' = ?;
  };
  transition t7 := {
    from   := f2;
    to     := f7;
    guard  := 7 >= O && 7 >= P && 3 >= O && O > 0 && P > 0;
    action := A' = 1, B' = C, D' = E, F' = P, G' = O, I' = 1, J' = P, K' = O, L' = 7, O' = ?, P' = ?;
  };
  transition t8 := {
    from   := f2;
    to     := f7;
    guard  := 7 >= O && 7 >= P && O > 4 && P > 0;
    action := A' = 1, B' = C, D' = E, F' = P, G' = O, I' = 1, J' = P, K' = O, L' = 7, O' = ?, P' = ?;
  };
  transition t9 := {
    from   := f2;
    to     := f7;
    guard  := 7 >= P && P > 0;
    action := A' = 1, B' = C + 1, D' = E + 1, F' = P, G' = 4, H' = 1, I' = 1, C' = C + 1, E' = E + 1, J' = P, K' = 4, L' = 7, O' = ?, P' = ?;
  };
  transition t10 := {
    from   := f2;
    to     := f3;
    guard  := 7 >= O && 7 >= P && 3 >= O && O > 0 && P > 0;
    action := A' = 0, B' = C, D' = E, F' = P, G' = O, I' = 0, J' = P, K' = O, L' = 3, O' = ?, P' = ?;
  };
  transition t11 := {
    from   := f2;
    to     := f3;
    guard  := 7 >= O && 7 >= P && O > 4 && P > 0;
    action := A' = 0, B' = C, D' = E, F' = P, G' = O, I' = 0, J' = P, K' = O, L' = 3, O' = ?, P' = ?;
  };
  transition t12 := {
    from   := f2;
    to     := f3;
    guard  := 7 >= P && P > 0;
    action := A' = 0, B' = C + 1, D' = E + 1, F' = P, G' = 4, H' = 1, I' = 0, C' = C + 1, E' = E + 1, J' = P, K' = 4, L' = 3, O' = ?, P' = ?;
  };
  transition t13 := {
    from   := f3;
    to     := f6;
    guard  := 7 >= O && 7 >= P && 3 >= O && O > 0 && P > 0;
    action := A' = 1, B' = C, D' = E, F' = P, G' = O, I' = 1, J' = P, K' = O, L' = 6, O' = ?, P' = ?;
  };
  transition t14 := {
    from   := f3;
    to     := f6;
    guard  := 7 >= O && 7 >= P && O > 4 && P > 0;
    action := A' = 1, B' = C, D' = E, F' = P, G' = O, I' = 1, J' = P, K' = O, L' = 6, O' = ?, P' = ?;
  };
  transition t15 := {
    from   := f3;
    to     := f6;
    guard  := 7 >= P && P > 0;
    action := A' = 1, B' = C + 1, D' = E + 1, F' = P, G' = 4, H' = 1, I' = 1, C' = C + 1, E' = E + 1, J' = P, K' = 4, L' = 6, O' = ?, P' = ?;
  };
  transition t16 := {
    from   := f6;
    to     := f4;
    guard  := P > 0 && 7 >= P;
    action := A' = 1, B' = C, D' = E, F' = P, G' = 2, H' = 0, I' = 1, J' = P, K' = 2, L' = 4, O' = ?, P' = ?;
  };
  transition t17 := {
    from   := f6;
    to     := f4;
    guard  := 7 >= O && 1 >= P && P >= 0 && O > 0 && H = 1;
    action := A' = P, B' = C, D' = E, F' = O, G' = 7, H' = 1, I' = P, J' = O, K' = 7, L' = 4, O' = ?, P' = ?;
  };
  transition t18 := {
    from   := f4;
    to     := f2;
    guard  := M > 0 && M > E && N > 0 && N > C && 7 >= O && 7 >= P && 3 >= O && O > 0 && P > 0 && H = 1;
    action := A' = 0, B' = C, D' = E, F' = P, G' = O, H' = 1, I' = 0, J' = P, K' = O, L' = 2, O' = ?, P' = ?;
  };
  transition t19 := {
    from   := f4;
    to     := f2;
    guard  := M > 0 && M > E && N > 0 && N > C && 7 >= O && 7 >= P && O > 4 && P > 0 && H = 1;
    action := A' = 0, B' = C, D' = E, F' = P, G' = O, H' = 1, I' = 0, J' = P, K' = O, L' = 2, O' = ?, P' = ?;
  };
  transition t20 := {
    from   := f4;
    to     := f2;
    guard  := M > E + 1 && N > C + 1 && M > 0 && N > 0 && 7 >= P && P > 0;
    action := A' = 0, B' = C + 1, D' = E + 1, F' = P, G' = 4, H' = 1, I' = 0, C' = C + 1, E' = E + 1, J' = P, K' = 4, L' = 2, O' = ?, P' = ?;
  };
  transition t21 := {
    from   := f4;
    to     := f7;
    guard  := E >= M && C >= N && 7 >= O && 7 >= P && 3 >= O && O > 0 && P > 0;
    action := A' = 0, B' = C, D' = E, F' = P, G' = O, I' = 0, J' = P, K' = O, L' = 7, O' = ?, P' = ?;
  };
  transition t22 := {
    from   := f4;
    to     := f7;
    guard  := E >= M && C >= N && 7 >= O && 7 >= P && O > 4 && P > 0;
    action := A' = 0, B' = C, D' = E, F' = P, G' = O, I' = 0, J' = P, K' = O, L' = 7, O' = ?, P' = ?;
  };
  transition t23 := {
    from   := f4;
    to     := f7;
    guard  := E + 1 >= M && C + 1 >= N && 7 >= P && P > 0;
    action := A' = 0, B' = C + 1, D' = E + 1, F' = P, G' = 4, H' = 1, I' = 0, C' = C + 1, E' = E + 1, J' = P, K' = 4, L' = 7, O' = ?, P' = ?;
  };
  transition t24 := {
    from   := f4;
    to     := f7;
    guard  := 7 >= O && 7 >= P && 3 >= O && O > 0 && P > 0;
    action := A' = 1, B' = C, D' = E, F' = P, G' = O, I' = 1, J' = P, K' = O, L' = 7, O' = ?, P' = ?;
  };
  transition t25 := {
    from   := f4;
    to     := f7;
    guard  := 7 >= O && 7 >= P && O > 4 && P > 0;
    action := A' = 1, B' = C, D' = E, F' = P, G' = O, I' = 1, J' = P, K' = O, L' = 7, O' = ?, P' = ?;
  };
  transition t26 := {
    from   := f4;
    to     := f7;
    guard  := 7 >= P && P > 0;
    action := A' = 1, B' = C + 1, D' = E + 1, F' = P, G' = 4, H' = 1, I' = 1, C' = C + 1, E' = E + 1, J' = P, K' = 4, L' = 7, O' = ?, P' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
