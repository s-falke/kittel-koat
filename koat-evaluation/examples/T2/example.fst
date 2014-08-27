model main {
  var A, B;
  states f1, f2;
  transition t0 := {
    from   := f1;
    to     := f2;
    guard  := A > 0 && B > 0;
    action := ;
  };
  transition t1 := {
    from   := f2;
    to     := f2;
    guard  := A > 1 && B > 0;
    action := A' = A - 1;
  };
  transition t2 := {
    from   := f2;
    to     := f2;
    guard  := A > 0 && B > 1;
    action := B' = B - 1;
  };
}
strategy dumb {
  Region init := { state = f1 };
}
