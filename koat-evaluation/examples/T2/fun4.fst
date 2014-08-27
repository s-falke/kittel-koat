model main {
  var A, B, C, D;
  states f0, f1;
  transition t0 := {
    from   := f0;
    to     := f1;
    guard  := A >= 0 && 3 >= A && 3 >= B && B >= 0;
    action := C' = 2;
  };
  transition t1 := {
    from   := f1;
    to     := f1;
    guard  := C + A > 2*B && 0 > 1;
    action := B' = B + 1, D' = B + 1;
  };
  transition t2 := {
    from   := f1;
    to     := f1;
    guard  := C + A > 2*B;
    action := B' = B + 1, D' = B + 1;
  };
  transition t3 := {
    from   := f1;
    to     := f1;
    guard  := 2*B > 1 + C + A;
    action := B' = B - 1, D' = B - 1;
  };
  transition t4 := {
    from   := f1;
    to     := f1;
    guard  := 2*B > 1 + C + A && 0 > 1;
    action := B' = B - 1, D' = B - 1;
  };
  transition t5 := {
    from   := f1;
    to     := f1;
    guard  := 0 > 0 && 2*B >= C + A && C + A + 1 >= 2*B;
    action := D' = B;
  };
  transition t6 := {
    from   := f1;
    to     := f1;
    guard  := 0 > 0 && 2*B >= C + A && C + A + 1 >= 2*B;
    action := D' = B;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
