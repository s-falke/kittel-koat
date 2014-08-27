model main {
  var A, B, C;
  states f0, f2;
  transition t0 := {
    from   := f0;
    to     := f2;
    guard  := A >= 0 && B >= C;
    action := ;
  };
  transition t1 := {
    from   := f2;
    to     := f2;
    guard  := A > 0 && B + 1 >= C;
    action := A' = A - 1, C' = C - 1;
  };
  transition t2 := {
    from   := f2;
    to     := f2;
    guard  := A >= 0 && B >= 0;
    action := C' = C - 1, B' = B + C - 1;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
