model main {
  var A;
  states f3, f1;
  transition t0 := {
    from   := f3;
    to     := f1;
    guard  := A >= 0;
    action := ;
  };
  transition t1 := {
    from   := f1;
    to     := f1;
    guard  := A > 0;
    action := A' = A - 1;
  };
}
strategy dumb {
  Region init := { state = f3 };
}
