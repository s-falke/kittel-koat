model main {
  var A, B;
  states f0, f1, f2, f10000;
  transition t0 := {
    from   := f0;
    to     := f1;
    guard  := A = B;
    action := B' = A;
  };
  transition t1 := {
    from   := f1;
    to     := f1;
    guard  := true;
    action := A' = A + 1, B' = B + 1;
  };
  transition t2 := {
    from   := f1;
    to     := f2;
    guard  := true;
    action := ;
  };
  transition t3 := {
    from   := f1;
    to     := f10000;
    guard  := A > B;
    action := ;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
