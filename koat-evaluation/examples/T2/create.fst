model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y;
  states f1, f4, f3;
  transition t0 := {
    from   := f1;
    to     := f1;
    guard  := A > B && B >= 0;
    action := C' = D, B' = 1 + B, E' = D, D' = O, F' = P, G' = B, O' = ?, P' = ?, Q' = ?, R' = ?, S' = ?, T' = ?, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?;
  };
  transition t1 := {
    from   := f1;
    to     := f4;
    guard  := B >= A && B >= 0 && Q >= O && O > 1;
    action := H' = O, A' = P, C' = R, B' = Q, I' = S, E' = T, D' = U, J' = V, K' = W, L' = C, O' = ?, P' = ?, Q' = ?, R' = ?, S' = ?, T' = ?, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?;
  };
  transition t2 := {
    from   := f3;
    to     := f4;
    guard  := 0 >= P && 0 >= X;
    action := M' = O, H' = P, A' = R, C' = Q, B' = S, I' = T, E' = U, D' = V, J' = W, K' = Y, L' = 0, O' = ?, P' = ?, Q' = ?, R' = ?, S' = ?, T' = ?, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?;
  };
  transition t3 := {
    from   := f3;
    to     := f1;
    guard  := P > 1;
    action := M' = O, H' = P, A' = P, C' = R, B' = 2, I' = R, E' = R, D' = Q, N' = S, O' = ?, P' = ?, Q' = ?, R' = ?, S' = ?, T' = ?, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?;
  };
  transition t4 := {
    from   := f3;
    to     := f4;
    guard  := true;
    action := M' = O, H' = 1, A' = P, C' = R, B' = Q, I' = S, E' = T, D' = U, J' = V, K' = W, L' = D, O' = ?, P' = ?, Q' = ?, R' = ?, S' = ?, T' = ?, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?;
  };
}
strategy dumb {
  Region init := { state = f3 };
}
