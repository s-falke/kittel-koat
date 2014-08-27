model main {
  var A, B, C, D, E;
  states start, lbl51, stop, cut, start0;
  transition t0 := {
    from   := start;
    to     := lbl51;
    guard  := A = B && C = D;
    action := A' = E, C' = 0, E' = ?;
  };
  transition t1 := {
    from   := lbl51;
    to     := stop;
    guard  := C >= A && C >= 0 && 9 >= C;
    action := E' = ?;
  };
  transition t2 := {
    from   := lbl51;
    to     := stop;
    guard  := A > C + 2 && C >= 0 && 9 >= C;
    action := E' = ?;
  };
  transition t3 := {
    from   := lbl51;
    to     := cut;
    guard  := A > C && C + 2 >= A && 9 >= A && C >= 0 && 9 >= C;
    action := E' = ?;
  };
  transition t4 := {
    from   := lbl51;
    to     := stop;
    guard  := A > 9 && A > C && C + 2 >= A && C >= 0 && 9 >= C;
    action := E' = ?;
  };
  transition t5 := {
    from   := cut;
    to     := lbl51;
    guard  := C + 2 >= A && 9 >= A && C >= 0 && A > C;
    action := A' = E, C' = A, E' = ?;
  };
  transition t6 := {
    from   := start0;
    to     := start;
    guard  := true;
    action := A' = B, C' = D, E' = ?;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
