model main {
  var A, B, C, D, E, F;
  states start, stop, lbl91, lbl101, start0;
  transition t0 := {
    from   := start;
    to     := stop;
    guard  := 0 > A && B = C && D = E && F = A;
    action := ;
  };
  transition t1 := {
    from   := start;
    to     := stop;
    guard  := A >= 0 && C > E && B = C && D = E && F = A;
    action := ;
  };
  transition t2 := {
    from   := start;
    to     := lbl91;
    guard  := A >= 0 && E >= C && B = C && D = E && F = A;
    action := D' = D - 1 - F;
  };
  transition t3 := {
    from   := start;
    to     := lbl101;
    guard  := A >= 0 && E >= C && B = C && D = E && F = A;
    action := B' = 1 + F + B;
  };
  transition t4 := {
    from   := lbl91;
    to     := stop;
    guard  := B > D && B >= C && A >= 0 && A + D + 1 >= B && E > A + D && F = A;
    action := ;
  };
  transition t5 := {
    from   := lbl91;
    to     := stop;
    guard  := D >= B && 0 > A && B >= C && A >= 0 && A + D + 1 >= B && E > A + D && F = A;
    action := ;
  };
  transition t6 := {
    from   := lbl91;
    to     := lbl91;
    guard  := A >= 0 && D >= B && B >= C && A + D + 1 >= B && E > A + D && F = A;
    action := D' = D - 1 - F;
  };
  transition t7 := {
    from   := lbl91;
    to     := lbl101;
    guard  := A >= 0 && D >= B && B >= C && A + D + 1 >= B && E > A + D && F = A;
    action := B' = 1 + F + B;
  };
  transition t8 := {
    from   := lbl101;
    to     := stop;
    guard  := B > D && E >= D && A >= 0 && B > A + C && A + D + 1 >= B && F = A;
    action := ;
  };
  transition t9 := {
    from   := lbl101;
    to     := stop;
    guard  := D >= B && 0 > A && E >= D && A >= 0 && B > A + C && A + D + 1 >= B && F = A;
    action := ;
  };
  transition t10 := {
    from   := lbl101;
    to     := lbl91;
    guard  := A >= 0 && D >= B && E >= D && B > A + C && A + D + 1 >= B && F = A;
    action := D' = D - 1 - F;
  };
  transition t11 := {
    from   := lbl101;
    to     := lbl101;
    guard  := A >= 0 && D >= B && E >= D && B > A + C && A + D + 1 >= B && F = A;
    action := B' = 1 + F + B;
  };
  transition t12 := {
    from   := start0;
    to     := start;
    guard  := true;
    action := F' = A, D' = E, B' = C;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
