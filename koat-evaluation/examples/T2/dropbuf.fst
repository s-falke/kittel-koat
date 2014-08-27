model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, A1, B1;
  states f25, f15, f31, f33, f36, f45, f46, f61, f63, f65, f0;
  transition t0 := {
    from   := f25;
    to     := f15;
    guard  := A > B;
    action := C' = C + 1, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t1 := {
    from   := f25;
    to     := f15;
    guard  := B >= A;
    action := C' = C + 1, D' = Y, E' = 0, F' = 1, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t2 := {
    from   := f31;
    to     := f31;
    guard  := true;
    action := Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t3 := {
    from   := f33;
    to     := f36;
    guard  := true;
    action := G' = 0, C' = 1, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t4 := {
    from   := f36;
    to     := f45;
    guard  := H >= C;
    action := I' = Y, J' = Z, K' = A1, L' = B1, M' = B1, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t5 := {
    from   := f45;
    to     := f46;
    guard  := 0 > M;
    action := N' = M, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t6 := {
    from   := f45;
    to     := f46;
    guard  := M > 0;
    action := N' = M, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t7 := {
    from   := f46;
    to     := f36;
    guard  := A > B;
    action := C' = C + 1, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t8 := {
    from   := f45;
    to     := f36;
    guard  := M = 0;
    action := C' = C + 1, M' = 0, N' = 0, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t9 := {
    from   := f61;
    to     := f61;
    guard  := true;
    action := Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t10 := {
    from   := f63;
    to     := f65;
    guard  := true;
    action := Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t11 := {
    from   := f46;
    to     := f36;
    guard  := B >= A;
    action := C' = C + 1, D' = Y, E' = 0, O' = Z, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t12 := {
    from   := f46;
    to     := f45;
    guard  := B >= A;
    action := J' = Y, K' = Z, L' = A1, M' = A1, P' = B1, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t13 := {
    from   := f36;
    to     := f61;
    guard  := C > H;
    action := Q' = 0, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t14 := {
    from   := f15;
    to     := f25;
    guard  := 0 > A1 && R > C;
    action := S' = Y, T' = Z, U' = A1, V' = A1, W' = A1, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t15 := {
    from   := f15;
    to     := f25;
    guard  := A1 > 0 && R > C;
    action := S' = Y, T' = Z, U' = A1, V' = A1, W' = A1, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t16 := {
    from   := f15;
    to     := f15;
    guard  := R > C;
    action := C' = C + 1, S' = Y, T' = Z, U' = 0, V' = 0, W' = 0, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t17 := {
    from   := f15;
    to     := f31;
    guard  := C >= R;
    action := Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t18 := {
    from   := f0;
    to     := f15;
    guard  := true;
    action := X' = 1, Q' = 0, G' = 0, R' = Y, H' = Z, C' = 0, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t19 := {
    from   := f0;
    to     := f36;
    guard  := 0 >= Y;
    action := X' = Y, Q' = 0, G' = 0, R' = Z, H' = A1, C' = 1, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
  transition t20 := {
    from   := f0;
    to     := f36;
    guard  := Y > 1;
    action := X' = Y, Q' = 0, G' = 0, R' = Z, H' = A1, C' = 1, Y' = ?, Z' = ?, A1' = ?, B1' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
