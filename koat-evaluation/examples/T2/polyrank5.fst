model main {
  var A, B, C, D;
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
    action := A' = A + B, B' = B + C, C' = C + D, D' = D - 1;
  };
  transition t2 := {
    from   := f1;
    to     := f1;
    guard  := A > 0;
    action := A' = A - 1;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
