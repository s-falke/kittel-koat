model main {
  var A, B, C, D, E;
  states f2, f300, f1;
  transition t0 := {
    from   := f2;
    to     := f300;
    guard  := true;
    action := E' = ?;
  };
  transition t1 := {
    from   := f300;
    to     := f300;
    guard  := A > 0 && B > 0 && E > 0 && B + A > 0;
    action := C' = E, B' = -1 + B, A' = -1 + B, E' = ?;
  };
  transition t2 := {
    from   := f300;
    to     := f300;
    guard  := A > 0 && B > 0 && 0 > E && B + A > 0;
    action := C' = E, B' = -1 + B, A' = -1 + B, E' = ?;
  };
  transition t3 := {
    from   := f300;
    to     := f300;
    guard  := A > 0 && B + A > 0 && B > 0;
    action := C' = 0, B' = -2 + A, A' = -1 + A, E' = ?;
  };
  transition t4 := {
    from   := f300;
    to     := f1;
    guard  := A > 0 && 0 >= B + A && B > 0;
    action := D' = E, E' = ?;
  };
  transition t5 := {
    from   := f300;
    to     := f1;
    guard  := B > 0 && 0 >= A;
    action := D' = E, E' = ?;
  };
  transition t6 := {
    from   := f300;
    to     := f1;
    guard  := 0 >= B;
    action := D' = E, E' = ?;
  };
}
strategy dumb {
  Region init := { state = f2 };
}
