model main {
  var A, B, C, D, E, F, G, H;
  states f0, f9, f10, f16, f28;
  transition t0 := {
    from   := f0;
    to     := f9;
    guard  := true;
    action := A' = 0, B' = 0, C' = H, H' = ?;
  };
  transition t1 := {
    from   := f9;
    to     := f10;
    guard  := 0 > C;
    action := D' = C, H' = ?;
  };
  transition t2 := {
    from   := f9;
    to     := f10;
    guard  := C > 0;
    action := D' = C, H' = ?;
  };
  transition t3 := {
    from   := f10;
    to     := f9;
    guard  := 9 >= A;
    action := A' = A + 1, B' = A + 1, C' = H, H' = ?;
  };
  transition t4 := {
    from   := f16;
    to     := f28;
    guard  := A > 9;
    action := H' = ?;
  };
  transition t5 := {
    from   := f16;
    to     := f16;
    guard  := 9 >= A && 0 > H;
    action := A' = A + 1, E' = A, F' = H, G' = H, H' = ?;
  };
  transition t6 := {
    from   := f16;
    to     := f16;
    guard  := 9 >= A && H > 0;
    action := A' = A + 1, E' = A, F' = H, G' = H, H' = ?;
  };
  transition t7 := {
    from   := f16;
    to     := f28;
    guard  := 9 >= A;
    action := E' = A, F' = 0, G' = 0, H' = ?;
  };
  transition t8 := {
    from   := f10;
    to     := f16;
    guard  := A > 9;
    action := A' = 0, H' = ?;
  };
  transition t9 := {
    from   := f9;
    to     := f16;
    guard  := C = 0;
    action := A' = 0, C' = 0, D' = 0, H' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
