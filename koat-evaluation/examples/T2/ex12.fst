model main {
  var A, B;
  states f0, f5, f8;
  transition t0 := {
    from   := f0;
    to     := f5;
    guard  := true;
    action := A' = 2, B' = 4;
  };
  transition t1 := {
    from   := f5;
    to     := f5;
    guard  := 19 >= A;
    action := A' = A + 2, B' = A + 4;
  };
  transition t2 := {
    from   := f5;
    to     := f8;
    guard  := A > 19;
    action := ;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
