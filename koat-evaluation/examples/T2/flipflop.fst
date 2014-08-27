model main {
  var A;
  states f0, f1;
  transition t0 := {
    from   := f0;
    to     := f1;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := f1;
    to     := f1;
    guard  := 1 >= A && A >= 0;
    action := A' = 1 - A;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
