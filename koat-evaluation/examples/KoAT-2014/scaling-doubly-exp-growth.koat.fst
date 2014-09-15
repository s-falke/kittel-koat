model main {
  var X_1, X_2, X_3;
  states f, g, h, i;
  transition t1 := {
    from   := i;
    to     := i;
    guard  := X_3 > 0;
    action := X_3' = -1 + X_3, X_2' = X_2, X_1' = X_1;
  };
  transition t2 := {
    from   := h;
    to     := i;
    guard  := X_2 <= 0;
    action := X_3' = X_3, X_2' = X_2, X_1' = X_1;
  };
  transition t3 := {
    from   := h;
    to     := h;
    guard  := X_2 > 0;
    action := X_3' = 2 * X_3, X_2' = -1 + X_2, X_1' = X_1;
  };
  transition t4 := {
    from   := g;
    to     := h;
    guard  := X_1 <= 0;
    action := X_3' = X_3, X_2' = X_2, X_1' = X_1;
  };
  transition t5 := {
    from   := g;
    to     := g;
    guard  := X_1 > 0;
    action := X_3' = X_3, X_2' = 2 * X_2, X_1' = -1 + X_1;
  };
  transition t6 := {
    from   := f;
    to     := g;
    guard  := 1 >= 0;
    action := X_3' = 1, X_2' = 1, X_1' = X_1;
  };
}
strategy dumb {
  Region init := { state = f };
}
