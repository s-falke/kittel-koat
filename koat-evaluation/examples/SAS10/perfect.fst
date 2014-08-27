model main {
  var A, B, C, D, E, F, G, H;
  states start, stop, lbl111, lbl16, lbl82, start0;
  transition t0 := {
    from   := start;
    to     := stop;
    guard  := 1 >= A && B = C && D = E && F = G && H = A;
    action := ;
  };
  transition t1 := {
    from   := start;
    to     := lbl111;
    guard  := A > 1 && B = C && D = E && F = G && H = A;
    action := F' = H - 1, D' = 1, B' = H;
  };
  transition t2 := {
    from   := lbl16;
    to     := stop;
    guard  := A > 1 && A > B && F = 0 && H = A && D = A;
    action := ;
  };
  transition t3 := {
    from   := lbl111;
    to     := lbl111;
    guard  := D >= F && A > F && A >= F + D && A >= B && F > 0 && D >= 0 && H = A;
    action := D' = D - F;
  };
  transition t4 := {
    from   := lbl111;
    to     := lbl82;
    guard  := F > D && 0 > D && A > F && A >= F + D && A >= B && F > 0 && D >= 0 && H = A;
    action := F' = F - 1, D' = H;
  };
  transition t5 := {
    from   := lbl111;
    to     := lbl82;
    guard  := F > D && D > 0 && A > F && A >= F + D && A >= B && F > 0 && D >= 0 && H = A;
    action := F' = F - 1, D' = H;
  };
  transition t6 := {
    from   := lbl111;
    to     := lbl82;
    guard  := F > 0 && A > F && A >= F && A >= B && D = 0 && H = A;
    action := F' = F - 1, D' = H, B' = B - F;
  };
  transition t7 := {
    from   := lbl82;
    to     := lbl16;
    guard  := A > 1 && A >= B && A > B && F = 0 && H = A && D = A;
    action := ;
  };
  transition t8 := {
    from   := lbl82;
    to     := lbl111;
    guard  := F > 0 && A >= F && F >= 0 && A > F + 1 && A >= B && A + F > B && H = A && D = A;
    action := D' = D - F;
  };
  transition t9 := {
    from   := lbl82;
    to     := lbl82;
    guard  := F > A && A > 0 && F >= 0 && A > F + 1 && A >= B && A + F > B && H = A && D = A;
    action := F' = F - 1, D' = H;
  };
  transition t10 := {
    from   := lbl82;
    to     := lbl82;
    guard  := F > 0 && 0 > A && F >= 0 && A > F + 1 && A >= B && A + F > B && H = A && D = A;
    action := F' = F - 1, D' = H;
  };
  transition t11 := {
    from   := lbl82;
    to     := lbl82;
    guard  := F > 0 && F >= 0 && 0 > F + 1 && 0 >= B && F > B && D = 0 && H = 0 && A = 0;
    action := F' = F - 1, D' = H, B' = B - F;
  };
  transition t12 := {
    from   := start0;
    to     := start;
    guard  := true;
    action := H' = A, F' = G, D' = E, B' = C;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
