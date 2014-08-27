model main {
  var A, B;
  states f0, f1;
  transition t0 := {
    from   := f0;
    to     := f1;
    guard  := A > 0 && 0 > B;
    action := ;
  };
  transition t1 := {
    from   := f1;
    to     := f1;
    guard  := A > B && 0 > B;
    action := A' = A - B;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
