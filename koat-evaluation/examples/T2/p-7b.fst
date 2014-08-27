model main {
  var A, B, C, D, E;
  states f3, f1, f2;
  transition t0 := {
    from   := f3;
    to     := f1;
    guard  := true;
    action := A' = 0, E' = ?;
  };
  transition t1 := {
    from   := f1;
    to     := f2;
    guard  := B >= C;
    action := D' = E, E' = ?;
  };
  transition t2 := {
    from   := f1;
    to     := f2;
    guard  := 0 >= A && B + 1 = C;
    action := A' = 1, D' = E, B' = 1 + B, E' = ?;
  };
  transition t3 := {
    from   := f1;
    to     := f1;
    guard  := C > B && 0 >= A && C > 1 + B;
    action := A' = 0, B' = 1 + B, C' = -1 + C, E' = ?;
  };
}
strategy dumb {
  Region init := { state = f3 };
}
