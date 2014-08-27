model main {
  var A, B;
  states f1, f3;
  transition t0 := {
    from   := f1;
    to     := f3;
    guard  := A > 0;
    action := B' = A;
  };
  transition t1 := {
    from   := f3;
    to     := f3;
    guard  := B > 0;
    action := B' = B - 1;
  };
  transition t2 := {
    from   := f3;
    to     := f3;
    guard  := 0 >= B && A > 1;
    action := B' = A - 1, A' = A - 1;
  };
}
strategy dumb {
  Region init := { state = f1 };
}
