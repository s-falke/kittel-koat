model main {
  var A, B, C, D, E, F, G;
  states f10, f16, f25, f27, f30, f0;
  transition t0 := {
    from   := f10;
    to     := f16;
    guard  := 0 >= A;
    action := B' = 0, C' = G, D' = G, G' = ?;
  };
  transition t1 := {
    from   := f16;
    to     := f16;
    guard  := D > 0;
    action := G' = ?;
  };
  transition t2 := {
    from   := f25;
    to     := f25;
    guard  := true;
    action := G' = ?;
  };
  transition t3 := {
    from   := f27;
    to     := f30;
    guard  := true;
    action := G' = ?;
  };
  transition t4 := {
    from   := f16;
    to     := f10;
    guard  := 0 >= D;
    action := E' = 0, F' = G, A' = G, G' = ?;
  };
  transition t5 := {
    from   := f10;
    to     := f25;
    guard  := A > 0;
    action := G' = ?;
  };
  transition t6 := {
    from   := f0;
    to     := f10;
    guard  := true;
    action := B' = 0, E' = 0, F' = G, A' = G, G' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
