model main {
  var A, B, C, D, E;
  states start, stop1, cont1, stop2, a, b, stop3, start0;
  transition t0 := {
    from   := start;
    to     := stop1;
    guard  := A >= 0 && B >= 0 && C >= 0 && D = 0;
    action := E' = ?;
  };
  transition t1 := {
    from   := start;
    to     := cont1;
    guard  := D > 0 && A >= 0 && B >= 0 && C >= 0 && D >= 0 && A >= D;
    action := E' = ?;
  };
  transition t2 := {
    from   := cont1;
    to     := stop2;
    guard  := D > 0 && B >= 0 && A >= D && C = 0;
    action := D' = D - 1, C' = 1, E' = ?;
  };
  transition t3 := {
    from   := cont1;
    to     := a;
    guard  := C > 0 && D > 0 && C >= 0 && B >= 0 && A >= D;
    action := C' = C - 1, E' = ?;
  };
  transition t4 := {
    from   := a;
    to     := b;
    guard  := A >= D && B >= 0 && C >= 0 && D > 0;
    action := D' = D - 1, C' = E, E' = ?;
  };
  transition t5 := {
    from   := b;
    to     := start;
    guard  := C >= 0 && D >= 0 && B >= 0 && A > D;
    action := E' = ?;
  };
  transition t6 := {
    from   := b;
    to     := stop3;
    guard  := 0 > C && D >= 0 && B >= 0 && A > D;
    action := E' = ?;
  };
  transition t7 := {
    from   := start0;
    to     := start;
    guard  := A >= 0 && B >= 0;
    action := D' = A, C' = B, E' = ?;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
