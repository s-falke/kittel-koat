model main {
  var A, B;
  states f2, f3, f0;
  transition t0 := {
    from   := f2;
    to     := f3;
    guard  := 0 >= A;
    action := B' = 1;
  };
  transition t1 := {
    from   := f0;
    to     := f2;
    guard  := true;
    action := B' = 0;
  };
  transition t2 := {
    from   := f2;
    to     := f2;
    guard  := A > 0;
    action := A' = A - 1;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
