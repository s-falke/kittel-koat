model main {
  var X_1, X_2, X_3, X_4;
  states l0, l1, l2, l3;
  transition t1 := {
    from   := l3;
    to     := l3;
    guard  := X_1 > 0;
    action := X_4' = X_4, X_3' = X_3, X_2' = X_2, X_1' = -1 + X_1;
  };
  transition t2 := {
    from   := l1;
    to     := l3;
    guard  := X_2 <= 0;
    action := X_4' = X_4, X_3' = X_3, X_2' = X_2, X_1' = X_1;
  };
  transition t3 := {
    from   := l2;
    to     := l1;
    guard  := X_3 >= X_2;
    action := X_4' = X_4, X_3' = X_3, X_2' = -1 + X_2, X_1' = X_1 + X_4;
  };
  transition t4 := {
    from   := l2;
    to     := l2;
    guard  := X_3 < X_2;
    action := X_4' = X_4 + X_3, X_3' = 1 + X_3, X_2' = X_2, X_1' = X_1;
  };
  transition t5 := {
    from   := l1;
    to     := l2;
    guard  := X_2 > 0;
    action := X_4' = 0, X_3' = 0, X_2' = X_2, X_1' = X_1;
  };
  transition t6 := {
    from   := l0;
    to     := l1;
    guard  := 1 >= 0;
    action := X_4' = X_4, X_3' = X_3, X_2' = X_2, X_1' = 0;
  };
}
strategy dumb {
  Region init := { state = l0 };
}
