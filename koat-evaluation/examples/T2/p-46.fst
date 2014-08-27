model main {
  var A, B, C, D, E, F, G, H;
  states f0, f2, f1;
  transition t0 := {
    from   := f0;
    to     := f2;
    guard  := 0 >= A;
    action := B' = F, F' = ?, G' = ?, H' = ?;
  };
  transition t1 := {
    from   := f0;
    to     := f0;
    guard  := A > 0 && A > 2*G && 3*A >= 3*F && 3*F >= 3*A && F > 2*G && F > 0;
    action := A' = 1 + 3*A, C' = F, D' = H, E' = G, F' = ?, G' = ?, H' = ?;
  };
  transition t2 := {
    from   := f0;
    to     := f0;
    guard  := A > 0 && A > 2*G && 3*A >= 3*F && 3*F >= 3*A && 2*G > F && F > 0;
    action := A' = 1 + 3*A, C' = F, D' = H, E' = G, F' = ?, G' = ?, H' = ?;
  };
  transition t3 := {
    from   := f0;
    to     := f0;
    guard  := A > 0 && 2*G > A && 3*A >= 3*F && 3*F >= 3*A && F > 2*G && F > 0;
    action := A' = 1 + 3*A, C' = F, D' = H, E' = G, F' = ?, G' = ?, H' = ?;
  };
  transition t4 := {
    from   := f0;
    to     := f0;
    guard  := A > 0 && 2*G > A && 3*A >= 3*F && 3*F >= 3*A && 2*G > F && F > 0;
    action := A' = 1 + 3*A, C' = F, D' = H, E' = G, F' = ?, G' = ?, H' = ?;
  };
  transition t5 := {
    from   := f0;
    to     := f0;
    guard  := 2*F > 0 && G > 0 && A = 2*F;
    action := A' = F, D' = H, E' = F, F' = ?, G' = ?, H' = ?;
  };
  transition t6 := {
    from   := f1;
    to     := f0;
    guard  := true;
    action := F' = ?, G' = ?, H' = ?;
  };
}
strategy dumb {
  Region init := { state = f1 };
}
