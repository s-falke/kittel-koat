model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N;
  states f18, f24, f32, f34, f37, f0;
  transition t0 := {
    from   := f18;
    to     := f24;
    guard  := 0 >= A;
    action := L' = ?, M' = ?, N' = ?;
  };
  transition t1 := {
    from   := f32;
    to     := f32;
    guard  := true;
    action := L' = ?, M' = ?, N' = ?;
  };
  transition t2 := {
    from   := f34;
    to     := f37;
    guard  := true;
    action := L' = ?, M' = ?, N' = ?;
  };
  transition t3 := {
    from   := f24;
    to     := f32;
    guard  := A > 0;
    action := B' = L, L' = ?, M' = ?, N' = ?;
  };
  transition t4 := {
    from   := f24;
    to     := f32;
    guard  := 0 >= A && 999 + C >= L;
    action := D' = L, E' = L, B' = M, L' = ?, M' = ?, N' = ?;
  };
  transition t5 := {
    from   := f24;
    to     := f32;
    guard  := 0 >= A && L > C + 999;
    action := A' = 1, D' = L, E' = L, B' = M, L' = ?, M' = ?, N' = ?;
  };
  transition t6 := {
    from   := f18;
    to     := f24;
    guard  := A > 0;
    action := A' = 0, F' = L, C' = L, L' = ?, M' = ?, N' = ?;
  };
  transition t7 := {
    from   := f0;
    to     := f18;
    guard  := 0 >= M;
    action := A' = 1, G' = L, H' = M, L' = ?, M' = ?, N' = ?;
  };
  transition t8 := {
    from   := f0;
    to     := f18;
    guard  := M > 0 && N > 0;
    action := A' = 1, G' = L, H' = 0, I' = 1, J' = M, K' = M, L' = ?, M' = ?, N' = ?;
  };
  transition t9 := {
    from   := f0;
    to     := f32;
    guard  := 0 >= M && N > 0;
    action := A' = 1, G' = L, H' = 0, I' = 1, J' = M, K' = M, L' = ?, M' = ?, N' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
