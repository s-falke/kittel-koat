model main {
  var A, B, C, D, E, F, G;
  states f0, f8, f10, f14, f28;
  transition t0 := {
    from   := f0;
    to     := f8;
    guard  := true;
    action := A' = 1, B' = 1, C' = 0, D' = 1, E' = 1, G' = ?;
  };
  transition t1 := {
    from   := f8;
    to     := f10;
    guard  := 29 >= D;
    action := G' = ?;
  };
  transition t2 := {
    from   := f10;
    to     := f14;
    guard  := D > E && E > 5;
    action := E' = G, G' = ?;
  };
  transition t3 := {
    from   := f10;
    to     := f14;
    guard  := D > E && 5 >= E;
    action := E' = E + 2, G' = ?;
  };
  transition t4 := {
    from   := f14;
    to     := f10;
    guard  := 12 >= E && E > 9;
    action := D' = D + 10, G' = ?;
  };
  transition t5 := {
    from   := f14;
    to     := f10;
    guard  := E > 12;
    action := D' = D + 1, G' = ?;
  };
  transition t6 := {
    from   := f14;
    to     := f10;
    guard  := 9 >= E;
    action := D' = D + 1, G' = ?;
  };
  transition t7 := {
    from   := f10;
    to     := f8;
    guard  := E >= D;
    action := D' = D + 2, E' = E - 10, G' = ?;
  };
  transition t8 := {
    from   := f8;
    to     := f28;
    guard  := D > 29;
    action := C' = 1, F' = 1, G' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
