model main {
  var A, B, C, D, E, F, G, H, I, J, K;
  states f1, f300, f2;
  transition t0 := {
    from   := f1;
    to     := f1;
    guard  := I > 0 && A > B;
    action := C' = J, D' = I, E' = K, I' = ?, J' = ?, K' = ?;
  };
  transition t1 := {
    from   := f1;
    to     := f1;
    guard  := 0 > I && A > B;
    action := C' = J, D' = I, E' = K, I' = ?, J' = ?, K' = ?;
  };
  transition t2 := {
    from   := f1;
    to     := f1;
    guard  := A > B;
    action := C' = J, D' = 0, I' = ?, J' = ?, K' = ?;
  };
  transition t3 := {
    from   := f1;
    to     := f300;
    guard  := B >= A;
    action := C' = J, F' = I, I' = ?, J' = ?, K' = ?;
  };
  transition t4 := {
    from   := f2;
    to     := f1;
    guard  := true;
    action := G' = J, H' = J, I' = ?, J' = ?, K' = ?;
  };
}
strategy dumb {
  Region init := { state = f2 };
}
