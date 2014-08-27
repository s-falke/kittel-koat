model main {
  var A, B, C, D, E, F, G, H, I, J, K, L;
  states start, stop, lbl131, lbl121, lbl111, start0;
  transition t0 := {
    from   := start;
    to     := stop;
    guard  := 0 > A && B = C && D = E && F = G && H = I && J = K && L = A;
    action := ;
  };
  transition t1 := {
    from   := start;
    to     := stop;
    guard  := 0 > E && B = C && D = E && F = G && H = I && J = K && L = A;
    action := ;
  };
  transition t2 := {
    from   := start;
    to     := stop;
    guard  := 0 > C && B = C && D = E && F = G && H = I && J = K && L = A;
    action := ;
  };
  transition t3 := {
    from   := start;
    to     := stop;
    guard  := A >= 0 && E >= 0 && B = 0 && C = 0 && D = E && F = G && H = I && J = K && L = A;
    action := J' = 0;
  };
  transition t4 := {
    from   := start;
    to     := lbl131;
    guard  := A >= 0 && C > 0 && D = 0 && B = C && E = 0 && F = G && H = I && J = K && L = A;
    action := J' = 1, H' = 0;
  };
  transition t5 := {
    from   := start;
    to     := lbl121;
    guard  := E > 0 && C > 0 && L = 0 && B = C && D = E && F = G && H = I && J = K && A = 0;
    action := J' = 0, H' = 1, F' = 0;
  };
  transition t6 := {
    from   := start;
    to     := lbl111;
    guard  := A > 0 && E > 0 && C > 0 && B = C && D = E && F = G && H = I && J = K && L = A;
    action := J' = 0, H' = 1, F' = 1;
  };
  transition t7 := {
    from   := lbl131;
    to     := stop;
    guard  := J >= C && E >= 0 && A >= 0 && C > 0 && A + C >= J && J > 0 && H = E && L = A && D = E && B = C;
    action := ;
  };
  transition t8 := {
    from   := lbl131;
    to     := lbl131;
    guard  := C > J && A >= 0 && C > 0 && A + C >= J && J > 0 && H = 0 && D = 0 && L = A && E = 0 && B = C;
    action := J' = 1 + J, H' = 0;
  };
  transition t9 := {
    from   := lbl131;
    to     := lbl121;
    guard  := E > 0 && C > J && J >= A && E >= 0 && A >= 0 && C > 0 && A + C >= J && J > 0 && H = E && L = A && D = E && B = C;
    action := H' = 1, F' = J;
  };
  transition t10 := {
    from   := lbl131;
    to     := lbl111;
    guard  := A > J && E > 0 && C > J && E >= 0 && A >= 0 && C > 0 && A + C >= J && J > 0 && H = E && L = A && D = E && B = C;
    action := H' = 1, F' = 1 + J;
  };
  transition t11 := {
    from   := lbl121;
    to     := lbl131;
    guard  := A + C > F && A >= 0 && F >= A && E > 0 && H = E && J = F && L = A && D = E && B = C;
    action := J' = 1 + J;
  };
  transition t12 := {
    from   := lbl121;
    to     := lbl121;
    guard  := E > H && F >= A && A + C > F && A >= 0 && E >= H && H > 0 && J = F && L = A && D = E && B = C;
    action := H' = 1 + H, F' = J;
  };
  transition t13 := {
    from   := lbl121;
    to     := lbl111;
    guard  := A > F && E > H && A + C > F && A >= 0 && E >= H && F >= A && H > 0 && J = F && L = A && D = E && B = C;
    action := H' = 1 + H, F' = 1 + J;
  };
  transition t14 := {
    from   := lbl111;
    to     := lbl121;
    guard  := A > J && E > 0 && J >= 0 && C > J && F = A && H = 1 && L = A && D = E && B = C;
    action := J' = F;
  };
  transition t15 := {
    from   := lbl111;
    to     := lbl111;
    guard  := A > F && F > J && E > 0 && J >= 0 && A >= F && C > J && H = 1 && L = A && D = E && B = C;
    action := F' = 1 + F;
  };
  transition t16 := {
    from   := start0;
    to     := start;
    guard  := true;
    action := L' = A, J' = K, H' = I, F' = G, D' = E, B' = C;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
