model main {
  var A, B, C, D;
  states l0, l1, l2;
  transition t0 := {
    from   := l0;
    to     := l1;
    guard  := true;
    action := A' = 0;
  };
  transition t1 := {
    from   := l1;
    to     := l2;
    guard  := B > 0;
    action := C' = 0, D' = 0;
  };
  transition t2 := {
    from   := l2;
    to     := l2;
    guard  := B > C;
    action := C' = C + 1, D' = D + C;
  };
  transition t3 := {
    from   := l2;
    to     := l1;
    guard  := C >= B;
    action := B' = B - 1, A' = A + D;
  };
}
strategy dumb {
  Region init := { state = l0 };
}
