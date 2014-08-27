model main {
  var A, B, C, D, E, F, G, H;
  states start, stop, lbl72, start0;
  transition t0 := {
    from   := start;
    to     := stop;
    guard  := A > 100 && B = C && D = E && F = A && G = H;
    action := ;
  };
  transition t1 := {
    from   := start;
    to     := stop;
    guard  := E > C && B = C && D = E && F = A && G = H;
    action := ;
  };
  transition t2 := {
    from   := start;
    to     := lbl72;
    guard  := C >= E && 100 >= A && B = C && D = E && F = A && G = H;
    action := G' = F, F' = D, D' = 1 + F, B' = B - 1;
  };
  transition t3 := {
    from   := lbl72;
    to     := stop;
    guard  := F > 100 && 100 >= A && 101 + F + B >= A + E + C && B + 1 >= F && C > B && C >= E && G + 1 + F + B = A + E + C && D + F + B = A + E + C;
    action := ;
  };
  transition t4 := {
    from   := lbl72;
    to     := stop;
    guard  := A + E + C > F + 2*B && 100 >= A && 101 + F + B >= A + E + C && B + 1 >= F && C > B && C >= E && G + 1 + F + B = A + E + C && D + F + B = A + E + C;
    action := ;
  };
  transition t5 := {
    from   := lbl72;
    to     := lbl72;
    guard  := 2*B + F >= A + E + C && 100 >= F && 100 >= A && 101 + F + B >= A + E + C && B + 1 >= F && C > B && C >= E && G + 1 + F + B = A + E + C && D + F + B = A + E + C;
    action := G' = F, F' = D, D' = 1 + F, B' = B - 1;
  };
  transition t6 := {
    from   := start0;
    to     := start;
    guard  := true;
    action := G' = H, F' = A, D' = E, B' = C;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
