model main {
  var A, B, C, D;
  states start, stop, lbl81, lbl91, start0;
  transition t0 := {
    from   := start;
    to     := stop;
    guard  := 0 > A && B = C && D = A;
    action := ;
  };
  transition t1 := {
    from   := start;
    to     := stop;
    guard  := 0 > C && B = C && D = A;
    action := ;
  };
  transition t2 := {
    from   := start;
    to     := stop;
    guard  := A >= 0 && A + 2 >= C && C >= 0 && C + 2 >= A && B = C && D = A;
    action := ;
  };
  transition t3 := {
    from   := start;
    to     := lbl81;
    guard  := A >= 0 && C > A + 2 && B = C && D = A;
    action := D' = 1 + D;
  };
  transition t4 := {
    from   := start;
    to     := lbl91;
    guard  := A > C + 2 && C >= 0 && B = C && D = A;
    action := B' = 1 + B;
  };
  transition t5 := {
    from   := lbl81;
    to     := stop;
    guard  := C > 2 + A && A >= 0 && D + 2 = C && B = C;
    action := ;
  };
  transition t6 := {
    from   := lbl81;
    to     := lbl81;
    guard  := C > D + 2 && D > A && A >= 0 && C > D + 1 && B = C;
    action := D' = 1 + D;
  };
  transition t7 := {
    from   := lbl81;
    to     := lbl91;
    guard  := D > C + 2 && D > A && A >= 0 && C > D + 1 && B = C;
    action := B' = 1 + B;
  };
  transition t8 := {
    from   := lbl91;
    to     := stop;
    guard  := A > 2 + C && C >= 0 && B + 2 = A && D = A;
    action := ;
  };
  transition t9 := {
    from   := lbl91;
    to     := lbl81;
    guard  := B > A + 2 && A > B + 1 && B > C && C >= 0 && D = A;
    action := D' = 1 + D;
  };
  transition t10 := {
    from   := lbl91;
    to     := lbl91;
    guard  := A > B + 2 && A > B + 1 && B > C && C >= 0 && D = A;
    action := B' = 1 + B;
  };
  transition t11 := {
    from   := start0;
    to     := start;
    guard  := true;
    action := D' = A, B' = C;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
