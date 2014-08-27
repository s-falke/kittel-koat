model main {
  var A, B, C, D, E, F, G, H;
  states f0, f10, f18, f21, f32, f41;
  transition t0 := {
    from   := f0;
    to     := f10;
    guard  := true;
    action := A' = H, B' = 0, H' = ?;
  };
  transition t1 := {
    from   := f10;
    to     := f10;
    guard  := C > B;
    action := B' = B + 1, H' = ?;
  };
  transition t2 := {
    from   := f18;
    to     := f21;
    guard  := D > 1 + E;
    action := F' = 0, H' = ?;
  };
  transition t3 := {
    from   := f21;
    to     := f21;
    guard  := D > E + 1 + F;
    action := F' = F + 1, H' = ?;
  };
  transition t4 := {
    from   := f21;
    to     := f21;
    guard  := D > E + 1 + F;
    action := F' = F + 1, G' = H, H' = ?;
  };
  transition t5 := {
    from   := f32;
    to     := f32;
    guard  := D > 1 + E;
    action := E' = E + 1, H' = ?;
  };
  transition t6 := {
    from   := f32;
    to     := f41;
    guard  := E + 1 >= D;
    action := H' = ?;
  };
  transition t7 := {
    from   := f21;
    to     := f18;
    guard  := F + E + 1 >= D;
    action := E' = E + 1, H' = ?;
  };
  transition t8 := {
    from   := f18;
    to     := f32;
    guard  := E + 1 >= D;
    action := E' = 0, H' = ?;
  };
  transition t9 := {
    from   := f10;
    to     := f18;
    guard  := B >= C;
    action := D' = C, E' = 0, H' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
