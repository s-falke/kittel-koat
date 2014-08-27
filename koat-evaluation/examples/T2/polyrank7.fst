model main {
  var A, B, C;
  states f2, f0;
  transition t0 := {
    from   := f2;
    to     := f2;
    guard  := true;
    action := A' = A + B, C' = C + 1, B' = B - 2;
  };
  transition t1 := {
    from   := f2;
    to     := f2;
    guard  := true;
    action := A' = A + C, C' = C - 2;
  };
  transition t2 := {
    from   := f0;
    to     := f2;
    guard  := A >= 0;
    action := ;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
