model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P;
  states f0, f11, f23, f26, f36, f32;
  transition t0 := {
    from   := f0;
    to     := f11;
    guard  := true;
    action := A' = 100, B' = O, C' = 1, O' = ?, P' = ?;
  };
  transition t1 := {
    from   := f0;
    to     := f11;
    guard  := true;
    action := A' = 100, B' = O, C' = 0, O' = ?, P' = ?;
  };
  transition t2 := {
    from   := f11;
    to     := f23;
    guard  := C = 1;
    action := C' = 1, D' = 1, E' = 1, F' = 100, G' = O, H' = 1, O' = ?, P' = ?;
  };
  transition t3 := {
    from   := f11;
    to     := f23;
    guard  := C = 1;
    action := C' = 1, D' = 1, E' = 1, F' = 100, G' = O, H' = 0, O' = ?, P' = ?;
  };
  transition t4 := {
    from   := f23;
    to     := f26;
    guard  := 0 >= H;
    action := E' = H, I' = 100, O' = ?, P' = ?;
  };
  transition t5 := {
    from   := f23;
    to     := f26;
    guard  := H > 1;
    action := E' = H, I' = 100, O' = ?, P' = ?;
  };
  transition t6 := {
    from   := f11;
    to     := f36;
    guard  := 0 >= C;
    action := D' = C, E' = C, J' = 100, O' = ?, P' = ?;
  };
  transition t7 := {
    from   := f11;
    to     := f36;
    guard  := C > 1;
    action := D' = C, E' = C, J' = 100, O' = ?, P' = ?;
  };
  transition t8 := {
    from   := f23;
    to     := f32;
    guard  := 0 > 1 + O && H = 1;
    action := E' = 1, H' = 1, K' = O, L' = P, O' = ?, P' = ?;
  };
  transition t9 := {
    from   := f23;
    to     := f32;
    guard  := O >= 0 && H = 1;
    action := E' = 1, H' = 1, K' = O, L' = P, O' = ?, P' = ?;
  };
  transition t10 := {
    from   := f23;
    to     := f32;
    guard  := H = 1;
    action := E' = 1, H' = 1, K' = -1, M' = 100, N' = O, O' = ?, P' = ?;
  };
  transition t11 := {
    from   := f36;
    to     := f32;
    guard  := 0 > O;
    action := O' = ?, P' = ?;
  };
  transition t12 := {
    from   := f36;
    to     := f32;
    guard  := true;
    action := O' = ?, P' = ?;
  };
  transition t13 := {
    from   := f26;
    to     := f32;
    guard  := 0 > O;
    action := O' = ?, P' = ?;
  };
  transition t14 := {
    from   := f26;
    to     := f32;
    guard  := true;
    action := O' = ?, P' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
