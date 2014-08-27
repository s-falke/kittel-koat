model main {
  var A, B, C, D;
  states l0, l1, l2, l3;
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
    action := C' = A;
  };
  transition t3 := {
    from   := l2;
    to     := l3;
    guard  := C > 0;
    action := D' = C;
  };
  transition t4 := {
    from   := l3;
    to     := l3;
    guard  := D > 0 && C > 0;
    action := D' = D - 1;
  };
  transition t5 := {
    from   := l3;
    to     := l2;
    guard  := 0 >= D && C > 0;
    action := C' = C - 1;
  };
}
strategy dumb {
  Region init := { state = l0 };
}
