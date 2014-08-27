model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M;
  states start, stop, lbl71, lbl53, lbl13, start0;
  transition t0 := {
    from   := start;
    to     := stop;
    guard  := 1 >= A && B = C && D = E && F = G && H = A && I = J && K = L;
    action := K' = H - 1, M' = ?;
  };
  transition t1 := {
    from   := start;
    to     := lbl71;
    guard  := A > 1 && B = C && D = E && F = G && H = A && I = J && K = L;
    action := K' = H - 1, I' = 0, F' = M, D' = 0, M' = ?;
  };
  transition t2 := {
    from   := start;
    to     := lbl53;
    guard  := A > 1 && B = C && D = E && F = G && H = A && I = J && K = L;
    action := K' = H - 1, I' = 1, D' = 0, B' = 0, M' = ?;
  };
  transition t3 := {
    from   := lbl71;
    to     := lbl53;
    guard  := D >= 0 && I >= D && K > I && A > K && H = A;
    action := I' = 1 + I, D' = 1, B' = I, M' = ?;
  };
  transition t4 := {
    from   := lbl53;
    to     := stop;
    guard  := B >= 0 && A > B + 1 && I = B + 1 && D = 0 && K = B + 1 && H = A;
    action := M' = ?;
  };
  transition t5 := {
    from   := lbl53;
    to     := lbl13;
    guard  := 0 > D && B >= 0 && D >= 0 && 1 >= D && A > B + 1 && I = B + 1 && K = B + 1 && H = A;
    action := K' = K - 1, M' = ?;
  };
  transition t6 := {
    from   := lbl53;
    to     := lbl13;
    guard  := B >= 0 && A > B + 1 && D = 1 && I = B + 1 && K = B + 1 && H = A;
    action := K' = K - 1, M' = ?;
  };
  transition t7 := {
    from   := lbl53;
    to     := lbl71;
    guard  := K > B + 1 && B >= 0 && D >= 0 && K > B && 1 >= D && A > K && I = B + 1 && H = A;
    action := F' = M, M' = ?;
  };
  transition t8 := {
    from   := lbl53;
    to     := lbl53;
    guard  := K > B + 1 && B >= 0 && D >= 0 && K > B && 1 >= D && A > K && I = B + 1 && H = A;
    action := I' = 1 + I, B' = I, M' = ?;
  };
  transition t9 := {
    from   := lbl13;
    to     := stop;
    guard  := A > 1 && K = 0 && D = 1 && H = A && I = 1 && B = 0;
    action := M' = ?;
  };
  transition t10 := {
    from   := lbl13;
    to     := lbl71;
    guard  := B > 0 && B >= 0 && A > 1 + B && D = 1 && H = A && K = B && I = 1 + B;
    action := I' = 0, F' = M, D' = 0, M' = ?;
  };
  transition t11 := {
    from   := lbl13;
    to     := lbl53;
    guard  := B > 0 && B >= 0 && A > 1 + B && D = 1 && H = A && K = B && I = 1 + B;
    action := I' = 1, D' = 0, B' = 0, M' = ?;
  };
  transition t12 := {
    from   := start0;
    to     := start;
    guard  := true;
    action := K' = L, I' = J, H' = A, F' = G, D' = E, B' = C, M' = ?;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
