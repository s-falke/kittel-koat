model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1;
  states f1, f4, f3;
  transition t0 := {
    from   := f1;
    to     := f1;
    guard  := A > B && B >= 0;
    action := C' = D, B' = 1 + B, E' = D, D' = Q, F' = R, G' = B, Q' = ?, R' = ?, S' = ?, T' = ?, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t1 := {
    from   := f1;
    to     := f4;
    guard  := B >= A && B >= 0 && S >= Q && Q > 1;
    action := H' = Q, A' = R, I' = T, C' = U, B' = S, J' = V, E' = W, D' = X, K' = Y, L' = Z, M' = C, Q' = ?, R' = ?, S' = ?, T' = ?, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t2 := {
    from   := f3;
    to     := f4;
    guard  := 0 >= R && 0 >= A1;
    action := N' = Q, H' = R, A' = T, I' = U, C' = S, B' = V, J' = W, E' = X, D' = Y, K' = Z, L' = B1, M' = O, Q' = ?, R' = ?, S' = ?, T' = ?, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t3 := {
    from   := f3;
    to     := f1;
    guard  := R > 1;
    action := N' = Q, H' = R, A' = R, I' = T, C' = U, B' = 2, O' = T, J' = U, E' = U, D' = S, P' = V, Q' = ?, R' = ?, S' = ?, T' = ?, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t4 := {
    from   := f3;
    to     := f4;
    guard  := true;
    action := N' = Q, H' = 1, A' = R, I' = T, C' = U, B' = S, O' = V, J' = W, E' = X, D' = Y, K' = Z, L' = B1, M' = D, Q' = ?, R' = ?, S' = ?, T' = ?, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
}
strategy dumb {
  Region init := { state = f3 };
}
