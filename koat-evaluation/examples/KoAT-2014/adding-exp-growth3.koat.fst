model main {
  var X_1, X_2, X_3;
  states f, g, g1, h;
  transition t1 := {
    from   := h;
    to     := h;
    guard  := X_2 > 0;
    action := X_3' = X_3, X_2' = -1 + X_2, X_1' = X_1;
  };
  transition t2 := {
    from   := g;
    to     := h;
    guard  := X_1 <= 0;
    action := X_3' = X_3, X_2' = X_2, X_1' = X_1;
  };
  transition t3 := {
    from   := g1;
    to     := g;
    guard  := 1 >= 0;
    action := X_3' = X_3, X_2' = X_3 + X_2, X_1' = X_1;
  };
  transition t4 := {
    from   := g;
    to     := g1;
    guard  := X_1 > 0;
    action := X_3' = X_2, X_2' = X_2, X_1' = -1 + X_1;
  };
  transition t5 := {
    from   := f;
    to     := g;
    guard  := 1 >= 0;
    action := X_3' = 0, X_2' = 1, X_1' = X_1;
  };
}
strategy dumb {
  Region init := { state = f };
}
