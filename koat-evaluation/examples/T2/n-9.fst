model main {
  var A, B, C, D, E, F, G, H, I, J, K;
  states f0, f2, f1;
  transition t0 := {
    from   := f0;
    to     := f2;
    guard  := A >= B;
    action := A' = H, C' = I, H' = ?, I' = ?, J' = ?, K' = ?;
  };
  transition t1 := {
    from   := f0;
    to     := f0;
    guard  := B > A;
    action := A' = H, D' = I, E' = 0, H' = ?, I' = ?, J' = ?, K' = ?;
  };
  transition t2 := {
    from   := f0;
    to     := f0;
    guard  := 0 > J && B > A;
    action := A' = H, D' = I, E' = J, F' = K, H' = ?, I' = ?, J' = ?, K' = ?;
  };
  transition t3 := {
    from   := f0;
    to     := f0;
    guard  := J > 0 && B > A;
    action := A' = H, D' = I, E' = J, F' = K, H' = ?, I' = ?, J' = ?, K' = ?;
  };
  transition t4 := {
    from   := f1;
    to     := f0;
    guard  := true;
    action := G' = H, H' = ?, I' = ?, J' = ?, K' = ?;
  };
}
strategy dumb {
  Region init := { state = f1 };
}
