model main {
  var A, B, C;
  states f1, f3;
  transition t0 := {
    from   := f1;
    to     := f1;
    guard  := A > B;
    action := B' = B + 1;
  };
  transition t1 := {
    from   := f3;
    to     := f1;
    guard  := B > C;
    action := ;
  };
  transition t2 := {
    from   := f1;
    to     := f1;
    guard  := B > C + 1 && B >= A;
    action := C' = C + 1;
  };
}
strategy dumb {
  Region init := { state = f3 };
}
