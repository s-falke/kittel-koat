model main {
  var A, B, C, D, E, F, G, H, I, J;
  states f0, f12, f25, f34;
  transition t0 := {
    from   := f0;
    to     := f12;
    guard  := true;
    action := A' = H, B' = I, C' = J, D' = 0, H' = ?, I' = ?, J' = ?;
  };
  transition t1 := {
    from   := f12;
    to     := f12;
    guard  := C > D;
    action := D' = D + 1, H' = ?, I' = ?, J' = ?;
  };
  transition t2 := {
    from   := f25;
    to     := f25;
    guard  := E > F;
    action := F' = F + 1, H' = ?, I' = ?, J' = ?;
  };
  transition t3 := {
    from   := f25;
    to     := f34;
    guard  := F >= E;
    action := H' = ?, I' = ?, J' = ?;
  };
  transition t4 := {
    from   := f12;
    to     := f25;
    guard  := D >= C;
    action := G' = H, E' = A, F' = 0, H' = ?, I' = ?, J' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
