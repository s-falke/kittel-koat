model main {
  var A, B;
  states l0, l1, l2;
  transition t0 := {
    from   := l0;
    to     := l1;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := l1;
    to     := l1;
    guard  := A > 0;
    action := A' = A - 1, B' = B + A;
  };
  transition t2 := {
    from   := l1;
    to     := l2;
    guard  := 0 >= A;
    action := ;
  };
  transition t3 := {
    from   := l2;
    to     := l2;
    guard  := B > 0;
    action := B' = B - 1;
  };
}
strategy dumb {
  Region init := { state = l0 };
}
