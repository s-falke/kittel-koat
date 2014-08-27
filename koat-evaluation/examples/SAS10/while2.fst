model main {
  var A, B, C, D, E, F;
  states start, stop, lbl62, lbl72, start0;
  transition t0 := {
    from   := start;
    to     := stop;
    guard  := 0 >= A && B = C && D = E && F = A;
    action := D' = F;
  };
  transition t1 := {
    from   := start;
    to     := lbl62;
    guard  := A > 0 && B = C && D = E && F = A;
    action := D' = F, B' = F - 1;
  };
  transition t2 := {
    from   := lbl72;
    to     := stop;
    guard  := A > 0 && D = 0 && B = 0 && F = A;
    action := ;
  };
  transition t3 := {
    from   := lbl72;
    to     := lbl72;
    guard  := D > 0 && 0 >= A && D >= 0 && A > D && B = 0 && F = A;
    action := D' = D - 1, B' = F;
  };
  transition t4 := {
    from   := lbl72;
    to     := lbl62;
    guard  := A > 0 && D > 0 && D >= 0 && A > D && B = 0 && F = A;
    action := B' = F - 1;
  };
  transition t5 := {
    from   := lbl62;
    to     := lbl72;
    guard  := A >= D && A > 0 && D > 0 && B = 0 && F = A;
    action := D' = D - 1;
  };
  transition t6 := {
    from   := lbl62;
    to     := lbl62;
    guard  := B > 0 && A >= D && A > B && B >= 0 && D > 0 && F = A;
    action := B' = B - 1;
  };
  transition t7 := {
    from   := start0;
    to     := start;
    guard  := true;
    action := F' = A, D' = E, B' = C;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
