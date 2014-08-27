model main {
  var A, B, C, D;
  states sqrt, f, end;
  transition t0 := {
    from   := sqrt;
    to     := f;
    guard  := true;
    action := A' = 0, B' = 1, C' = 1;
  };
  transition t1 := {
    from   := f;
    to     := f;
    guard  := D >= C && B >= 0;
    action := A' = A + 1, B' = B + 2, C' = C + B + 2;
  };
  transition t2 := {
    from   := f;
    to     := end;
    guard  := C > D;
    action := ;
  };
}
strategy dumb {
  Region init := { state = sqrt };
}
