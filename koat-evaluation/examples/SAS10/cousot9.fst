model main {
  var A, B, C, D, E, F;
  states start, stop, lbl52, lbl72, start0;
  transition t0 := {
    from   := start;
    to     := stop;
    guard  := 0 >= A && B = C && D = E && F = A;
    action := D' = F;
  };
  transition t1 := {
    from   := start;
    to     := lbl52;
    guard  := A > 0 && C > 0 && B = C && D = E && F = A;
    action := D' = F, B' = B - 1;
  };
  transition t2 := {
    from   := start;
    to     := lbl72;
    guard  := A > 0 && 0 >= C && B = C && D = E && F = A;
    action := D' = F - 1, B' = F;
  };
  transition t3 := {
    from   := lbl52;
    to     := stop;
    guard  := 0 >= D && B >= 0 && D > 0 && A >= D && F = A;
    action := ;
  };
  transition t4 := {
    from   := lbl52;
    to     := lbl52;
    guard  := D > 0 && B > 0 && B >= 0 && A >= D && F = A;
    action := B' = B - 1;
  };
  transition t5 := {
    from   := lbl52;
    to     := lbl72;
    guard  := D > 0 && A >= D && B = 0 && F = A;
    action := D' = D - 1, B' = F;
  };
  transition t6 := {
    from   := lbl72;
    to     := stop;
    guard  := A > 0 && D = 0 && F = A && B = A;
    action := ;
  };
  transition t7 := {
    from   := lbl72;
    to     := lbl52;
    guard  := D > 0 && A > 0 && D >= 0 && A > D && F = A && B = A;
    action := B' = B - 1;
  };
  transition t8 := {
    from   := lbl72;
    to     := lbl72;
    guard  := D > 0 && 0 >= A && D >= 0 && A > D && F = A && B = A;
    action := D' = D - 1, B' = F;
  };
  transition t9 := {
    from   := start0;
    to     := start;
    guard  := true;
    action := F' = A, D' = E, B' = C;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
