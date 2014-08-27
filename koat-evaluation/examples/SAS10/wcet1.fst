model main {
  var A, B, C, D, E, F, G, H;
  states start, stop, cut, start0;
  transition t0 := {
    from   := start;
    to     := stop;
    guard  := 0 >= A && B = C && D = A && E = F && G = H;
    action := G' = D, E' = 0;
  };
  transition t1 := {
    from   := start;
    to     := cut;
    guard  := A > 1 && B = C && D = A && E = F && G = H;
    action := G' = D - 1, E' = 0;
  };
  transition t2 := {
    from   := start;
    to     := stop;
    guard  := D = 1 && B = C && A = 1 && E = F && G = H;
    action := G' = D - 1, E' = 0;
  };
  transition t3 := {
    from   := start;
    to     := cut;
    guard  := A > 1 && B = C && D = A && E = F && G = H;
    action := G' = D - 1, E' = 1, B' = 0;
  };
  transition t4 := {
    from   := start;
    to     := stop;
    guard  := D = 1 && B = C && A = 1 && E = F && G = H;
    action := G' = D - 1, E' = 0, B' = 0;
  };
  transition t5 := {
    from   := cut;
    to     := cut;
    guard  := G > 1 && E > 1 && G > 0 && E >= 0 && A > G && A >= G + E && D = A;
    action := G' = G - 1, E' = E - 1;
  };
  transition t6 := {
    from   := cut;
    to     := stop;
    guard  := E > 1 && E >= 0 && A > 1 && A > E && G = 1 && D = A;
    action := G' = G - 1, E' = E - 1;
  };
  transition t7 := {
    from   := cut;
    to     := cut;
    guard  := G > 1 && 1 >= E && G > 0 && E >= 0 && A > G && A >= G + E && D = A;
    action := G' = G - 1, E' = 0;
  };
  transition t8 := {
    from   := cut;
    to     := stop;
    guard  := 1 >= E && E >= 0 && A > 1 && A > E && G = 1 && D = A;
    action := G' = G - 1, E' = 0;
  };
  transition t9 := {
    from   := cut;
    to     := cut;
    guard  := G > 1 && A > E + 1 && G > 0 && E >= 0 && A > G && A >= G + E && D = A;
    action := G' = G - 1, E' = 1 + E, B' = E;
  };
  transition t10 := {
    from   := cut;
    to     := stop;
    guard  := A > E + 1 && E >= 0 && A > 1 && A > E && G = 1 && D = A;
    action := G' = G - 1, E' = 1 + E, B' = E;
  };
  transition t11 := {
    from   := cut;
    to     := cut;
    guard  := G > 1 && E + 1 >= A && G > 0 && E >= 0 && A > G && A >= G + E && D = A;
    action := G' = G - 1, E' = 0, B' = E;
  };
  transition t12 := {
    from   := cut;
    to     := stop;
    guard  := A > 0 && A > 1 && G = 1 && E + 1 = A && D = A;
    action := G' = G - 1, E' = 0, B' = E;
  };
  transition t13 := {
    from   := start0;
    to     := start;
    guard  := true;
    action := G' = H, E' = F, D' = A, B' = C;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
