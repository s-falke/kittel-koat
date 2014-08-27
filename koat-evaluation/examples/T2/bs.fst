model main {
  var A, B, C, D, E, F, G, H, I;
  states f0, f6, f12, f20;
  transition t0 := {
    from   := f0;
    to     := f6;
    guard  := true;
    action := A' = 8, B' = 0, C' = 14, D' = -1, H' = ?, I' = ?;
  };
  transition t1 := {
    from   := f6;
    to     := f12;
    guard  := C >= B && A > H;
    action := E' = I, H' = ?, I' = ?;
  };
  transition t2 := {
    from   := f6;
    to     := f12;
    guard  := C >= B;
    action := E' = I, H' = ?, I' = ?;
  };
  transition t3 := {
    from   := f6;
    to     := f6;
    guard  := C >= B;
    action := C' = B - 1, D' = I, E' = H, H' = ?, I' = ?;
  };
  transition t4 := {
    from   := f12;
    to     := f6;
    guard  := true;
    action := C' = E - 1, H' = ?, I' = ?;
  };
  transition t5 := {
    from   := f12;
    to     := f6;
    guard  := true;
    action := B' = E + 1, H' = ?, I' = ?;
  };
  transition t6 := {
    from   := f6;
    to     := f20;
    guard  := B > C;
    action := F' = D, G' = D, H' = ?, I' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
