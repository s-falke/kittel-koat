model main {
  var A, B, C, D, E, F, G, H, I, J;
  states start, stop, lbl71, lbl81, start0;
  transition t0 := {
    from   := start;
    to     := stop;
    guard  := A > 0 && B > C && D = B && E = F && G = C && H = I && J = A;
    action := E' = 1;
  };
  transition t1 := {
    from   := start;
    to     := lbl71;
    guard  := A > 0 && C >= B && D = B && E = F && G = C && H = I && J = A;
    action := E' = 1, D' = 1 + D;
  };
  transition t2 := {
    from   := start;
    to     := stop;
    guard  := B > C && 0 >= A && D = B && E = F && G = C && H = I && J = A;
    action := E' = -1;
  };
  transition t3 := {
    from   := start;
    to     := lbl81;
    guard  := C >= B && 0 >= A && D = B && E = F && G = C && H = I && J = A;
    action := E' = -1, D' = 1 + D;
  };
  transition t4 := {
    from   := lbl71;
    to     := stop;
    guard  := C >= B && A > 0 && D = C + 1 && E = 1 && J = A && H = I && G = C;
    action := ;
  };
  transition t5 := {
    from   := lbl71;
    to     := lbl71;
    guard  := A > 0 && C >= D && D > B && C + 1 >= D && E = 1 && J = A && H = I && G = C;
    action := D' = E + D;
  };
  transition t6 := {
    from   := lbl71;
    to     := lbl81;
    guard  := C >= D && 0 >= A && D > B && C + 1 >= D && A > 0 && E = 1 && J = A && H = I && G = C;
    action := D' = D - E;
  };
  transition t7 := {
    from   := lbl81;
    to     := stop;
    guard  := 0 >= A && C >= B && D = C + 1 && E + 1 = 0 && J = A && H = I && G = C;
    action := ;
  };
  transition t8 := {
    from   := lbl81;
    to     := lbl71;
    guard  := A > 0 && C >= D && 0 >= A && D > B && C + 1 >= D && E + 1 = 0 && J = A && H = I && G = C;
    action := D' = E + D;
  };
  transition t9 := {
    from   := lbl81;
    to     := lbl81;
    guard  := C >= D && 0 >= A && D > B && C + 1 >= D && E + 1 = 0 && J = A && H = I && G = C;
    action := D' = D - E;
  };
  transition t10 := {
    from   := start0;
    to     := start;
    guard  := true;
    action := J' = A, H' = I, G' = C, E' = F, D' = B;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
