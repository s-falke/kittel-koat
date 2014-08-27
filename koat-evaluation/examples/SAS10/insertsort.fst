model main {
  var A, B, C, D, E, F, G, H, I, J, K;
  states start, stop, lbl31, lbl43, lbl13, start0;
  transition t0 := {
    from   := start;
    to     := stop;
    guard  := 1 >= A && B = C && D = E && F = A && G = H && I = J;
    action := I' = 1, K' = ?;
  };
  transition t1 := {
    from   := start;
    to     := lbl31;
    guard  := A > 1 && B = C && D = E && F = A && G = H && I = J;
    action := I' = 1, B' = K, K' = ?;
  };
  transition t2 := {
    from   := lbl43;
    to     := lbl43;
    guard  := G >= 0 && I > G + 1 && G + 1 >= 0 && A > I && F = A;
    action := G' = G - 1, K' = ?;
  };
  transition t3 := {
    from   := lbl43;
    to     := lbl13;
    guard  := I > G + 1 && G + 1 >= 0 && A > I && F = A;
    action := I' = 1 + I, D' = I, K' = ?;
  };
  transition t4 := {
    from   := lbl31;
    to     := lbl43;
    guard  := I > 0 && A > I && F = A;
    action := G' = I - 2, K' = ?;
  };
  transition t5 := {
    from   := lbl31;
    to     := lbl13;
    guard  := I > 0 && A > I && F = A;
    action := I' = 1 + I, G' = I - 1, D' = I, K' = ?;
  };
  transition t6 := {
    from   := lbl13;
    to     := stop;
    guard  := G + A > 1 && G + 1 >= 0 && A > 1 + G && F = A && I = A && D + 1 = A;
    action := K' = ?;
  };
  transition t7 := {
    from   := lbl13;
    to     := lbl31;
    guard  := A > D + 1 && G + D > 0 && G + 1 >= 0 && A > D && D > G && F = A && I = D + 1;
    action := B' = K, K' = ?;
  };
  transition t8 := {
    from   := start0;
    to     := start;
    guard  := true;
    action := I' = J, G' = H, F' = A, D' = E, B' = C, K' = ?;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
