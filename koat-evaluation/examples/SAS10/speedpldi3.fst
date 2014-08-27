model main {
  var A, B, C, D, E, F, G, H;
  states start, stop, lbl6, lbl121, cut, lbl141, start0;
  transition t0 := {
    from   := start;
    to     := stop;
    guard  := 0 >= A && B = C && D = A && E = F && G = H;
    action := ;
  };
  transition t1 := {
    from   := start;
    to     := lbl6;
    guard  := A > 0 && A >= C && B = C && D = A && E = F && G = H;
    action := ;
  };
  transition t2 := {
    from   := start;
    to     := lbl121;
    guard  := A > 0 && C > A && B = C && D = A && E = F && G = H;
    action := G' = 0, E' = 1;
  };
  transition t3 := {
    from   := lbl6;
    to     := stop;
    guard  := A > 0 && A >= C && G = H && E = F && D = A && B = C;
    action := ;
  };
  transition t4 := {
    from   := lbl121;
    to     := cut;
    guard  := G >= C && C > G && A + C > G + 2 && A >= E && E > 0 && G >= 0 && C > A && D = A && B = C;
    action := ;
  };
  transition t5 := {
    from   := lbl121;
    to     := lbl121;
    guard  := A > E && C > G && A + C > G + 2 && A >= E && E > 0 && G >= 0 && C > A && D = A && B = C;
    action := E' = 1 + E;
  };
  transition t6 := {
    from   := lbl121;
    to     := lbl141;
    guard  := C > G && A + C > G + 2 && A > 0 && G >= 0 && C > A && E = A && D = A && B = C;
    action := G' = 1 + G, E' = 0;
  };
  transition t7 := {
    from   := lbl141;
    to     := cut;
    guard  := A > 1 && C > A && C > 0 && G = C && E = 0 && D = A && B = C;
    action := ;
  };
  transition t8 := {
    from   := lbl141;
    to     := lbl121;
    guard  := A > 0 && C > G && A > 1 && C > A && G > 0 && C >= G && E = 0 && D = A && B = C;
    action := E' = 1 + E;
  };
  transition t9 := {
    from   := lbl141;
    to     := lbl141;
    guard  := 0 >= A && C > G && A > 1 && C > A && G > 0 && C >= G && E = 0 && D = A && B = C;
    action := G' = 1 + G, E' = 0;
  };
  transition t10 := {
    from   := cut;
    to     := stop;
    guard  := C > A && A > 1 && E = 0 && G = C && D = A && B = C;
    action := ;
  };
  transition t11 := {
    from   := start0;
    to     := start;
    guard  := true;
    action := G' = H, E' = F, D' = A, B' = C;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
