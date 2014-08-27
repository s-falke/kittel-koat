model main {
  var A, B, C, D, E;
  states f0, f1, f2, f3, f4;
  transition t0 := {
    from   := f0;
    to     := f1;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := f1;
    to     := f1;
    guard  := A > B;
    action := B' = B + 1;
  };
  transition t2 := {
    from   := f1;
    to     := f2;
    guard  := B >= A;
    action := C' = B;
  };
  transition t3 := {
    from   := f2;
    to     := f2;
    guard  := C > 0;
    action := C' = C - 1;
  };
  transition t4 := {
    from   := f2;
    to     := f3;
    guard  := 0 >= C;
    action := D' = C;
  };
  transition t5 := {
    from   := f3;
    to     := f3;
    guard  := A > D;
    action := D' = D + 1;
  };
  transition t6 := {
    from   := f3;
    to     := f4;
    guard  := D >= A;
    action := E' = D;
  };
  transition t7 := {
    from   := f4;
    to     := f4;
    guard  := E > 0;
    action := E' = E - 1;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
