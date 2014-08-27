model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S;
  states f2, f300, f1;
  transition t0 := {
    from   := f2;
    to     := f2;
    guard  := A > 0;
    action := B' = C, D' = L, E' = M, F' = N, L' = ?, M' = ?, N' = ?, O' = ?, P' = ?, Q' = ?, R' = ?, S' = ?;
  };
  transition t1 := {
    from   := f300;
    to     := f1;
    guard  := 0 >= G;
    action := H' = L, I' = M, C' = N, J' = O, B' = L, D' = P, E' = Q, K' = R, L' = ?, M' = ?, N' = ?, O' = ?, P' = ?, Q' = ?, R' = ?, S' = ?;
  };
  transition t2 := {
    from   := f300;
    to     := f2;
    guard  := A > 0 && G > 0;
    action := H' = L, I' = M, C' = N, J' = O, B' = N, D' = P, E' = Q, F' = R, L' = ?, M' = ?, N' = ?, O' = ?, P' = ?, Q' = ?, R' = ?, S' = ?;
  };
  transition t3 := {
    from   := f300;
    to     := f1;
    guard  := 0 >= A && G > 0;
    action := H' = L, I' = M, C' = N, J' = O, B' = N, D' = P, E' = Q, F' = R, K' = S, L' = ?, M' = ?, N' = ?, O' = ?, P' = ?, Q' = ?, R' = ?, S' = ?;
  };
}
strategy dumb {
  Region init := { state = f300 };
}
