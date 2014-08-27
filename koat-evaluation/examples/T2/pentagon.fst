model main {
  var A, B, C, D, E, F, G, H, I, J, K;
  states f0, f1;
  transition t0 := {
    from   := f0;
    to     := f0;
    guard  := 0 > A;
    action := A' = -A, B' = B + A, C' = C + A, G' = ?, H' = ?, I' = ?, J' = ?, K' = ?;
  };
  transition t1 := {
    from   := f0;
    to     := f0;
    guard  := 0 > B;
    action := A' = A + B, B' = -B, D' = D + B, G' = ?, H' = ?, I' = ?, J' = ?, K' = ?;
  };
  transition t2 := {
    from   := f0;
    to     := f0;
    guard  := 0 > D;
    action := B' = B + D, D' = -D, E' = E + D, G' = ?, H' = ?, I' = ?, J' = ?, K' = ?;
  };
  transition t3 := {
    from   := f0;
    to     := f0;
    guard  := 0 > E;
    action := C' = C + E, D' = D + E, E' = -E, G' = ?, H' = ?, I' = ?, J' = ?, K' = ?;
  };
  transition t4 := {
    from   := f0;
    to     := f0;
    guard  := 0 > C;
    action := A' = A + C, C' = -C, E' = E + C, G' = ?, H' = ?, I' = ?, J' = ?, K' = ?;
  };
  transition t5 := {
    from   := f1;
    to     := f0;
    guard  := G + H + I + J + K > 0;
    action := A' = G, B' = H, C' = K, D' = I, E' = J, F' = G + H + I + J + K, G' = ?, H' = ?, I' = ?, J' = ?, K' = ?;
  };
}
strategy dumb {
  Region init := { state = f1 };
}
