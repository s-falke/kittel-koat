model main {
  var A, B, C, D, E, F;
  states start, stop, lbl6, lbl121, lbl111, cut, start0;
  transition t0 := {
    from   := start;
    to     := stop;
    guard  := 0 >= A && B = C && D = A && E = F;
    action := ;
  };
  transition t1 := {
    from   := start;
    to     := lbl6;
    guard  := A > 0 && A >= C && B = C && D = A && E = F;
    action := ;
  };
  transition t2 := {
    from   := start;
    to     := lbl121;
    guard  := A > 0 && C > A && B = C && D = A && E = F;
    action := E' = B - D;
  };
  transition t3 := {
    from   := lbl6;
    to     := stop;
    guard  := A > 0 && A >= C && E = F && D = A && B = C;
    action := ;
  };
  transition t4 := {
    from   := lbl111;
    to     := cut;
    guard  := C > A && A > 1 && E = 0 && D = A && B = C;
    action := ;
  };
  transition t5 := {
    from   := lbl111;
    to     := lbl111;
    guard  := E > 0 && A > E && E >= 0 && C > E + A && A > E + 1 && D = A && B = C;
    action := E' = E - 1;
  };
  transition t6 := {
    from   := lbl111;
    to     := lbl121;
    guard  := E > 0 && E >= A && E >= 0 && C > E + A && A > E + 1 && D = A && B = C;
    action := E' = E - D;
  };
  transition t7 := {
    from   := lbl121;
    to     := cut;
    guard  := C > A && A > 0 && C >= A && E = 0 && D = A && B = C;
    action := ;
  };
  transition t8 := {
    from   := lbl121;
    to     := lbl111;
    guard  := E > 0 && A > E && C > A && A > 0 && E >= 0 && C >= E + A && D = A && B = C;
    action := E' = E - 1;
  };
  transition t9 := {
    from   := lbl121;
    to     := lbl121;
    guard  := E > 0 && E >= A && C > A && A > 0 && E >= 0 && C >= E + A && D = A && B = C;
    action := E' = E - D;
  };
  transition t10 := {
    from   := cut;
    to     := stop;
    guard  := A > 0 && C > A && E = 0 && D = A && B = C;
    action := ;
  };
  transition t11 := {
    from   := start0;
    to     := start;
    guard  := true;
    action := E' = F, D' = A, B' = C;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
