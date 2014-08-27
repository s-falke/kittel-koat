model main {
  var A, B, C, D, E, F, G, H, I, J, K, L;
  states f0, f5, f27;
  transition t0 := {
    from   := f0;
    to     := f5;
    guard  := true;
    action := A' = K, B' = 0, C' = 0, K' = ?, L' = ?;
  };
  transition t1 := {
    from   := f5;
    to     := f5;
    guard  := 15 >= C;
    action := B' = B + 1, C' = C + 1, D' = 1, K' = ?, L' = ?;
  };
  transition t2 := {
    from   := f5;
    to     := f5;
    guard  := 15 >= C;
    action := C' = C + 1, D' = 0, K' = ?, L' = ?;
  };
  transition t3 := {
    from   := f5;
    to     := f27;
    guard  := C > 15;
    action := E' = B, F' = B, G' = K, H' = L, I' = L, J' = L, K' = ?, L' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
