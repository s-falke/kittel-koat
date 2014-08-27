model main {
  var A, B, C, D;
  states f8, f19, f28, f36, f0;
  transition t0 := {
    from   := f8;
    to     := f8;
    guard  := A >= 0;
    action := A' = A - 1;
  };
  transition t1 := {
    from   := f19;
    to     := f19;
    guard  := B >= 0;
    action := B' = B - 1;
  };
  transition t2 := {
    from   := f28;
    to     := f28;
    guard  := C >= 0;
    action := C' = C - 1;
  };
  transition t3 := {
    from   := f28;
    to     := f36;
    guard  := 0 > C;
    action := ;
  };
  transition t4 := {
    from   := f19;
    to     := f28;
    guard  := 0 > B;
    action := C' = 999;
  };
  transition t5 := {
    from   := f0;
    to     := f19;
    guard  := true;
    action := D' = 1, B' = 999;
  };
  transition t6 := {
    from   := f8;
    to     := f19;
    guard  := 0 > A;
    action := B' = 999;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
