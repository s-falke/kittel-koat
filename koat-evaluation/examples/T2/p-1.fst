model main {
  var A, B, C, D, E, F, G, H, I, J, K;
  states f1, f300, f2;
  transition t0 := {
    from   := f1;
    to     := f1;
    guard  := B > A;
    action := C' = I, D' = J, E' = K, I' = ?, J' = ?, K' = ?;
  };
  transition t1 := {
    from   := f1;
    to     := f300;
    guard  := A >= B;
    action := C' = I, D' = J, F' = K, I' = ?, J' = ?, K' = ?;
  };
  transition t2 := {
    from   := f2;
    to     := f1;
    guard  := true;
    action := G' = I, H' = J, I' = ?, J' = ?, K' = ?;
  };
}
strategy dumb {
  Region init := { state = f2 };
}
