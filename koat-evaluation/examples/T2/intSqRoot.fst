model main {
  var A, B, C, D, E;
  states f0, f6, f16;
  transition t0 := {
    from   := f0;
    to     := f6;
    guard  := true;
    action := A' = 1, B' = C, E' = ?;
  };
  transition t1 := {
    from   := f6;
    to     := f6;
    guard  := B > A + 1 && E*E > C;
    action := B' = E, D' = E, E' = ?;
  };
  transition t2 := {
    from   := f6;
    to     := f6;
    guard  := B > A + 1 && C >= E*E;
    action := A' = E, D' = E, E' = ?;
  };
  transition t3 := {
    from   := f6;
    to     := f16;
    guard  := A + 1 >= B;
    action := E' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
