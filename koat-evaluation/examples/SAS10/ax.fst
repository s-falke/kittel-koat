model main {
  var A, B, C, D, E, F;
  states start, lbl71, stop, cut, start0;
  transition t0 := {
    from   := start;
    to     := lbl71;
    guard  := A > 1 && B = A && C = D && E = F;
    action := E' = 0, C' = 1;
  };
  transition t1 := {
    from   := start;
    to     := stop;
    guard  := 1 >= A && B = A && C = D && E = F;
    action := E' = 1, C' = 0;
  };
  transition t2 := {
    from   := lbl71;
    to     := lbl71;
    guard  := A > C + 1 && A > C && A > E + 1 && C > 0 && E >= 0 && B = A;
    action := C' = 1 + C;
  };
  transition t3 := {
    from   := lbl71;
    to     := cut;
    guard  := A > E + 2 && A > E + 1 && A > 1 && E >= 0 && C + 1 = A && B = A;
    action := E' = 1 + E;
  };
  transition t4 := {
    from   := lbl71;
    to     := stop;
    guard  := A > 1 && E + 2 = A && C + 1 = A && B = A;
    action := E' = 1 + E;
  };
  transition t5 := {
    from   := cut;
    to     := lbl71;
    guard  := A > 1 && A > 1 + E && E > 0 && C + 1 = A && B = A;
    action := C' = 1;
  };
  transition t6 := {
    from   := cut;
    to     := cut;
    guard  := 1 >= A && A > E + 2 && A > 1 + E && E > 0 && C + 1 = A && B = A;
    action := E' = 1 + E, C' = 0;
  };
  transition t7 := {
    from   := cut;
    to     := stop;
    guard  := 1 >= A && A > 2 && C + 1 = A && E + 2 = A && B = A;
    action := E' = 1 + E, C' = 0;
  };
  transition t8 := {
    from   := start0;
    to     := start;
    guard  := true;
    action := E' = F, C' = D, B' = A;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
