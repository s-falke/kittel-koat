model main {
  var X_1, X_2;
  states f, g, h;
  transition t1 := {
    from   := h;
    to     := h;
    guard  := X_2 > 0;
    action := X_2' = -1 + X_2, X_1' = X_1;
  };
  transition t2 := {
    from   := g;
    to     := h;
    guard  := X_1 <= 0;
    action := X_2' = X_2, X_1' = X_1;
  };
  transition t3 := {
    from   := g;
    to     := g;
    guard  := X_1 > 0;
    action := X_2' = 2 * X_2, X_1' = -1 + X_1;
  };
  transition t4 := {
    from   := f;
    to     := g;
    guard  := 1 >= 0;
    action := X_2' = 1, X_1' = X_1;
  };
}
strategy dumb {
  Region init := { state = f };
}
