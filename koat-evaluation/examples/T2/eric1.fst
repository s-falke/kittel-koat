model main {
  var A, B;
  states f1, f2, f999;
  transition t0 := {
    from   := f1;
    to     := f2;
    guard  := A > 0;
    action := A' = A - 1;
  };
  transition t1 := {
    from   := f2;
    to     := f2;
    guard  := A > 0;
    action := A' = A - 1, B' = B + 1;
  };
  transition t2 := {
    from   := f999;
    to     := f1;
    guard  := B > 0 && A = 0;
    action := A' = 1, B' = B - 1;
  };
  transition t3 := {
    from   := f1;
    to     := f1;
    guard  := B > 0;
    action := A' = A + 1, B' = B - 1;
  };
  transition t4 := {
    from   := f2;
    to     := f1;
    guard  := B > 0;
    action := A' = A + 1, B' = B - 1;
  };
}
strategy dumb {
  Region init := { state = f999 };
}
