model main {
  var A, B;
  states f0, f3, f10;
  transition t0 := {
    from   := f0;
    to     := f3;
    guard  := true;
    action := A' = 1;
  };
  transition t1 := {
    from   := f3;
    to     := f3;
    guard  := 10 >= A;
    action := A' = A + 1, B' = 10 - A;
  };
  transition t2 := {
    from   := f3;
    to     := f10;
    guard  := A > 10;
    action := ;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
