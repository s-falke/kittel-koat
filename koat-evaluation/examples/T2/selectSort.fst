model main {
  var A, B, C, D, E, F, G, H, I;
  states f0, f10, f18, f22, f34, f43;
  transition t0 := {
    from   := f0;
    to     := f10;
    guard  := true;
    action := A' = I, B' = 0, I' = ?;
  };
  transition t1 := {
    from   := f10;
    to     := f10;
    guard  := C > B;
    action := B' = B + 1, I' = ?;
  };
  transition t2 := {
    from   := f18;
    to     := f22;
    guard  := D > 1 + E;
    action := F' = E, G' = E + 1, I' = ?;
  };
  transition t3 := {
    from   := f22;
    to     := f22;
    guard  := D > G;
    action := G' = G + 1, I' = ?;
  };
  transition t4 := {
    from   := f22;
    to     := f22;
    guard  := D > G;
    action := F' = G, G' = G + 1, I' = ?;
  };
  transition t5 := {
    from   := f34;
    to     := f34;
    guard  := D > 1 + E;
    action := E' = E + 1, I' = ?;
  };
  transition t6 := {
    from   := f34;
    to     := f43;
    guard  := E + 1 >= D;
    action := I' = ?;
  };
  transition t7 := {
    from   := f22;
    to     := f18;
    guard  := G >= D;
    action := E' = E + 1, H' = I, I' = ?;
  };
  transition t8 := {
    from   := f18;
    to     := f34;
    guard  := E + 1 >= D;
    action := E' = 0, I' = ?;
  };
  transition t9 := {
    from   := f10;
    to     := f18;
    guard  := B >= C;
    action := D' = C, E' = 0, I' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
