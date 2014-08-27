model main {
  var A, B, C, D, E, F, G, H, I, J;
  states f0, f15, f25, f41, f48;
  transition t0 := {
    from   := f0;
    to     := f15;
    guard  := true;
    action := A' = 10, B' = 35, C' = 285, D' = I, E' = I, F' = 0, I' = ?, J' = ?;
  };
  transition t1 := {
    from   := f15;
    to     := f25;
    guard  := A > F;
    action := G' = I, H' = 1, I' = ?, J' = ?;
  };
  transition t2 := {
    from   := f25;
    to     := f25;
    guard  := E > H;
    action := G' = I, H' = H + 1, I' = ?, J' = ?;
  };
  transition t3 := {
    from   := f41;
    to     := f15;
    guard  := E >= B;
    action := F' = F + 1, I' = ?, J' = ?;
  };
  transition t4 := {
    from   := f41;
    to     := f15;
    guard  := B > E;
    action := E' = E + 1, F' = F + 1, I' = ?, J' = ?;
  };
  transition t5 := {
    from   := f25;
    to     := f41;
    guard  := H >= E && I > J;
    action := I' = ?, J' = ?;
  };
  transition t6 := {
    from   := f25;
    to     := f41;
    guard  := H >= E;
    action := I' = ?, J' = ?;
  };
  transition t7 := {
    from   := f25;
    to     := f15;
    guard  := H >= E;
    action := E' = E - 1, F' = F + 1, I' = ?, J' = ?;
  };
  transition t8 := {
    from   := f15;
    to     := f48;
    guard  := F >= A;
    action := I' = ?, J' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
