model main {
  var A, B;
  states f3, f0, f4;
  transition t0 := {
    from   := f3;
    to     := f0;
    guard  := true;
    action := A' = 0;
  };
  transition t1 := {
    from   := f0;
    to     := f0;
    guard  := B > 0;
    action := B' = B - 1;
  };
  transition t2 := {
    from   := f4;
    to     := f4;
    guard  := true;
    action := ;
  };
  transition t3 := {
    from   := f0;
    to     := f4;
    guard  := 0 >= B;
    action := A' = -1;
  };
}
strategy dumb {
  Region init := { state = f3 };
}
