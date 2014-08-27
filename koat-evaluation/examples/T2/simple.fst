model main {
  var A;
  states f0, f3;
  transition t0 := {
    from   := f0;
    to     := f3;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := f3;
    to     := f3;
    guard  := A > 1;
    action := A' = A - 1;
  };
  transition t2 := {
    from   := f3;
    to     := f3;
    guard  := true;
    action := A' = A - 1;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
