model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T;
  states f0, f12, f24, f36, f46;
  transition t0 := {
    from   := f0;
    to     := f12;
    guard  := true;
    action := A' = 3, B' = T, C' = 3, D' = 1, E' = 0, T' = ?;
  };
  transition t1 := {
    from   := f12;
    to     := f12;
    guard  := C > E;
    action := D' = T, E' = E + 1, T' = ?;
  };
  transition t2 := {
    from   := f24;
    to     := f24;
    guard  := F > G;
    action := H' = T, G' = G + 1, T' = ?;
  };
  transition t3 := {
    from   := f36;
    to     := f36;
    guard  := I > J;
    action := K' = T, J' = J + 1, T' = ?;
  };
  transition t4 := {
    from   := f36;
    to     := f46;
    guard  := J >= I;
    action := L' = K, M' = K, T' = ?;
  };
  transition t5 := {
    from   := f24;
    to     := f36;
    guard  := G >= F;
    action := N' = H, O' = H, P' = T, I' = A, K' = 1, J' = 0, T' = ?;
  };
  transition t6 := {
    from   := f12;
    to     := f24;
    guard  := E >= C;
    action := Q' = D, R' = D, S' = T, F' = A, H' = 1, G' = 0, T' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
