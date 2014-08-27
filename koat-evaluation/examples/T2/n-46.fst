model main {
  var A, B, C, D, E;
  states f2, f1, f300;
  transition t0 := {
    from   := f2;
    to     := f2;
    guard  := true;
    action := A' = 1 + A, B' = 1 + B, C' = -1 + C, E' = ?;
  };
  transition t1 := {
    from   := f1;
    to     := f2;
    guard  := A >= C && B >= A && C >= B;
    action := E' = ?;
  };
  transition t2 := {
    from   := f1;
    to     := f300;
    guard  := C > A && B >= A && C >= B;
    action := D' = E, E' = ?;
  };
  transition t3 := {
    from   := f1;
    to     := f300;
    guard  := B >= A && B > C;
    action := D' = E, E' = ?;
  };
  transition t4 := {
    from   := f1;
    to     := f300;
    guard  := A > B;
    action := D' = E, E' = ?;
  };
}
strategy dumb {
  Region init := { state = f1 };
}
