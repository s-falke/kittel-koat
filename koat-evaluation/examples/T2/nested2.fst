model main {
  var A, B, C, D, E, F, G;
  states f0, f1, f3;
  transition t0 := {
    from   := f0;
    to     := f0;
    guard  := A > 0;
    action := A' = -1 + A, B' = C, D' = A, C' = -1 + C, G' = ?;
  };
  transition t1 := {
    from   := f1;
    to     := f0;
    guard  := A > 0 && C > 0;
    action := A' = -1 + A, C' = -1 + C, E' = C, F' = A, G' = ?;
  };
  transition t2 := {
    from   := f0;
    to     := f0;
    guard  := 0 >= A && C > 0;
    action := A' = 5000, G' = ?;
  };
  transition t3 := {
    from   := f3;
    to     := f0;
    guard  := G > 0;
    action := A' = 5000, C' = G, G' = ?;
  };
}
strategy dumb {
  Region init := { state = f3 };
}
