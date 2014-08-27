model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M;
  states f0, f5, f12, f20;
  transition t0 := {
    from   := f0;
    to     := f5;
    guard  := true;
    action := L' = ?, M' = ?;
  };
  transition t1 := {
    from   := f0;
    to     := f12;
    guard  := 15 >= L;
    action := A' = M, L' = ?, M' = ?;
  };
  transition t2 := {
    from   := f12;
    to     := f20;
    guard  := 0 > A;
    action := B' = M, C' = M, L' = ?, M' = ?;
  };
  transition t3 := {
    from   := f12;
    to     := f20;
    guard  := A > 0;
    action := B' = M, C' = M, L' = ?, M' = ?;
  };
  transition t4 := {
    from   := f0;
    to     := f5;
    guard  := 15 >= M;
    action := D' = 1, E' = 1, L' = ?, M' = ?;
  };
  transition t5 := {
    from   := f20;
    to     := f12;
    guard  := true;
    action := A' = A - 1, F' = 0, G' = 0, L' = ?, M' = ?;
  };
  transition t6 := {
    from   := f12;
    to     := f5;
    guard  := A = 0;
    action := D' = 0, A' = 0, H' = M, I' = M, J' = 0, K' = 0, E' = 0, L' = ?, M' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
