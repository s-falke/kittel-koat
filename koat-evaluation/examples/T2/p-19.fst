model main {
  var A, B, C, D, E, F, G, H, I, J, K;
  states f2, f300, f1;
  transition t0 := {
    from   := f2;
    to     := f2;
    guard  := A > 0;
    action := B' = I, C' = J, D' = K, I' = ?, J' = ?, K' = ?;
  };
  transition t1 := {
    from   := f2;
    to     := f300;
    guard  := 0 >= A;
    action := B' = I, C' = J, E' = K, I' = ?, J' = ?, K' = ?;
  };
  transition t2 := {
    from   := f1;
    to     := f2;
    guard  := true;
    action := F' = I, G' = J, H' = I, I' = ?, J' = ?, K' = ?;
  };
}
strategy dumb {
  Region init := { state = f1 };
}
