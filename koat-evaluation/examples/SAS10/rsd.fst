model main {
  var A, B, C, D, E, F, G, H;
  states start, stop, lbl82, lbl121, start0;
  transition t0 := {
    from   := start;
    to     := stop;
    guard  := 0 > A && B = C && D = A && E = F && G = H;
    action := ;
  };
  transition t1 := {
    from   := start;
    to     := lbl82;
    guard  := A >= 0 && B = C && D = A && E = F && G = H;
    action := G' = 2*D - 1, E' = 2*D;
  };
  transition t2 := {
    from   := start;
    to     := lbl121;
    guard  := A >= 0 && B = C && D = A && E = F && G = H;
    action := G' = 2*D - 1, E' = 2*D - 1, B' = 2*D;
  };
  transition t3 := {
    from   := lbl82;
    to     := stop;
    guard  := E >= A && 2*A >= E && D = A && G + 1 = A;
    action := ;
  };
  transition t4 := {
    from   := lbl82;
    to     := lbl82;
    guard  := G >= A && E > G && 2*A >= E && G + 1 >= A && D = A;
    action := G' = G - 1;
  };
  transition t5 := {
    from   := lbl82;
    to     := lbl121;
    guard  := G >= A && E > G && 2*A >= E && G + 1 >= A && D = A;
    action := G' = E - 1, E' = E - 1, B' = G;
  };
  transition t6 := {
    from   := lbl121;
    to     := stop;
    guard  := A > E && 2*A > E && B >= A && E + 1 >= B && G = E && D = A;
    action := ;
  };
  transition t7 := {
    from   := lbl121;
    to     := lbl82;
    guard  := E >= A && 2*A > E && B >= A && E + 1 >= B && G = E && D = A;
    action := G' = G - 1;
  };
  transition t8 := {
    from   := lbl121;
    to     := lbl121;
    guard  := E >= A && 2*A > E && B >= A && E + 1 >= B && G = E && D = A;
    action := G' = E - 1, E' = E - 1, B' = G;
  };
  transition t9 := {
    from   := start0;
    to     := start;
    guard  := true;
    action := G' = H, E' = F, D' = A, B' = C;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
