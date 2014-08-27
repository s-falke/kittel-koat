model main {
  var A, B, C, D;
  states f0, f6, f15, f19;
  transition t0 := {
    from   := f0;
    to     := f6;
    guard  := true;
    action := A' = 0, B' = 0;
  };
  transition t1 := {
    from   := f6;
    to     := f6;
    guard  := C > B;
    action := B' = B + 1;
  };
  transition t2 := {
    from   := f6;
    to     := f6;
    guard  := C > B;
    action := A' = A + 2, B' = B + 1;
  };
  transition t3 := {
    from   := f15;
    to     := f19;
    guard  := A = C + 1;
    action := A' = C + 1, D' = 1;
  };
  transition t4 := {
    from   := f15;
    to     := f19;
    guard  := C >= A;
    action := D' = 0;
  };
  transition t5 := {
    from   := f15;
    to     := f19;
    guard  := A > 1 + C;
    action := D' = 0;
  };
  transition t6 := {
    from   := f6;
    to     := f15;
    guard  := B >= C && C > A;
    action := ;
  };
  transition t7 := {
    from   := f6;
    to     := f15;
    guard  := A > C && B >= C;
    action := ;
  };
  transition t8 := {
    from   := f6;
    to     := f19;
    guard  := B >= C && A = C;
    action := C' = A, D' = 1;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
