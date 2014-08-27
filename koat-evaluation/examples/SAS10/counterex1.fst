model main {
  var A, B, C, D, E, F, G, H;
  states start, stop, lbl42, cut, lbl72, start0;
  transition t0 := {
    from   := start;
    to     := stop;
    guard  := 0 > A && B = C && D = A && E = F && G = H;
    action := ;
  };
  transition t1 := {
    from   := start;
    to     := lbl42;
    guard  := A >= 0 && C >= 0 && B = C && D = A && E = F && G = H;
    action := B' = B - 1;
  };
  transition t2 := {
    from   := start;
    to     := cut;
    guard  := A >= 0 && B = C && D = A && E = F && G = H;
    action := D' = D - 1;
  };
  transition t3 := {
    from   := start;
    to     := lbl72;
    guard  := H >= C && A >= 0 && B = C && D = A && E = F && G = H;
    action := E' = B, D' = D - 1, B' = 1 + B;
  };
  transition t4 := {
    from   := lbl72;
    to     := cut;
    guard  := A > D && D + 1 >= 0 && H + 1 >= B && E + 1 = B && G = H;
    action := ;
  };
  transition t5 := {
    from   := lbl72;
    to     := lbl72;
    guard  := H >= B && A > D && D + 1 >= 0 && H + 1 >= B && E + 1 = B && G = H;
    action := E' = B, B' = 1 + B;
  };
  transition t6 := {
    from   := lbl42;
    to     := lbl42;
    guard  := B >= 0 && B + 1 >= 0 && D >= 0 && A >= D && G = H;
    action := B' = B - 1;
  };
  transition t7 := {
    from   := lbl42;
    to     := cut;
    guard  := B + 1 >= 0 && D >= 0 && A >= D && G = H;
    action := D' = D - 1;
  };
  transition t8 := {
    from   := lbl42;
    to     := lbl72;
    guard  := H >= B && B + 1 >= 0 && D >= 0 && A >= D && G = H;
    action := E' = B, D' = D - 1, B' = 1 + B;
  };
  transition t9 := {
    from   := cut;
    to     := stop;
    guard  := A >= 0 && D + 1 = 0 && G = H;
    action := ;
  };
  transition t10 := {
    from   := cut;
    to     := lbl42;
    guard  := D >= 0 && B >= 0 && D + 1 >= 0 && A > D && G = H;
    action := B' = B - 1;
  };
  transition t11 := {
    from   := cut;
    to     := cut;
    guard  := D >= 0 && D + 1 >= 0 && A > D && G = H;
    action := D' = D - 1;
  };
  transition t12 := {
    from   := cut;
    to     := lbl72;
    guard  := H >= B && D >= 0 && D + 1 >= 0 && A > D && G = H;
    action := E' = B, D' = D - 1, B' = 1 + B;
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
