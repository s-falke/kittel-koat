model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q;
  states f21, f29, f41, f43, f46, f0;
  transition t0 := {
    from   := f21;
    to     := f29;
    guard  := 0 >= A;
    action := P' = ?, Q' = ?;
  };
  transition t1 := {
    from   := f41;
    to     := f41;
    guard  := true;
    action := P' = ?, Q' = ?;
  };
  transition t2 := {
    from   := f43;
    to     := f46;
    guard  := true;
    action := P' = ?, Q' = ?;
  };
  transition t3 := {
    from   := f29;
    to     := f41;
    guard  := A > 0;
    action := P' = ?, Q' = ?;
  };
  transition t4 := {
    from   := f29;
    to     := f41;
    guard  := 0 >= A && 999 + B >= P;
    action := C' = P, D' = 0, E' = P, F' = P, P' = ?, Q' = ?;
  };
  transition t5 := {
    from   := f29;
    to     := f41;
    guard  := 0 >= A && P > B + 999;
    action := A' = 1, C' = P, D' = 0, E' = P, F' = P, P' = ?, Q' = ?;
  };
  transition t6 := {
    from   := f21;
    to     := f29;
    guard  := A > 0;
    action := A' = 0, G' = 0, C' = P, H' = P, B' = P, P' = ?, Q' = ?;
  };
  transition t7 := {
    from   := f0;
    to     := f21;
    guard  := 0 >= P;
    action := I' = P, A' = 1, J' = P, P' = ?, Q' = ?;
  };
  transition t8 := {
    from   := f0;
    to     := f21;
    guard  := P > 0 && Q > 0;
    action := I' = P, A' = 1, J' = 0, K' = 1, L' = Q, M' = Q, N' = Q, O' = Q, P' = ?, Q' = ?;
  };
  transition t9 := {
    from   := f0;
    to     := f41;
    guard  := P > 0 && 0 >= Q;
    action := I' = P, A' = 1, J' = 0, K' = 1, L' = Q, M' = Q, N' = Q, O' = Q, P' = ?, Q' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
