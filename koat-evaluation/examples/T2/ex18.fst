model main {
  var A, B, C, D, E, F, G;
  states f15, f16, f0, f7, f23;
  transition t0 := {
    from   := f15;
    to     := f16;
    guard  := A > B;
    action := F' = ?, G' = ?;
  };
  transition t1 := {
    from   := f15;
    to     := f16;
    guard  := B > A;
    action := F' = ?, G' = ?;
  };
  transition t2 := {
    from   := f0;
    to     := f7;
    guard  := 0 >= F;
    action := C' = F, A' = F, F' = ?, G' = ?;
  };
  transition t3 := {
    from   := f0;
    to     := f7;
    guard  := F > 100;
    action := C' = F, A' = F, F' = ?, G' = ?;
  };
  transition t4 := {
    from   := f0;
    to     := f15;
    guard  := 100 >= F && F > 0;
    action := C' = F, A' = F, D' = G, B' = 0, F' = ?, G' = ?;
  };
  transition t5 := {
    from   := f16;
    to     := f15;
    guard  := true;
    action := B' = B + 1, F' = ?, G' = ?;
  };
  transition t6 := {
    from   := f23;
    to     := f23;
    guard  := B > E;
    action := E' = E + 1, F' = ?, G' = ?;
  };
  transition t7 := {
    from   := f23;
    to     := f7;
    guard  := E >= B;
    action := F' = ?, G' = ?;
  };
  transition t8 := {
    from   := f15;
    to     := f23;
    guard  := A = B;
    action := B' = A - 1, E' = 0, F' = ?, G' = ?;
  };
  transition t9 := {
    from   := f16;
    to     := f23;
    guard  := true;
    action := B' = B - 1, E' = 0, F' = ?, G' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
