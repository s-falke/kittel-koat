model main {
  var A, B;
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
    guard  := A > 0 && B > 0;
    action := A' = A + B;
  };
  transition t2 := {
    from   := f0;
    to     := f0;
    guard  := A > 0 && 0 > B;
    action := A' = A + B;
  };
}
strategy dumb {
  Region init := { state = f1 };
}
