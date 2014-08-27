model main {
  var A, B;
  states f0, f1;
  transition t0 := {
    from   := f0;
    to     := f1;
    guard  := A > 0;
    action := ;
  };
  transition t1 := {
    from   := f1;
    to     := f1;
    guard  := A > 0 && B >= 0;
    action := B' = B - A;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
