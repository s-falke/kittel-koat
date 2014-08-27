model main {
  var A, B, C, D, E, F, G, H;
  states start, m1;
  transition t0 := {
    from   := start;
    to     := m1;
    guard  := A >= 0 && B + A + 2 >= 2*C && B > A && 2*C >= B + A && D >= 0 && E + 1 = C && F = A;
    action := G' = ?, H' = ?;
  };
  transition t1 := {
    from   := m1;
    to     := m1;
    guard  := B > 0 && D >= 0 && A > E && B + 1 >= G && C + 1 >= H && H > C && F + 1 >= G && G > F;
    action := F' = G, C' = H, G' = ?, H' = ?;
  };
  transition t2 := {
    from   := m1;
    to     := m1;
    guard  := B > 0 && D >= 0 && B >= F && E + 1 >= H && C > B && F + 1 >= G && G > F && A + 1 >= H && H > A;
    action := F' = G, A' = H, G' = ?, H' = ?;
  };
  transition t3 := {
    from   := m1;
    to     := m1;
    guard  := B > 0 && D >= 0 && B >= F && B + 1 >= H && E >= A && F + 1 >= G && G > F && C + 1 >= H && H > C;
    action := F' = G, C' = H, G' = ?, H' = ?;
  };
  transition t4 := {
    from   := m1;
    to     := m1;
    guard  := B > 0 && D >= 0 && B >= F && B >= C && E + 1 >= H && A + 1 >= H && H > A && F + 1 >= G && G > F;
    action := F' = G, A' = H, G' = ?, H' = ?;
  };
}
strategy dumb {
  Region init := { state = start };
}
