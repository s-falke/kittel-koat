model main {
  var A, B, C;
  states f0, f10, f13, f21, f24, f27, f39;
  transition t0 := {
    from   := f0;
    to     := f10;
    guard  := true;
    action := A' = 1;
  };
  transition t1 := {
    from   := f10;
    to     := f13;
    guard  := 5 >= A;
    action := B' = 1;
  };
  transition t2 := {
    from   := f13;
    to     := f13;
    guard  := 5 >= B;
    action := B' = B + 1;
  };
  transition t3 := {
    from   := f21;
    to     := f24;
    guard  := 5 >= A;
    action := B' = 1;
  };
  transition t4 := {
    from   := f24;
    to     := f27;
    guard  := 5 >= B;
    action := C' = 1;
  };
  transition t5 := {
    from   := f27;
    to     := f27;
    guard  := 5 >= C;
    action := C' = C + 1;
  };
  transition t6 := {
    from   := f27;
    to     := f24;
    guard  := C > 5;
    action := B' = B + 1;
  };
  transition t7 := {
    from   := f24;
    to     := f21;
    guard  := B > 5;
    action := A' = A + 1;
  };
  transition t8 := {
    from   := f21;
    to     := f39;
    guard  := A > 5;
    action := ;
  };
  transition t9 := {
    from   := f13;
    to     := f10;
    guard  := B > 5;
    action := A' = A + 1;
  };
  transition t10 := {
    from   := f10;
    to     := f21;
    guard  := A > 5;
    action := A' = 1;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
