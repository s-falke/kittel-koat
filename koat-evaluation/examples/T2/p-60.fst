model main {
  var A, B, C, D, E;
  states f300, f3, f2;
  transition t0 := {
    from   := f300;
    to     := f300;
    guard  := 100 >= A && B > 0;
    action := A' = 1 + A;
  };
  transition t1 := {
    from   := f300;
    to     := f3;
    guard  := A > 100;
    action := C' = 0, D' = 0, E' = 0;
  };
  transition t2 := {
    from   := f2;
    to     := f300;
    guard  := B > 0;
    action := A' = 1;
  };
  transition t3 := {
    from   := f2;
    to     := f3;
    guard  := 0 >= B;
    action := A' = 0, C' = 0, D' = 0, E' = 0;
  };
}
strategy dumb {
  Region init := { state = f2 };
}
