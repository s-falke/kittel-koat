model main {
  var A, B, C;
  states f4, f5, f0, f2;
  transition t0 := {
    from   := f4;
    to     := f5;
    guard  := 0 >= A && 0 >= B;
    action := C' = 1;
  };
  transition t1 := {
    from   := f0;
    to     := f2;
    guard  := A > 0;
    action := C' = 1;
  };
  transition t2 := {
    from   := f4;
    to     := f4;
    guard  := B > 0;
    action := B' = B - 1;
  };
  transition t3 := {
    from   := f0;
    to     := f4;
    guard  := 0 >= A;
    action := C' = 0;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
