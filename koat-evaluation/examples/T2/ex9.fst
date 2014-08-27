model main {
  var A, B, C, D, E, F, G, H;
  states f0, f12, f27, f42, f55, f66;
  transition t0 := {
    from   := f0;
    to     := f12;
    guard  := true;
    action := A' = G, B' = G, C' = G, D' = 0, G' = ?, H' = ?;
  };
  transition t1 := {
    from   := f12;
    to     := f12;
    guard  := C > D;
    action := D' = D + 1, E' = G, G' = ?, H' = ?;
  };
  transition t2 := {
    from   := f27;
    to     := f27;
    guard  := 0 > H;
    action := F' = G, G' = ?, H' = ?;
  };
  transition t3 := {
    from   := f27;
    to     := f27;
    guard  := true;
    action := F' = G, G' = ?, H' = ?;
  };
  transition t4 := {
    from   := f42;
    to     := f42;
    guard  := G > H;
    action := G' = ?, H' = ?;
  };
  transition t5 := {
    from   := f42;
    to     := f42;
    guard  := true;
    action := G' = ?, H' = ?;
  };
  transition t6 := {
    from   := f55;
    to     := f55;
    guard  := G > H;
    action := G' = ?, H' = ?;
  };
  transition t7 := {
    from   := f55;
    to     := f55;
    guard  := true;
    action := G' = ?, H' = ?;
  };
  transition t8 := {
    from   := f55;
    to     := f66;
    guard  := true;
    action := G' = ?, H' = ?;
  };
  transition t9 := {
    from   := f42;
    to     := f55;
    guard  := true;
    action := G' = ?, H' = ?;
  };
  transition t10 := {
    from   := f27;
    to     := f42;
    guard  := true;
    action := G' = ?, H' = ?;
  };
  transition t11 := {
    from   := f12;
    to     := f27;
    guard  := D >= C;
    action := G' = ?, H' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
