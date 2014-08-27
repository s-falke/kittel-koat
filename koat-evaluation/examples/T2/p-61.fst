model main {
  var A, B, C, D, E;
  states f300, f2, f1;
  transition t0 := {
    from   := f300;
    to     := f300;
    guard  := A > 100 && 9 >= B;
    action := A' = -1 + A;
  };
  transition t1 := {
    from   := f300;
    to     := f2;
    guard  := 100 >= A && 9 >= B;
    action := C' = 0, D' = 0, E' = 0;
  };
  transition t2 := {
    from   := f300;
    to     := f2;
    guard  := B > 9;
    action := C' = 0, D' = 0, E' = 0;
  };
  transition t3 := {
    from   := f1;
    to     := f300;
    guard  := true;
    action := A' = 1000;
  };
}
strategy dumb {
  Region init := { state = f1 };
}
