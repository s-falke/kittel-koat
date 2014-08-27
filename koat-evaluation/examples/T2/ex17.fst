model main {
  var A, B, C, D, E, F, G, H, I;
  states f0, f5, f17, f32, f13;
  transition t0 := {
    from   := f0;
    to     := f5;
    guard  := true;
    action := A' = 0, H' = ?, I' = ?;
  };
  transition t1 := {
    from   := f5;
    to     := f5;
    guard  := 99 >= A;
    action := A' = A + 1, H' = ?, I' = ?;
  };
  transition t2 := {
    from   := f17;
    to     := f17;
    guard  := true;
    action := H' = ?, I' = ?;
  };
  transition t3 := {
    from   := f17;
    to     := f17;
    guard  := 0 > H;
    action := B' = B + 1, H' = ?, I' = ?;
  };
  transition t4 := {
    from   := f17;
    to     := f17;
    guard  := true;
    action := B' = B + 1, H' = ?, I' = ?;
  };
  transition t5 := {
    from   := f32;
    to     := f32;
    guard  := true;
    action := H' = ?, I' = ?;
  };
  transition t6 := {
    from   := f32;
    to     := f32;
    guard  := 0 > H;
    action := C' = C + 1, H' = ?, I' = ?;
  };
  transition t7 := {
    from   := f32;
    to     := f32;
    guard  := true;
    action := C' = C + 1, H' = ?, I' = ?;
  };
  transition t8 := {
    from   := f32;
    to     := f13;
    guard  := true;
    action := D' = C, E' = C, H' = ?, I' = ?;
  };
  transition t9 := {
    from   := f17;
    to     := f32;
    guard  := 0 > I;
    action := D' = B, F' = B, G' = H, C' = B, H' = ?, I' = ?;
  };
  transition t10 := {
    from   := f17;
    to     := f32;
    guard  := true;
    action := D' = B, F' = B, G' = H, C' = B, H' = ?, I' = ?;
  };
  transition t11 := {
    from   := f17;
    to     := f13;
    guard  := true;
    action := D' = B, F' = B, G' = H, H' = ?, I' = ?;
  };
  transition t12 := {
    from   := f5;
    to     := f13;
    guard  := A > 99;
    action := D' = A - 2, H' = ?, I' = ?;
  };
  transition t13 := {
    from   := f5;
    to     := f17;
    guard  := 0 > A && A > 99;
    action := D' = A - 2, B' = A - 2, H' = ?, I' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
