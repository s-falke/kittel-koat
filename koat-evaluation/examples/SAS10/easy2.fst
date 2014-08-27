model main {
  var A, B, C, D, E, F;
  states start, stop, lbl71, start0;
  transition t0 := {
    from   := start;
    to     := stop;
    guard  := 0 >= A && B = A && C = D && E = F;
    action := ;
  };
  transition t1 := {
    from   := start;
    to     := lbl71;
    guard  := A > 0 && B = A && C = D && E = F;
    action := E' = 1 + E, C' = C - 1, B' = B - 1;
  };
  transition t2 := {
    from   := lbl71;
    to     := stop;
    guard  := D > C && B = 0 && E + C = F + D && A + C = D;
    action := ;
  };
  transition t3 := {
    from   := lbl71;
    to     := lbl71;
    guard  := A + C > D && D > C && A + C >= D && E + C = D + F && B + D = A + C;
    action := E' = 1 + E, C' = C - 1, B' = B - 1;
  };
  transition t4 := {
    from   := start0;
    to     := start;
    guard  := true;
    action := E' = F, C' = D, B' = A;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
