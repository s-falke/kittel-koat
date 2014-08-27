model main {
  var A;
  states f3, f2;
  transition t0 := {
    from   := f3;
    to     := f2;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := f2;
    to     := f2;
    guard  := A > 1;
    action := A' = -1 + A;
  };
  transition t2 := {
    from   := f2;
    to     := f2;
    guard  := 1 >= A;
    action := A' = -1 + A;
  };
}
strategy dumb {
  Region init := { state = f3 };
}
