model main {
  var A, B, C, D, E, F, G, H;
  states start, stop, lbl71, start0;
  transition t0 := {
    from   := start;
    to     := stop;
    guard  := A > 100 && B = C && D = E && F = G && H = A;
    action := ;
  };
  transition t1 := {
    from   := start;
    to     := stop;
    guard  := G > E && B = C && D = E && F = G && H = A;
    action := ;
  };
  transition t2 := {
    from   := start;
    to     := lbl71;
    guard  := E >= G && 100 >= A && B = C && D = E && F = G && H = A;
    action := H' = F, F' = 1 + H, D' = D - 1, B' = H;
  };
  transition t3 := {
    from   := lbl71;
    to     := stop;
    guard  := A + G + E > B + 101 + D && E > D && 100 >= A && E >= G && 2*D + 2 + B >= A + G + E && 100 >= B && F = B + 1 && H + B + 1 + D = A + G + E;
    action := ;
  };
  transition t4 := {
    from   := lbl71;
    to     := stop;
    guard  := B >= D && E > D && 100 >= A && E >= G && 2*D + 2 + B >= A + G + E && 100 >= B && F = B + 1 && H + B + 1 + D = A + G + E;
    action := ;
  };
  transition t5 := {
    from   := lbl71;
    to     := lbl71;
    guard  := D > B && 101 + B + D >= A + G + E && E > D && 100 >= A && E >= G && 2*D + 2 + B >= A + G + E && 100 >= B && F = B + 1 && H + B + 1 + D = A + G + E;
    action := H' = F, F' = 1 + H, D' = D - 1, B' = H;
  };
  transition t6 := {
    from   := start0;
    to     := start;
    guard  := true;
    action := H' = A, F' = G, D' = E, B' = C;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
