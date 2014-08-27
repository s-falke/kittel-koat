model main {
  var A, B, C;
  states f8, f12, f0;
  transition t0 := {
    from   := f8;
    to     := f12;
    guard  := A = 2;
    action := A' = 2, B' = 1;
  };
  transition t1 := {
    from   := f8;
    to     := f12;
    guard  := 1 >= A;
    action := B' = 0;
  };
  transition t2 := {
    from   := f8;
    to     := f12;
    guard  := A > 2;
    action := B' = 0;
  };
  transition t3 := {
    from   := f0;
    to     := f12;
    guard  := true;
    action := A' = 1, C' = 1, B' = 1;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
