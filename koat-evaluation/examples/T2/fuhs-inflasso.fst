model main {
  var A, B, C;
  states f4, f0;
  transition t0 := {
    from   := f4;
    to     := f4;
    guard  := A > B;
    action := B' = B + 1;
  };
  transition t1 := {
    from   := f4;
    to     := f4;
    guard  := C > A + 1 && B >= A;
    action := A' = A + 1, B' = 0;
  };
  transition t2 := {
    from   := f0;
    to     := f4;
    guard  := C > 0;
    action := A' = 0, B' = 0;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
