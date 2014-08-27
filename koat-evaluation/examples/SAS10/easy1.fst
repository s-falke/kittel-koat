model main {
  var A, B, C, D, E, F;
  states start, lbl91, lbl111, stop, start0;
  transition t0 := {
    from   := start;
    to     := lbl91;
    guard  := A = 0 && B = 0 && C = D && E = F;
    action := E' = 1, C' = 100;
  };
  transition t1 := {
    from   := start;
    to     := lbl111;
    guard  := 0 > B && A = B && C = D && E = F;
    action := E' = 2, C' = 100;
  };
  transition t2 := {
    from   := start;
    to     := lbl111;
    guard  := B > 0 && A = B && C = D && E = F;
    action := E' = 2, C' = 100;
  };
  transition t3 := {
    from   := lbl91;
    to     := stop;
    guard  := E = 40 && C = 100 && A = 0 && B = 0;
    action := ;
  };
  transition t4 := {
    from   := lbl91;
    to     := lbl91;
    guard  := 39 >= E && E > 0 && 40 >= E && A = 0 && C = 100 && B = 0;
    action := E' = 1 + E;
  };
  transition t5 := {
    from   := lbl91;
    to     := lbl111;
    guard  := 0 > 0 && 39 >= E && E > 0 && 40 >= E && C = 100 && A = 0 && B = 0;
    action := E' = 2 + E;
  };
  transition t6 := {
    from   := lbl91;
    to     := lbl111;
    guard  := 0 > 0 && 39 >= E && E > 0 && 40 >= E && C = 100 && A = 0 && B = 0;
    action := E' = 2 + E;
  };
  transition t7 := {
    from   := lbl111;
    to     := stop;
    guard  := E > 39 && E > 1 && 41 >= E && C = 100 && A = B;
    action := ;
  };
  transition t8 := {
    from   := lbl111;
    to     := lbl91;
    guard  := 39 >= E && E > 1 && 41 >= E && A = 0 && C = 100 && B = 0;
    action := E' = 1 + E;
  };
  transition t9 := {
    from   := lbl111;
    to     := lbl111;
    guard  := 0 > B && 39 >= E && E > 1 && 41 >= E && C = 100 && A = B;
    action := E' = 2 + E;
  };
  transition t10 := {
    from   := lbl111;
    to     := lbl111;
    guard  := B > 0 && 39 >= E && E > 1 && 41 >= E && C = 100 && A = B;
    action := E' = 2 + E;
  };
  transition t11 := {
    from   := start0;
    to     := start;
    guard  := true;
    action := E' = F, C' = D, A' = B;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
