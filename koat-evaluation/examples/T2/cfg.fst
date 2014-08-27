model main {
  var A;
  states f0, f2;
  transition t0 := {
    from   := f0;
    to     := f2;
    guard  := A + 99 >= 0;
    action := A' = A + 200;
  };
  transition t1 := {
    from   := f0;
    to     := f2;
    guard  := A > 0;
    action := A' = A + 500;
  };
  transition t2 := {
    from   := f2;
    to     := f2;
    guard  := A + 199 >= 0;
    action := A' = A + 700;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
