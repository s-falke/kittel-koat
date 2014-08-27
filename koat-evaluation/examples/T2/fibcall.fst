model main {
  var A, B, C, D, E, F, G, H, I;
  states f0, f7, f19;
  transition t0 := {
    from   := f0;
    to     := f7;
    guard  := true;
    action := A' = 30, B' = 30, C' = 1, D' = 0, E' = 2;
  };
  transition t1 := {
    from   := f7;
    to     := f7;
    guard  := B >= E;
    action := C' = C + D, D' = C, E' = E + 1, F' = C;
  };
  transition t2 := {
    from   := f7;
    to     := f19;
    guard  := E > B;
    action := G' = C, H' = C, I' = C;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
