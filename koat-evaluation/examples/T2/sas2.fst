model main {
  var A, B, C, D, E, F, G;
  states f5, f7, f9, f16, f25, f0, f30;
  transition t0 := {
    from   := f5;
    to     := f7;
    guard  := 0 >= A;
    action := G' = ?;
  };
  transition t1 := {
    from   := f5;
    to     := f7;
    guard  := A > 1;
    action := G' = ?;
  };
  transition t2 := {
    from   := f7;
    to     := f9;
    guard  := B = 0;
    action := B' = 0, G' = ?;
  };
  transition t3 := {
    from   := f16;
    to     := f5;
    guard  := 255 >= C;
    action := D' = G, G' = ?;
  };
  transition t4 := {
    from   := f25;
    to     := f5;
    guard  := C >= 0;
    action := D' = G, G' = ?;
  };
  transition t5 := {
    from   := f0;
    to     := f5;
    guard  := true;
    action := A' = 4, B' = 0, E' = 0, D' = G, G' = ?;
  };
  transition t6 := {
    from   := f7;
    to     := f9;
    guard  := 0 > B;
    action := A' = A - 1, G' = ?;
  };
  transition t7 := {
    from   := f7;
    to     := f9;
    guard  := B > 0;
    action := A' = A - 1, G' = ?;
  };
  transition t8 := {
    from   := f9;
    to     := f16;
    guard  := 0 >= E && D > F;
    action := E' = 2, C' = C + A, G' = ?;
  };
  transition t9 := {
    from   := f9;
    to     := f16;
    guard  := E > 1 && D > F;
    action := E' = 2, C' = C + A, G' = ?;
  };
  transition t10 := {
    from   := f9;
    to     := f16;
    guard  := 0 > B && D > F && E = 1;
    action := E' = 2, C' = C + A, G' = ?;
  };
  transition t11 := {
    from   := f9;
    to     := f16;
    guard  := B > 0 && D > F && E = 1;
    action := E' = 2, C' = C + A, G' = ?;
  };
  transition t12 := {
    from   := f9;
    to     := f16;
    guard  := D > F && B = 0 && E = 1;
    action := A' = A - 1, B' = 1, E' = 2, C' = C + A - 1, G' = ?;
  };
  transition t13 := {
    from   := f9;
    to     := f25;
    guard  := 1 >= E && F > D;
    action := E' = 1, C' = C - A, G' = ?;
  };
  transition t14 := {
    from   := f9;
    to     := f25;
    guard  := E > 2 && F > D;
    action := E' = 1, C' = C - A, G' = ?;
  };
  transition t15 := {
    from   := f9;
    to     := f25;
    guard  := 0 > B && F > D && E = 2;
    action := E' = 1, C' = C - A, G' = ?;
  };
  transition t16 := {
    from   := f9;
    to     := f25;
    guard  := B > 0 && F > D && E = 2;
    action := E' = 1, C' = C - A, G' = ?;
  };
  transition t17 := {
    from   := f9;
    to     := f25;
    guard  := F > D && B = 0 && E = 2;
    action := A' = A - 1, B' = 1, E' = 1, C' = C - A + 1, G' = ?;
  };
  transition t18 := {
    from   := f5;
    to     := f30;
    guard  := A = 1;
    action := A' = 1, G' = ?;
  };
  transition t19 := {
    from   := f16;
    to     := f30;
    guard  := C > 255;
    action := G' = ?;
  };
  transition t20 := {
    from   := f25;
    to     := f30;
    guard  := 0 > C;
    action := G' = ?;
  };
  transition t21 := {
    from   := f9;
    to     := f30;
    guard  := D = F;
    action := F' = D, G' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
