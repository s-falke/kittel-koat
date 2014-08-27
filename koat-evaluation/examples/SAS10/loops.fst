model main {
  var A, B, C, D, E, F;
  states start, stop, lbl121, lbl101, start0;
  transition t0 := {
    from   := start;
    to     := stop;
    guard  := 0 > A && B = C && D = E && F = A;
    action := D' = F;
  };
  transition t1 := {
    from   := start;
    to     := lbl121;
    guard  := A >= 0 && 1 >= A && B = C && D = E && F = A;
    action := D' = F - 1, B' = 1;
  };
  transition t2 := {
    from   := start;
    to     := lbl101;
    guard  := A > 1 && B = C && D = E && F = A;
    action := D' = F, B' = 2;
  };
  transition t3 := {
    from   := lbl121;
    to     := stop;
    guard  := A >= 0 && B >= 0 && B > 0 && D + 1 = 0 && F = A;
    action := ;
  };
  transition t4 := {
    from   := lbl121;
    to     := lbl121;
    guard  := D >= 0 && 1 >= D && A > D && B > D && B > 0 && D + 1 >= 0 && F = A;
    action := D' = D - 1, B' = 1;
  };
  transition t5 := {
    from   := lbl121;
    to     := lbl101;
    guard  := D > 1 && A > D && B > D && B > 0 && D + 1 >= 0 && F = A;
    action := B' = 2;
  };
  transition t6 := {
    from   := lbl101;
    to     := lbl101;
    guard  := D > B && B > 1 && 2*D > B + 1 && A >= D && F = A;
    action := B' = 2*B;
  };
  transition t7 := {
    from   := lbl101;
    to     := lbl121;
    guard  := B >= D && B > 1 && 2*D > B + 1 && A >= D && F = A;
    action := D' = D - 1;
  };
  transition t8 := {
    from   := start0;
    to     := start;
    guard  := true;
    action := F' = A, D' = E, B' = C;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
