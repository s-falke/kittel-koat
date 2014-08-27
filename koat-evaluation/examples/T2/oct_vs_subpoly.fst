model main {
  var A, B;
  states f20, f1, f30;
  transition t0 := {
    from   := f20;
    to     := f1;
    guard  := true;
    action := A' = 0, B' = 0;
  };
  transition t1 := {
    from   := f1;
    to     := f1;
    guard  := true;
    action := A' = A + 1, B' = B + 1;
  };
  transition t2 := {
    from   := f1;
    to     := f30;
    guard  := A > B;
    action := ;
  };
}
strategy dumb {
  Region init := { state = f20 };
}
