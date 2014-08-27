model main {
  var A, B, C, D, E, F;
  states start, stop, lbl101, start0;
  transition t0 := {
    from   := start;
    to     := stop;
    guard  := 0 >= A && B = C && D = A && E = F;
    action := ;
  };
  transition t1 := {
    from   := start;
    to     := lbl101;
    guard  := A > 0 && B = C && D = A && E = F;
    action := E' = 1, B' = 2;
  };
  transition t2 := {
    from   := start;
    to     := lbl101;
    guard  := A > 0 && B = C && D = A && E = F;
    action := E' = -1, B' = 2;
  };
  transition t3 := {
    from   := lbl101;
    to     := stop;
    guard  := E + A >= 0 && A > 0 && A >= E && B = A + 1 && D = A;
    action := ;
  };
  transition t4 := {
    from   := lbl101;
    to     := lbl101;
    guard  := A >= B && E + B > 0 && A + 1 >= B && B > 1 && B > E && D = A;
    action := E' = 1 + E, B' = 1 + B;
  };
  transition t5 := {
    from   := lbl101;
    to     := lbl101;
    guard  := A >= B && E + B > 0 && A + 1 >= B && B > 1 && B > E && D = A;
    action := E' = E - 1, B' = 1 + B;
  };
  transition t6 := {
    from   := start0;
    to     := start;
    guard  := true;
    action := E' = F, D' = A, B' = C;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
