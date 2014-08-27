model main {
  var A, B, C, D, E, F, G, H, I;
  states start, stop, lbl142, lbl91, lbl131, start0;
  transition t0 := {
    from   := start;
    to     := stop;
    guard  := 0 > A && B = C && D = A && E = F && G = H;
    action := G' = D, I' = ?;
  };
  transition t1 := {
    from   := start;
    to     := lbl142;
    guard  := D = 0 && B = C && A = 0 && E = F && G = H;
    action := G' = D - 1, E' = 0, I' = ?;
  };
  transition t2 := {
    from   := start;
    to     := lbl91;
    guard  := A > 0 && B = C && D = A && E = F && G = H;
    action := G' = D, E' = 0, B' = I, I' = ?;
  };
  transition t3 := {
    from   := start;
    to     := lbl131;
    guard  := A > 0 && B = C && D = A && E = F && G = H;
    action := G' = D, E' = 1, I' = ?;
  };
  transition t4 := {
    from   := lbl142;
    to     := stop;
    guard  := A >= 0 && G + 1 = 0 && E = 0 && D = A;
    action := I' = ?;
  };
  transition t5 := {
    from   := lbl142;
    to     := lbl142;
    guard  := A > 0 && G = 0 && E = 1 && D = A;
    action := G' = G - 1, E' = 0, I' = ?;
  };
  transition t6 := {
    from   := lbl142;
    to     := lbl91;
    guard  := E > 1 && E >= 0 && A >= E && G + 1 = E && D = A;
    action := E' = 0, B' = I, I' = ?;
  };
  transition t7 := {
    from   := lbl142;
    to     := lbl131;
    guard  := E > 1 && E >= 0 && A >= E && G + 1 = E && D = A;
    action := E' = 1, I' = ?;
  };
  transition t8 := {
    from   := lbl131;
    to     := lbl142;
    guard  := G > 0 && A >= G && E = G && D = A;
    action := G' = G - 1, I' = ?;
  };
  transition t9 := {
    from   := lbl131;
    to     := lbl91;
    guard  := G > E && G >= E && E > 0 && A >= G && D = A;
    action := B' = I, I' = ?;
  };
  transition t10 := {
    from   := lbl131;
    to     := lbl131;
    guard  := G > E && G >= E && E > 0 && A >= G && D = A;
    action := E' = 1 + E, I' = ?;
  };
  transition t11 := {
    from   := lbl91;
    to     := lbl131;
    guard  := E >= 0 && G > E && A >= G && D = A;
    action := E' = 1 + E, I' = ?;
  };
  transition t12 := {
    from   := start0;
    to     := start;
    guard  := true;
    action := G' = H, E' = F, D' = A, B' = C, I' = ?;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
