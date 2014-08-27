model main {
  var A, B, C, D;
  states start, stop, lbl32, start0;
  transition t0 := {
    from   := start;
    to     := stop;
    guard  := 1 >= A && B = C && D = A;
    action := ;
  };
  transition t1 := {
    from   := start;
    to     := lbl32;
    guard  := A > 1 && B = C && D = A;
    action := D' = D - 1;
  };
  transition t2 := {
    from   := lbl32;
    to     := stop;
    guard  := A > 1 && D = 1 && B = C;
    action := ;
  };
  transition t3 := {
    from   := lbl32;
    to     := lbl32;
    guard  := D > 1 && D > 0 && A > D && B = C;
    action := D' = D - 1;
  };
  transition t4 := {
    from   := start0;
    to     := start;
    guard  := true;
    action := D' = A, B' = C;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
