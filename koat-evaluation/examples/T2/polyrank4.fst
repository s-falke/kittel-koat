model main {
  var A, B, C;
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
    guard  := A >= B;
    action := A' = A + 1, B' = B + A + 1;
  };
  transition t2 := {
    from   := f1;
    to     := f1;
    guard  := A >= B;
    action := A' = A - C, B' = B - 2*C, C' = C - 1;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
