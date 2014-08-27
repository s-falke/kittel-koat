model main {
  var A, B, C, D, E;
  states f0, f4, f20, f31;
  transition t0 := {
    from   := f0;
    to     := f4;
    guard  := true;
    action := A' = 0;
  };
  transition t1 := {
    from   := f20;
    to     := f20;
    guard  := 199 >= B;
    action := B' = B + 1, C' = B;
  };
  transition t2 := {
    from   := f20;
    to     := f31;
    guard  := B > 199;
    action := ;
  };
  transition t3 := {
    from   := f4;
    to     := f4;
    guard  := 99 >= A;
    action := A' = A + 1, D' = A, E' = A;
  };
  transition t4 := {
    from   := f4;
    to     := f20;
    guard  := A > 99;
    action := B' = 100;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
