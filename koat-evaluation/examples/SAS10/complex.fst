model main {
  var A, B, C, D;
  states start, stop, lbl171, lbl151, start0;
  transition t0 := {
    from   := start;
    to     := stop;
    guard  := A > 29 && B = C && D = A;
    action := ;
  };
  transition t1 := {
    from   := start;
    to     := lbl171;
    guard  := C >= A && 29 >= A && B = C && D = A;
    action := D' = 2 + D, B' = B - 10;
  };
  transition t2 := {
    from   := start;
    to     := lbl151;
    guard  := A > C && C > 5 && 29 >= A && B = C && D = A;
    action := D' = 1 + D, B' = 7 + B;
  };
  transition t3 := {
    from   := start;
    to     := lbl151;
    guard  := A > C && 5 >= C && 29 >= A && B = C && D = A;
    action := D' = 1 + D, B' = 2 + B;
  };
  transition t4 := {
    from   := lbl171;
    to     := stop;
    guard  := D > 29 && 29 >= A && 5*D + B >= 5*A + C && 7*D + C > B + 7*A + 23 && 7*B + 1674 >= 19*D + 35*A + 7*C && B + 12 >= D;
    action := ;
  };
  transition t5 := {
    from   := lbl171;
    to     := lbl171;
    guard  := B >= D && 29 >= D && 29 >= A && 5*D + B >= 5*A + C && 7*D + C > B + 7*A + 23 && 7*B + 1674 >= 19*D + 35*A + 7*C && B + 12 >= D;
    action := D' = 2 + D, B' = B - 10;
  };
  transition t6 := {
    from   := lbl171;
    to     := lbl151;
    guard  := D > B && B > 5 && 29 >= D && 29 >= A && 5*D + B >= 5*A + C && 7*D + C > B + 7*A + 23 && 7*B + 1674 >= 19*D + 35*A + 7*C && B + 12 >= D;
    action := D' = 1 + D, B' = 7 + B;
  };
  transition t7 := {
    from   := lbl171;
    to     := lbl151;
    guard  := D > B && 5 >= B && 29 >= D && 29 >= A && 5*D + B >= 5*A + C && 7*D + C > B + 7*A + 23 && 7*B + 1674 >= 19*D + 35*A + 7*C && B + 12 >= D;
    action := D' = 1 + D, B' = 2 + B;
  };
  transition t8 := {
    from   := lbl151;
    to     := lbl171;
    guard  := B >= D && 6*D > 5*A + C + 6 && 5*D + B > 5*A + C + 6 && D > A && 29 >= A && B + 203 >= 2*D + 5*A + C && 2*B + 1561 >= 14*D + 35*A + 7*C && 140*D + 23*B > 140*A + 28*C + 160 && 23*B + 5719 >= 56*D + 140*A + 28*C && D + 5 >= B && 7*D + C >= B + 7*A;
    action := D' = 2 + D, B' = B - 10;
  };
  transition t9 := {
    from   := lbl151;
    to     := lbl151;
    guard  := D > B && B > 5 && 6*D > 5*A + C + 6 && 5*D + B > 5*A + C + 6 && D > A && 29 >= A && B + 203 >= 2*D + 5*A + C && 2*B + 1561 >= 14*D + 35*A + 7*C && 140*D + 23*B > 140*A + 28*C + 160 && 23*B + 5719 >= 56*D + 140*A + 28*C && D + 5 >= B && 7*D + C >= B + 7*A;
    action := D' = 1 + D, B' = 7 + B;
  };
  transition t10 := {
    from   := lbl151;
    to     := lbl151;
    guard  := D > B && 5 >= B && 6*D > 5*A + C + 6 && 5*D + B > 5*A + C + 6 && D > A && 29 >= A && B + 203 >= 2*D + 5*A + C && 2*B + 1561 >= 14*D + 35*A + 7*C && 140*D + 23*B > 140*A + 28*C + 160 && 23*B + 5719 >= 56*D + 140*A + 28*C && D + 5 >= B && 7*D + C >= B + 7*A;
    action := D' = 1 + D, B' = 2 + B;
  };
  transition t11 := {
    from   := start0;
    to     := start;
    guard  := true;
    action := D' = A, B' = C;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
