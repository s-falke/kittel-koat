model main {
  var A, B;
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
    guard  := A > 0;
    action := A' = A - B, B' = B + 1;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
