model main {
  var A, B, C, D, E, F, G;
  states f12, f22, f24, f27, f0;
  transition t0 := {
    from   := f12;
    to     := f12;
    guard  := A > 0 && G > 0;
    action := B' = B - 1, C' = C + 1, A' = A - 1, D' = G, G' = ?;
  };
  transition t1 := {
    from   := f12;
    to     := f12;
    guard  := 0 >= G && A > 0 && A > B;
    action := A' = A - 1, D' = G, G' = ?;
  };
  transition t2 := {
    from   := f22;
    to     := f22;
    guard  := true;
    action := G' = ?;
  };
  transition t3 := {
    from   := f24;
    to     := f27;
    guard  := true;
    action := G' = ?;
  };
  transition t4 := {
    from   := f12;
    to     := f22;
    guard  := 0 >= A;
    action := G' = ?;
  };
  transition t5 := {
    from   := f0;
    to     := f12;
    guard  := G > 0;
    action := E' = G, B' = G, F' = 4, C' = 0, A' = 4, G' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
