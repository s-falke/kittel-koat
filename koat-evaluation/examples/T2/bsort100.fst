model main {
  var A, B, C, D, E, F, G, H;
  states f0, f8, f18, f22, f33, f40;
  transition t0 := {
    from   := f0;
    to     := f8;
    guard  := true;
    action := A' = -1, B' = -1, C' = 1, H' = ?;
  };
  transition t1 := {
    from   := f8;
    to     := f8;
    guard  := 100 >= C;
    action := C' = C + 1, H' = ?;
  };
  transition t2 := {
    from   := f18;
    to     := f22;
    guard  := 99 >= D;
    action := E' = 1, F' = 1, H' = ?;
  };
  transition t3 := {
    from   := f22;
    to     := f33;
    guard  := F > 99;
    action := H' = ?;
  };
  transition t4 := {
    from   := f22;
    to     := f33;
    guard  := 99 >= F && F + D > 100;
    action := H' = ?;
  };
  transition t5 := {
    from   := f22;
    to     := f22;
    guard  := 99 >= F && 100 >= D + F;
    action := F' = F + 1, H' = ?;
  };
  transition t6 := {
    from   := f22;
    to     := f22;
    guard  := 99 >= F && 100 >= D + F;
    action := E' = 0, F' = F + 1, G' = H, H' = ?;
  };
  transition t7 := {
    from   := f33;
    to     := f18;
    guard  := E = 0;
    action := E' = 0, D' = D + 1, H' = ?;
  };
  transition t8 := {
    from   := f18;
    to     := f40;
    guard  := D > 99;
    action := H' = ?;
  };
  transition t9 := {
    from   := f33;
    to     := f40;
    guard  := 0 > E;
    action := H' = ?;
  };
  transition t10 := {
    from   := f33;
    to     := f40;
    guard  := E > 0;
    action := H' = ?;
  };
  transition t11 := {
    from   := f8;
    to     := f18;
    guard  := C > 100;
    action := E' = 0, D' = 1, H' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
