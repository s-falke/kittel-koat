model main {
  var A, B, C, D, E, F, G, H;
  states start, stop, lbl111, lbl161, lbl221, start0;
  transition t0 := {
    from   := start;
    to     := stop;
    guard  := A > 100 && B = C && D = E && F = G && H = A;
    action := F' = H, D' = 1, B' = H - 10;
  };
  transition t1 := {
    from   := start;
    to     := lbl111;
    guard  := 100 >= A && B = C && D = E && F = G && H = A;
    action := F' = 11 + H, D' = 2;
  };
  transition t2 := {
    from   := lbl161;
    to     := stop;
    guard  := 89 >= A && D = 1 && H = A && F = 101 && B = 91;
    action := ;
  };
  transition t3 := {
    from   := lbl161;
    to     := lbl161;
    guard  := 0 > 9 && 89 >= A && 0 > 0 && D = 2 && H = A && F = 101 && B = 91;
    action := F' = F - 10, D' = D - 1, B' = F - 20;
  };
  transition t4 := {
    from   := lbl161;
    to     := lbl221;
    guard  := 0 > 1 && 89 >= A && H = A && F = 101 && D = 1 && B = 91;
    action := F' = 1 + F;
  };
  transition t5 := {
    from   := lbl161;
    to     := lbl221;
    guard  := 0 > 0 && 89 >= A && H = A && F = 101 && D = 1 && B = 91;
    action := F' = 1 + F;
  };
  transition t6 := {
    from   := lbl161;
    to     := lbl221;
    guard  := 0 > 9 && 0 > 1 && 89 >= A && H = A && F = 101 && D = 1 && B = 91;
    action := F' = F - 9, D' = D - 1;
  };
  transition t7 := {
    from   := lbl221;
    to     := stop;
    guard  := 1 >= D && D > 1 && F > 101 && 111 >= F && F + 10 >= A + 11*D && 89 >= A && H = A && B = C;
    action := ;
  };
  transition t8 := {
    from   := lbl221;
    to     := lbl161;
    guard  := 99 >= A && 89 >= A && F = 111 && D = 2 && H = A && B = C;
    action := F' = F - 10, D' = D - 1, B' = F - 20;
  };
  transition t9 := {
    from   := lbl221;
    to     := lbl221;
    guard  := D > 2 && 110 >= F && D > 1 && F > 101 && 111 >= F && F + 10 >= A + 11*D && 89 >= A && H = A && B = C;
    action := F' = 1 + F;
  };
  transition t10 := {
    from   := lbl221;
    to     := lbl221;
    guard  := D > 1 && 110 >= F && F > 101 && 111 >= F && F + 10 >= A + 11*D && 89 >= A && H = A && B = C;
    action := F' = 1 + F;
  };
  transition t11 := {
    from   := lbl221;
    to     := lbl221;
    guard  := D > 2 && D > 1 && 121 >= A + 11*D && 89 >= A && F = 111 && H = A && B = C;
    action := F' = F - 9, D' = D - 1;
  };
  transition t12 := {
    from   := lbl111;
    to     := lbl111;
    guard  := 111 >= 11*D + A && 122 >= 11*D + A && 11*D > 21 && H = A && B = C && F + 11 = 11*D + A;
    action := F' = 11 + F, D' = 1 + D;
  };
  transition t13 := {
    from   := lbl111;
    to     := stop;
    guard  := 11*D + A > 111 && 1 >= D && 122 >= 11*D + A && 11*D > 21 && H = A && B = C && F + 11 = 11*D + A;
    action := ;
  };
  transition t14 := {
    from   := lbl111;
    to     := lbl161;
    guard  := F = 111 && D = 2 && H = 100 && B = C && A = 100;
    action := F' = F - 10, D' = D - 1, B' = F - 20;
  };
  transition t15 := {
    from   := lbl111;
    to     := lbl221;
    guard  := 11*D + A > 111 && D > 2 && 121 >= 11*D + A && 122 >= 11*D + A && 11*D > 21 && H = A && B = C && F + 11 = 11*D + A;
    action := F' = 1 + F;
  };
  transition t16 := {
    from   := lbl111;
    to     := lbl221;
    guard  := 11*D + A > 111 && D > 1 && 121 >= 11*D + A && 122 >= 11*D + A && 11*D > 21 && H = A && B = C && F + 11 = 11*D + A;
    action := F' = 1 + F;
  };
  transition t17 := {
    from   := lbl111;
    to     := lbl221;
    guard  := D > 2 && 11*D > 21 && F = 111 && H + 11*D = 122 && B = C && A + 11*D = 122;
    action := F' = F - 9, D' = D - 1;
  };
  transition t18 := {
    from   := start0;
    to     := start;
    guard  := true;
    action := H' = A, F' = G, D' = E, B' = C;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
