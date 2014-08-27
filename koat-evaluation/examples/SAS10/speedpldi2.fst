model main {
  var A, B, C, D, E, F, G, H;
  states start, stop, lM1, lZZ1, start0;
  transition t0 := {
    from   := start;
    to     := stop;
    guard  := 0 >= A && B = C && D = E && F = G && H = A;
    action := ;
  };
  transition t1 := {
    from   := start;
    to     := stop;
    guard  := 0 > G && B = C && D = E && F = G && H = A;
    action := ;
  };
  transition t2 := {
    from   := start;
    to     := stop;
    guard  := A > 0 && F = 0 && B = C && D = E && G = 0 && H = A;
    action := D' = F, B' = 0;
  };
  transition t3 := {
    from   := start;
    to     := lM1;
    guard  := A > 0 && G > 0 && B = C && D = E && F = G && H = A;
    action := D' = F - 1, B' = 1;
  };
  transition t4 := {
    from   := lM1;
    to     := stop;
    guard  := A >= B && G >= B && B > 0 && D = 0 && H = A && F = G;
    action := ;
  };
  transition t5 := {
    from   := lM1;
    to     := lZZ1;
    guard  := D > 0 && G >= D + A && A > 0 && D >= 0 && B = A && H = A && F = G;
    action := B' = 0;
  };
  transition t6 := {
    from   := lM1;
    to     := lM1;
    guard  := A > B && D > 0 && A >= B && G >= D + B && B > 0 && D >= 0 && H = A && F = G;
    action := D' = D - 1, B' = 1 + B;
  };
  transition t7 := {
    from   := lZZ1;
    to     := stop;
    guard  := 0 >= D && G >= A + D && A > 1 && D > 0 && B = 0 && H = A && F = G;
    action := ;
  };
  transition t8 := {
    from   := lZZ1;
    to     := lZZ1;
    guard  := D > 0 && 0 >= A && G >= A + D && A > 1 && B = 0 && H = A && F = G;
    action := B' = 0;
  };
  transition t9 := {
    from   := lZZ1;
    to     := lM1;
    guard  := A > 0 && D > 0 && G >= A + D && A > 1 && B = 0 && H = A && F = G;
    action := D' = D - 1, B' = 1 + B;
  };
  transition t10 := {
    from   := start0;
    to     := start;
    guard  := true;
    action := H' = A, F' = G, D' = E, B' = C;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
