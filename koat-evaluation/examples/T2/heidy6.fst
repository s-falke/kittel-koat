model main {
  var A, B, C;
  states f2, f3, f5, f0;
  transition t0 := {
    from   := f2;
    to     := f2;
    guard  := true;
    action := A' = A + 1;
  };
  transition t1 := {
    from   := f3;
    to     := f3;
    guard  := B > 0;
    action := B' = B - 1;
  };
  transition t2 := {
    from   := f5;
    to     := f5;
    guard  := true;
    action := C' = 1;
  };
  transition t3 := {
    from   := f0;
    to     := f2;
    guard  := C > 0;
    action := A' = 0;
  };
  transition t4 := {
    from   := f0;
    to     := f3;
    guard  := 0 >= C;
    action := A' = 0;
  };
  transition t5 := {
    from   := f3;
    to     := f5;
    guard  := 0 >= B;
    action := A' = 0;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
