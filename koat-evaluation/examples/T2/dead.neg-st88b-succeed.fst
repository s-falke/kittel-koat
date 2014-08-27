model main {
  var A, B, C, D, E;
  states f11, f14, f26, f27, f29, f32, f20, f0;
  transition t0 := {
    from   := f11;
    to     := f14;
    guard  := A > 5;
    action := D' = ?, E' = ?;
  };
  transition t1 := {
    from   := f11;
    to     := f14;
    guard  := 5 >= A && 0 >= B;
    action := D' = ?, E' = ?;
  };
  transition t2 := {
    from   := f14;
    to     := f11;
    guard  := A > 5;
    action := A' = A + 1, B' = D, D' = ?, E' = ?;
  };
  transition t3 := {
    from   := f26;
    to     := f27;
    guard  := true;
    action := D' = ?, E' = ?;
  };
  transition t4 := {
    from   := f27;
    to     := f27;
    guard  := true;
    action := D' = ?, E' = ?;
  };
  transition t5 := {
    from   := f29;
    to     := f32;
    guard  := true;
    action := D' = ?, E' = ?;
  };
  transition t6 := {
    from   := f20;
    to     := f20;
    guard  := A > 2;
    action := A' = A - 1, D' = ?, E' = ?;
  };
  transition t7 := {
    from   := f20;
    to     := f11;
    guard  := 2 >= A;
    action := B' = D, D' = ?, E' = ?;
  };
  transition t8 := {
    from   := f14;
    to     := f11;
    guard  := 5 >= A;
    action := A' = A + 1, B' = D, D' = ?, E' = ?;
  };
  transition t9 := {
    from   := f11;
    to     := f20;
    guard  := 5 >= A && B > 0;
    action := D' = ?, E' = ?;
  };
  transition t10 := {
    from   := f0;
    to     := f11;
    guard  := true;
    action := A' = D, C' = D, B' = E, D' = ?, E' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
