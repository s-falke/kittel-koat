model main {
  var A;
  states f300, f3;
  transition t0 := {
    from   := f300;
    to     := f3;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := f3;
    to     := f3;
    guard  := A > 1;
    action := A' = -1 + A;
  };
  transition t2 := {
    from   := f3;
    to     := f3;
    guard  := 1 >= A;
    action := A' = -1 + A;
  };
}
strategy dumb {
  Region init := { state = f300 };
}
