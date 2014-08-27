model main {
  var A, B, C, D, E, F, G;
  states f0, f1, f2, f3;
  transition t0 := {
    from   := f0;
    to     := f1;
    guard  := A >= 0 && 3 >= A && B >= 0 && 3 >= B && 3 >= C && D >= 0 && 3 >= E && E >= 0;
    action := ;
  };
  transition t1 := {
    from   := f1;
    to     := f2;
    guard  := 1 + B >= 2*D;
    action := F' = D + 1;
  };
  transition t2 := {
    from   := f1;
    to     := f2;
    guard  := 2*D > 3 + B;
    action := F' = D - 1;
  };
  transition t3 := {
    from   := f1;
    to     := f2;
    guard  := B + 2 = 2*D;
    action := F' = D;
  };
  transition t4 := {
    from   := f1;
    to     := f2;
    guard  := B + 3 = 2*D;
    action := F' = D;
  };
  transition t5 := {
    from   := f2;
    to     := f3;
    guard  := D + A > 2*E;
    action := G' = E + 1;
  };
  transition t6 := {
    from   := f2;
    to     := f3;
    guard  := 2*E > 1 + D + A;
    action := G' = E - 1;
  };
  transition t7 := {
    from   := f2;
    to     := f3;
    guard  := D + A = 2*E;
    action := G' = E;
  };
  transition t8 := {
    from   := f2;
    to     := f3;
    guard  := D + A + 1 = 2*E;
    action := G' = E;
  };
  transition t9 := {
    from   := f3;
    to     := f1;
    guard  := D > F;
    action := D' = F, E' = G;
  };
  transition t10 := {
    from   := f3;
    to     := f1;
    guard  := F > D;
    action := D' = F, E' = G;
  };
  transition t11 := {
    from   := f3;
    to     := f1;
    guard  := E > G;
    action := D' = F, E' = G;
  };
  transition t12 := {
    from   := f3;
    to     := f1;
    guard  := G > E;
    action := D' = F, E' = G;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
