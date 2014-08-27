model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O;
  states start, stop, lbl53, lbl91, lbl13, start0;
  transition t0 := {
    from   := start;
    to     := stop;
    guard  := 1 >= A && B = C && D = E && F = G && H = I && J = K && L = M && N = A;
    action := L' = 0, O' = ?;
  };
  transition t1 := {
    from   := start;
    to     := lbl53;
    guard  := A > 1 && B = C && D = E && F = G && H = I && J = K && L = M && N = A;
    action := L' = 0, J' = 2, H' = 0, D' = 1, O' = ?;
  };
  transition t2 := {
    from   := start;
    to     := lbl53;
    guard  := A > 1 && B = C && D = E && F = G && H = I && J = K && L = M && N = A;
    action := L' = 0, J' = 2, H' = 1, D' = 1, O' = ?;
  };
  transition t3 := {
    from   := lbl91;
    to     := lbl13;
    guard  := D >= H && D > 0 && H + 1 >= D && A > D && N = A && L + 1 = D && J = A;
    action := L' = 1 + L, B' = L, O' = ?;
  };
  transition t4 := {
    from   := lbl53;
    to     := lbl91;
    guard  := D >= H && D > 0 && A > D && H + 1 >= D && J = A && L + 1 = D && N = A;
    action := F' = O, O' = ?;
  };
  transition t5 := {
    from   := lbl53;
    to     := lbl53;
    guard  := A > J && D >= H && D > 0 && A >= J && J > D && H + 1 >= D && L + 1 = D && N = A;
    action := J' = 1 + J, D' = J, O' = ?;
  };
  transition t6 := {
    from   := lbl53;
    to     := lbl53;
    guard  := A > J && D >= H && D > 0 && A >= J && J > D && H + 1 >= D && L + 1 = D && N = A;
    action := J' = 1 + J, H' = J, D' = J, O' = ?;
  };
  transition t7 := {
    from   := lbl13;
    to     := stop;
    guard  := H + 2 >= A && A > 1 && A > H && L + 1 = A && B + 2 = A && D + 1 = A && N = A && J = A;
    action := O' = ?;
  };
  transition t8 := {
    from   := lbl13;
    to     := lbl53;
    guard  := A > B + 2 && A > B + 1 && H >= B && B >= 0 && B + 1 >= H && L = B + 1 && D = B + 1 && N = A && J = A;
    action := J' = 2 + L, H' = L, D' = 1 + L, O' = ?;
  };
  transition t9 := {
    from   := lbl13;
    to     := lbl53;
    guard  := A > B + 2 && A > B + 1 && H >= B && B >= 0 && B + 1 >= H && L = B + 1 && D = B + 1 && N = A && J = A;
    action := J' = 2 + L, H' = 1 + L, D' = 1 + L, O' = ?;
  };
  transition t10 := {
    from   := start0;
    to     := start;
    guard  := true;
    action := N' = A, L' = M, J' = K, H' = I, F' = G, D' = E, B' = C, O' = ?;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
