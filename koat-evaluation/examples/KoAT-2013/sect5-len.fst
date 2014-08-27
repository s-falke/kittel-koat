model main {
  var A, B;
  states l0, l1, l2;
  transition t0 := {
    from   := l0;
    to     := l1;
    guard  := true;
    action := A' = 0;
  };
  transition t1 := {
    from   := l1;
    to     := l1;
    guard  := B > 0;
    action := B' = B - 1, A' = A + 1;
  };
  transition t2 := {
    from   := l1;
    to     := l2;
    guard  := 0 >= B;
    action := ;
  };
}
strategy dumb {
  Region init := { state = l0 };
}
