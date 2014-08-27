model main {
  var A, B, C, D, E, F, G;
  states f4, f6, f5;
  transition t0 := {
    from   := f4;
    to     := f4;
    guard  := A >= 0;
    action := A' = A + B;
  };
  transition t1 := {
    from   := f4;
    to     := f6;
    guard  := 0 > A;
    action := C' = 0, D' = 0, E' = 0, F' = 0, G' = 0;
  };
  transition t2 := {
    from   := f5;
    to     := f4;
    guard  := 0 > B;
    action := ;
  };
  transition t3 := {
    from   := f5;
    to     := f6;
    guard  := B >= 0;
    action := C' = 0, D' = 0, E' = 0, F' = 0, G' = 0;
  };
}
strategy dumb {
  Region init := { state = f5 };
}
