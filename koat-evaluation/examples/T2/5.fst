model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U;
  states f0, f1, f2, f4;
  transition t0 := {
    from   := f0;
    to     := f1;
    guard  := true;
    action := N' = ?, O' = ?, P' = ?, Q' = ?, R' = ?, S' = ?, T' = ?, U' = ?;
  };
  transition t1 := {
    from   := f1;
    to     := f2;
    guard  := 7 >= N && N > 0;
    action := A' = 0, B' = O, C' = P, D' = 3, E' = N, F' = 0, G' = O, H' = P, I' = 3, J' = N, K' = 2, N' = ?, O' = ?, P' = ?, Q' = ?, R' = ?, S' = ?, T' = ?, U' = ?;
  };
  transition t2 := {
    from   := f4;
    to     := f2;
    guard  := L > 0 && L > P && M > 0 && M > O && 7 >= Q && 7 >= N && Q > 0 && N > 0;
    action := A' = 0, B' = O, C' = P, D' = N, E' = Q, F' = 0, G' = O, H' = P, I' = N, J' = Q, K' = 2, N' = ?, O' = ?, P' = ?, Q' = ?, R' = ?, S' = ?, T' = ?, U' = ?;
  };
  transition t3 := {
    from   := f1;
    to     := f1;
    guard  := R > 0 && 7 >= R && S > 0 && 7 >= S && Q > 0 && 7 >= Q && 1 >= O && O >= 0;
    action := A' = O, B' = P, C' = N, D' = 2, E' = Q, F' = O, G' = P, H' = N, I' = 2, J' = Q, K' = 1, N' = ?, O' = ?, P' = ?, Q' = ?, R' = ?, S' = ?, T' = ?, U' = ?;
  };
  transition t4 := {
    from   := f2;
    to     := f1;
    guard  := R > 0 && 7 >= R && S > 0 && 7 >= S && Q > 0 && 7 >= Q && 1 >= O && O >= 0;
    action := A' = O, B' = P, C' = N, D' = 2, E' = Q, F' = O, G' = P, H' = N, I' = 2, J' = Q, K' = 1, N' = ?, O' = ?, P' = ?, Q' = ?, R' = ?, S' = ?, T' = ?, U' = ?;
  };
  transition t5 := {
    from   := f4;
    to     := f1;
    guard  := R >= L && S >= M && T > 0 && 7 >= T && U > 0 && 7 >= U && Q > 0 && 7 >= Q && 1 >= O && O >= 0;
    action := A' = O, B' = P, C' = N, D' = 2, E' = Q, F' = O, G' = P, H' = N, I' = 2, J' = Q, K' = 1, N' = ?, O' = ?, P' = ?, Q' = ?, R' = ?, S' = ?, T' = ?, U' = ?;
  };
  transition t6 := {
    from   := f4;
    to     := f1;
    guard  := R > 0 && 7 >= R && S > 0 && 7 >= S && Q > 0 && 7 >= Q && 1 >= O && O >= 0;
    action := A' = O, B' = P, C' = N, D' = 2, E' = Q, F' = O, G' = P, H' = N, I' = 2, J' = Q, K' = 1, N' = ?, O' = ?, P' = ?, Q' = ?, R' = ?, S' = ?, T' = ?, U' = ?;
  };
  transition t7 := {
    from   := f2;
    to     := f4;
    guard  := R > 0 && 7 >= R && S > 0 && 7 >= S && T > 0 && 7 >= T && U > 0 && 7 >= U && Q > 0 && 7 >= Q && 1 >= O && O >= 0;
    action := A' = O, B' = P, C' = N, D' = Q, E' = 2, F' = O, G' = P, H' = N, I' = Q, J' = 2, K' = 4, N' = ?, O' = ?, P' = ?, Q' = ?, R' = ?, S' = ?, T' = ?, U' = ?;
  };
  transition t8 := {
    from   := f2;
    to     := f4;
    guard  := R > 0 && 7 >= R && S > 0 && 7 >= S && T > 0 && 7 >= T && U > 0 && 7 >= U && Q > 0 && 7 >= Q && 1 >= O && O >= 0;
    action := A' = O, B' = P, C' = N, D' = Q, E' = 7, F' = O, G' = P, H' = N, I' = Q, J' = 7, K' = 4, N' = ?, O' = ?, P' = ?, Q' = ?, R' = ?, S' = ?, T' = ?, U' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
