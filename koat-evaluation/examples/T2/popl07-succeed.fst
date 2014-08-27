model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y;
  states f49, f51, f54, f11, f35, f0;
  transition t0 := {
    from   := f49;
    to     := f49;
    guard  := true;
    action := U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?;
  };
  transition t1 := {
    from   := f51;
    to     := f54;
    guard  := true;
    action := U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?;
  };
  transition t2 := {
    from   := f11;
    to     := f49;
    guard  := A >= B;
    action := C' = 0, D' = 0, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?;
  };
  transition t3 := {
    from   := f35;
    to     := f49;
    guard  := E > 2;
    action := C' = 0, D' = 0, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?;
  };
  transition t4 := {
    from   := f35;
    to     := f49;
    guard  := 1 >= E;
    action := C' = 0, D' = 0, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?;
  };
  transition t5 := {
    from   := f35;
    to     := f49;
    guard  := E = 2;
    action := C' = 0, E' = 2, F' = G, D' = 0, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?;
  };
  transition t6 := {
    from   := f11;
    to     := f49;
    guard  := U > 0 && B > A;
    action := C' = 0, H' = V, I' = W, J' = X, K' = D, L' = U, M' = U, G' = U, D' = 0, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?;
  };
  transition t7 := {
    from   := f11;
    to     := f35;
    guard  := B > A && 0 >= U && Y > 1;
    action := H' = V, I' = W, J' = X, K' = D, L' = U, M' = U, G' = U, N' = U, O' = P, Q' = Y, R' = Y, E' = Y, S' = 0, P' = 0, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?;
  };
  transition t8 := {
    from   := f11;
    to     := f35;
    guard  := B > A && 0 >= U && 0 >= Y;
    action := H' = V, I' = W, J' = X, K' = D, L' = U, M' = U, G' = U, N' = U, O' = P, Q' = Y, R' = Y, E' = Y, S' = 0, P' = 0, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?;
  };
  transition t9 := {
    from   := f11;
    to     := f11;
    guard  := 0 >= U && B > A;
    action := A' = A + 1, H' = V, I' = W, J' = X, K' = D, L' = U, M' = U, G' = U, N' = U, O' = P, Q' = 1, R' = 1, E' = 1, S' = 0, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?;
  };
  transition t10 := {
    from   := f0;
    to     := f11;
    guard  := true;
    action := C' = 0, T' = 0, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
