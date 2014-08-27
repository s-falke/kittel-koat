model main {
  var A, B, C, D, E, F, G, H;
  states f18, f24, f31, f39, f0;
  transition t0 := {
    from   := f18;
    to     := f18;
    guard  := A > B;
    action := B' = B + 1, G' = ?, H' = ?;
  };
  transition t1 := {
    from   := f24;
    to     := f24;
    guard  := A > B;
    action := B' = B + 1, G' = ?, H' = ?;
  };
  transition t2 := {
    from   := f31;
    to     := f31;
    guard  := A > B;
    action := B' = B + 1, G' = ?, H' = ?;
  };
  transition t3 := {
    from   := f31;
    to     := f39;
    guard  := B >= A;
    action := G' = ?, H' = ?;
  };
  transition t4 := {
    from   := f24;
    to     := f31;
    guard  := B >= A;
    action := B' = 0, G' = ?, H' = ?;
  };
  transition t5 := {
    from   := f18;
    to     := f24;
    guard  := B >= A;
    action := B' = 0, G' = ?, H' = ?;
  };
  transition t6 := {
    from   := f0;
    to     := f18;
    guard  := true;
    action := A' = 10, C' = 10, D' = G, E' = 10, F' = H, B' = 0, G' = ?, H' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
