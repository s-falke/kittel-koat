model main {
  var A, B;
  states div, end, start;
  transition t0 := {
    from   := div;
    to     := end;
    guard  := 0 >= A;
    action := ;
  };
  transition t1 := {
    from   := div;
    to     := end;
    guard  := A >= B;
    action := ;
  };
  transition t2 := {
    from   := div;
    to     := div;
    guard  := B > A && A > 0;
    action := B' = B - A;
  };
  transition t3 := {
    from   := start;
    to     := div;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = start };
}
