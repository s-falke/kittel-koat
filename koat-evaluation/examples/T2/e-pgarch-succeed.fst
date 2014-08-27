model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S;
  states f21, f29, f41, f43, f46, f0;
  transition t0 := {
    from   := f21;
    to     := f29;
    guard  := 0 >= A;
    action := R' = ?, S' = ?;
  };
  transition t1 := {
    from   := f41;
    to     := f41;
    guard  := true;
    action := R' = ?, S' = ?;
  };
  transition t2 := {
    from   := f43;
    to     := f46;
    guard  := true;
    action := R' = ?, S' = ?;
  };
  transition t3 := {
    from   := f29;
    to     := f41;
    guard  := A > 0;
    action := B' = R, R' = ?, S' = ?;
  };
  transition t4 := {
    from   := f29;
    to     := f41;
    guard  := 0 >= A && 999 + C >= R;
    action := D' = 0, E' = R, F' = R, G' = R, B' = S, R' = ?, S' = ?;
  };
  transition t5 := {
    from   := f29;
    to     := f41;
    guard  := 0 >= A && R > C + 999;
    action := A' = 1, D' = 0, E' = R, F' = R, G' = R, B' = S, R' = ?, S' = ?;
  };
  transition t6 := {
    from   := f21;
    to     := f29;
    guard  := A > 0;
    action := A' = 0, H' = 0, I' = R, J' = R, C' = R, R' = ?, S' = ?;
  };
  transition t7 := {
    from   := f0;
    to     := f21;
    guard  := 0 >= K;
    action := A' = 1, L' = R, M' = K, R' = ?, S' = ?;
  };
  transition t8 := {
    from   := f0;
    to     := f21;
    guard  := S > 0 && K > 0;
    action := A' = 1, L' = R, M' = 0, N' = 1, K' = S, O' = S, P' = S, Q' = S, R' = ?, S' = ?;
  };
  transition t9 := {
    from   := f0;
    to     := f41;
    guard  := 0 >= S && K > 0;
    action := A' = 1, L' = R, M' = 0, N' = 1, K' = S, O' = S, P' = S, Q' = S, R' = ?, S' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
