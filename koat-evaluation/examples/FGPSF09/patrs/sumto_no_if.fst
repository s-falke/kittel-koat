model main {
  var A, B;
  states sumto, end, start;
  transition t0 := {
    from   := sumto;
    to     := end;
    guard  := A > B;
    action := ;
  };
  transition t1 := {
    from   := sumto;
    to     := sumto;
    guard  := B >= A;
    action := A' = A + 1;
  };
  transition t2 := {
    from   := start;
    to     := sumto;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = start };
}
