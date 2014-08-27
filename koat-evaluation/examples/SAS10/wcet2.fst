model main {
  var A, B, C, D, E, F, G, H;
  states start, stop, lbl92, lbl82, start0;
  transition t0 := {
    from   := start;
    to     := stop;
    guard  := A > 4 && B = C && D = E && F = G && H = A;
    action := ;
  };
  transition t1 := {
    from   := start;
    to     := lbl92;
    guard  := 2 >= A && B = C && D = E && F = G && H = A;
    action := H' = 1 + H, F' = 0, D' = H;
  };
  transition t2 := {
    from   := start;
    to     := lbl82;
    guard  := A > 2 && 4 >= A && B = C && D = E && F = G && H = A;
    action := F' = 1, B' = 0;
  };
  transition t3 := {
    from   := lbl92;
    to     := stop;
    guard  := D > 3 && D >= A && F + 10 >= 5*D && F >= 0 && H = D + 1;
    action := ;
  };
  transition t4 := {
    from   := lbl92;
    to     := lbl92;
    guard  := 1 >= D && D >= A && F + 10 >= 5*D && F >= 0 && H = D + 1;
    action := H' = 1 + H, F' = 0, D' = H;
  };
  transition t5 := {
    from   := lbl92;
    to     := lbl82;
    guard  := D > 1 && 3 >= D && D >= A && F + 10 >= 5*D && F >= 0 && H = D + 1;
    action := F' = 1, B' = 0;
  };
  transition t6 := {
    from   := lbl82;
    to     := lbl92;
    guard  := 2 >= H && 9 >= B && B >= 0 && H >= A && H > 2 && 4 >= H && F = B + 1;
    action := H' = 1 + H, D' = H;
  };
  transition t7 := {
    from   := lbl82;
    to     := lbl92;
    guard  := H >= A && H > 2 && 4 >= H && F = 10 && B = 9;
    action := H' = 1 + H, D' = H;
  };
  transition t8 := {
    from   := lbl82;
    to     := lbl82;
    guard  := H > 2 && 8 >= B && 9 >= B && B >= 0 && H >= A && 4 >= H && F = B + 1;
    action := F' = 1 + F, B' = F;
  };
  transition t9 := {
    from   := start0;
    to     := start;
    guard  := true;
    action := H' = A, F' = G, D' = E, B' = C;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
