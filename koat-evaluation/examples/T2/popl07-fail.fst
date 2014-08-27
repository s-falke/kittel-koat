model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y;
  states f47, f49, f52, f11, f35, f0;
  transition t0 := {
    from   := f47;
    to     := f47;
    guard  := true;
    action := U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?;
  };
  transition t1 := {
    from   := f49;
    to     := f52;
    guard  := true;
    action := U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?;
  };
  transition t2 := {
    from   := f11;
    to     := f47;
    guard  := A >= B;
    action := C' = 0, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?;
  };
  transition t3 := {
    from   := f35;
    to     := f47;
    guard  := D > 2;
    action := C' = 0, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?;
  };
  transition t4 := {
    from   := f35;
    to     := f47;
    guard  := 1 >= D;
    action := C' = 0, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?;
  };
  transition t5 := {
    from   := f35;
    to     := f47;
    guard  := D = 2;
    action := D' = 2, E' = F, C' = 0, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?;
  };
  transition t6 := {
    from   := f11;
    to     := f47;
    guard  := U > 0 && B > A;
    action := G' = V, H' = W, I' = X, J' = C, K' = U, L' = U, F' = U, C' = 0, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?;
  };
  transition t7 := {
    from   := f11;
    to     := f35;
    guard  := B > A && 0 >= U && Y > 1;
    action := G' = V, H' = W, I' = X, J' = C, K' = U, L' = U, F' = U, M' = U, N' = O, P' = Y, Q' = Y, D' = Y, R' = 0, O' = 0, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?;
  };
  transition t8 := {
    from   := f11;
    to     := f35;
    guard  := B > A && 0 >= U && 0 >= Y;
    action := G' = V, H' = W, I' = X, J' = C, K' = U, L' = U, F' = U, M' = U, N' = O, P' = Y, Q' = Y, D' = Y, R' = 0, O' = 0, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?;
  };
  transition t9 := {
    from   := f11;
    to     := f11;
    guard  := 0 >= U && B > A;
    action := A' = A + 1, G' = V, H' = W, I' = X, J' = C, K' = U, L' = U, F' = U, M' = U, N' = O, P' = 1, Q' = 1, D' = 1, R' = 0, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?;
  };
  transition t10 := {
    from   := f0;
    to     := f11;
    guard  := true;
    action := S' = 0, T' = 0, U' = ?, V' = ?, W' = ?, X' = ?, Y' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
