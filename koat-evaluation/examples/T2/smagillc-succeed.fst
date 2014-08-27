model main {
  var A, B, C, D, E, F, G;
  states f11, f21, f23, f26, f0;
  transition t0 := {
    from   := f11;
    to     := f11;
    guard  := A > 0 && G > 0;
    action := B' = B - 1, C' = C + 1, A' = A - 1, D' = G, G' = ?;
  };
  transition t1 := {
    from   := f11;
    to     := f11;
    guard  := 0 >= G && A > 0 && A > B;
    action := A' = A - 1, D' = G, G' = ?;
  };
  transition t2 := {
    from   := f21;
    to     := f21;
    guard  := true;
    action := G' = ?;
  };
  transition t3 := {
    from   := f23;
    to     := f26;
    guard  := true;
    action := G' = ?;
  };
  transition t4 := {
    from   := f11;
    to     := f21;
    guard  := 0 >= A;
    action := G' = ?;
  };
  transition t5 := {
    from   := f0;
    to     := f11;
    guard  := G > 0;
    action := E' = G, B' = G, F' = 4, C' = 0, A' = 4, G' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
