model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R;
  states f2, f1, f300;
  transition t0 := {
    from   := f2;
    to     := f2;
    guard  := A > 1;
    action := B' = L, C' = M, D' = N, E' = F, L' = ?, M' = ?, N' = ?, O' = ?, P' = ?, Q' = ?, R' = ?;
  };
  transition t1 := {
    from   := f2;
    to     := f1;
    guard  := 1 >= A;
    action := B' = L, C' = M, G' = N, L' = ?, M' = ?, N' = ?, O' = ?, P' = ?, Q' = ?, R' = ?;
  };
  transition t2 := {
    from   := f300;
    to     := f2;
    guard  := H > 0;
    action := B' = L, C' = M, D' = N, E' = O, F' = O, I' = P, J' = Q, K' = R, L' = ?, M' = ?, N' = ?, O' = ?, P' = ?, Q' = ?, R' = ?;
  };
  transition t3 := {
    from   := f300;
    to     := f1;
    guard  := 0 >= H;
    action := B' = L, C' = M, E' = N, G' = O, F' = P, I' = Q, J' = N, K' = R, L' = ?, M' = ?, N' = ?, O' = ?, P' = ?, Q' = ?, R' = ?;
  };
}
strategy dumb {
  Region init := { state = f300 };
}
