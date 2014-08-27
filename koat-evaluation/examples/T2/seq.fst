model main {
  var A;
  states f1, f0;
  transition t0 := {
    from   := f1;
    to     := f0;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := f0;
    to     := f0;
    guard  := A >= 0;
    action := A' = A - 1;
  };
}
strategy dumb {
  Region init := { state = f1 };
}
