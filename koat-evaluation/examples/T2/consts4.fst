model main {
  var A;
  states f0, f1;
  transition t0 := {
    from   := f0;
    to     := f1;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := f1;
    to     := f1;
    guard  := A > 1200;
    action := A' = A - 1000;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
