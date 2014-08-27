model main {
  var A, B;
  states f0, f1;
  transition t0 := {
    from   := f0;
    to     := f1;
    guard  := true;
    action := A' = 3000;
  };
  transition t1 := {
    from   := f1;
    to     := f1;
    guard  := B + 889 >= 0 && 1999 >= A;
    action := B' = B + 1000;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
