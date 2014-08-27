model main {
  var A, B, C, D, E, F, G, H, I, J, K;
  states start, stop, lbl81, lbl21, lbl121, lbl141, lbl171, lbl191, start0;
  transition t0 := {
    from   := start;
    to     := stop;
    guard  := 0 >= A && B = C && D = E && F = G && H = I && J = A;
    action := H' = 0, D' = 0, B' = 0, K' = ?;
  };
  transition t1 := {
    from   := start;
    to     := lbl81;
    guard  := A > 0 && B = C && D = E && F = G && H = I && J = A;
    action := H' = 1, F' = K, D' = 0, B' = 0, K' = ?;
  };
  transition t2 := {
    from   := lbl21;
    to     := stop;
    guard  := A + D + B > 0 && A + D > B && A + B > D && A > D + B && H = A && J = A;
    action := K' = ?;
  };
  transition t3 := {
    from   := lbl21;
    to     := lbl81;
    guard  := A > H && A >= H && H + D + B > 0 && H + D > B && H + B > D && H > D + B && J = A;
    action := H' = 1 + H, F' = K, K' = ?;
  };
  transition t4 := {
    from   := lbl121;
    to     := stop;
    guard  := A + D + B > 1 && A + D > B + 1 && A + B >= D && A >= D + B && H = A && F = 0 && J = A;
    action := K' = ?;
  };
  transition t5 := {
    from   := lbl121;
    to     := lbl81;
    guard  := A > H && A >= H && H + D + B > 1 && H + D > B + 1 && H + B >= D && H >= D + B && F = 0 && J = A;
    action := H' = 1 + H, F' = K, K' = ?;
  };
  transition t6 := {
    from   := lbl141;
    to     := stop;
    guard  := A + D + B >= 0 && A + D >= B && A + B > D + 1 && A > D + B + 1 && H = A && F = 1 && J = A;
    action := K' = ?;
  };
  transition t7 := {
    from   := lbl141;
    to     := lbl81;
    guard  := A > H && A >= H && H + D + B >= 0 && H + D >= B && H + B > D + 1 && H > D + B + 1 && F = 1 && J = A;
    action := H' = 1 + H, F' = K, K' = ?;
  };
  transition t8 := {
    from   := lbl171;
    to     := stop;
    guard  := A + D + B > 1 && A + D >= B && A + B > D + 1 && A >= D + B && H = A && F = 2 && J = A;
    action := K' = ?;
  };
  transition t9 := {
    from   := lbl171;
    to     := lbl81;
    guard  := A > H && A >= H && H + D + B > 1 && H + D >= B && H + B > D + 1 && H >= D + B && F = 2 && J = A;
    action := H' = 1 + H, F' = K, K' = ?;
  };
  transition t10 := {
    from   := lbl191;
    to     := stop;
    guard  := A + D + B >= 0 && A + D > B + 1 && A + B >= D && A > D + B + 1 && H = A && F = 3 && J = A;
    action := K' = ?;
  };
  transition t11 := {
    from   := lbl191;
    to     := lbl81;
    guard  := A > H && A >= H && H + D + B >= 0 && H + D > B + 1 && H + B >= D && H > D + B + 1 && F = 3 && J = A;
    action := H' = 1 + H, F' = K, K' = ?;
  };
  transition t12 := {
    from   := lbl81;
    to     := lbl21;
    guard  := 0 > F && H + D > B && H + B > D && H > D + B && H + D + B > 0 && A >= H && J = A;
    action := K' = ?;
  };
  transition t13 := {
    from   := lbl81;
    to     := lbl21;
    guard  := F > 3 && H + D > B && H + B > D && H > D + B && H + D + B > 0 && A >= H && J = A;
    action := K' = ?;
  };
  transition t14 := {
    from   := lbl81;
    to     := lbl121;
    guard  := H + D > B && H + B > D && H > D + B && H + D + B > 0 && A >= H && F = 0 && J = A;
    action := D' = 1 + D, K' = ?;
  };
  transition t15 := {
    from   := lbl81;
    to     := lbl141;
    guard  := H + D > B && H + B > D && H > D + B && H + D + B > 0 && A >= H && F = 1 && J = A;
    action := D' = D - 1, K' = ?;
  };
  transition t16 := {
    from   := lbl81;
    to     := lbl171;
    guard  := H + D > B && H + B > D && H > D + B && H + D + B > 0 && A >= H && F = 2 && J = A;
    action := B' = 1 + B, K' = ?;
  };
  transition t17 := {
    from   := lbl81;
    to     := lbl191;
    guard  := H + D > B && H + B > D && H > D + B && H + D + B > 0 && A >= H && F = 3 && J = A;
    action := B' = B - 1, K' = ?;
  };
  transition t18 := {
    from   := start0;
    to     := start;
    guard  := true;
    action := J' = A, H' = I, F' = G, D' = E, B' = C, K' = ?;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
