model main {
  var A, B;
  states f1, f2, f3;
  transition t0 := {
    from   := f1;
    to     := f2;
    guard  := 0 > A + B && A > 0;
    action := ;
  };
  transition t1 := {
    from   := f2;
    to     := f2;
    guard  := A >= 0;
    action := A' = A - B;
  };
  transition t2 := {
    from   := f2;
    to     := f3;
    guard  := 0 > A;
    action := ;
  };
}
strategy dumb {
  Region init := { state = f1 };
}
