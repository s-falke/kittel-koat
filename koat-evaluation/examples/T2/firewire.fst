model main {
  var A, B, C, D, E, F, G, H, I, J, K;
  states f0, f9, f20, f32, f38;
  transition t0 := {
    from   := f0;
    to     := f9;
    guard  := J > 0;
    action := A' = 0, B' = 1, C' = 1, D' = 0, E' = 0, F' = J, J' = ?, K' = ?;
  };
  transition t1 := {
    from   := f9;
    to     := f20;
    guard  := A > 2 && C > 0 && D = E && F = 0;
    action := C' = C - 1, E' = D, F' = 0, G' = A - 2, H' = 1, I' = A - 2, J' = ?, K' = ?;
  };
  transition t2 := {
    from   := f9;
    to     := f20;
    guard  := 2 >= A && C > 0 && D = E && F = 0;
    action := C' = C - 1, E' = D, F' = 0, G' = A, H' = 0, I' = A, J' = ?, K' = ?;
  };
  transition t3 := {
    from   := f9;
    to     := f20;
    guard  := J > 0 && A > 2 && 0 >= C && D = E && F = 0;
    action := A' = 0, B' = B + 1, C' = B + 1, E' = D, F' = J, J' = ?, K' = ?;
  };
  transition t4 := {
    from   := f9;
    to     := f20;
    guard  := J > 0 && 2 >= A && 0 >= C && D = E && F = 0;
    action := A' = A + 1, B' = B + 1, C' = B + 1, E' = D, F' = J, J' = ?, K' = ?;
  };
  transition t5 := {
    from   := f9;
    to     := f20;
    guard  := 0 > F && D = E;
    action := E' = D, F' = F - 1, H' = J, I' = K, J' = ?, K' = ?;
  };
  transition t6 := {
    from   := f9;
    to     := f20;
    guard  := F > 0 && D = E;
    action := E' = D, F' = F - 1, H' = J, I' = K, J' = ?, K' = ?;
  };
  transition t7 := {
    from   := f20;
    to     := f32;
    guard  := I = 0;
    action := D' = 0, I' = 0, J' = ?, K' = ?;
  };
  transition t8 := {
    from   := f20;
    to     := f32;
    guard  := 0 > I;
    action := D' = 1, J' = ?, K' = ?;
  };
  transition t9 := {
    from   := f20;
    to     := f32;
    guard  := I > 0;
    action := D' = 1, J' = ?, K' = ?;
  };
  transition t10 := {
    from   := f32;
    to     := f9;
    guard  := H = 0;
    action := E' = 0, H' = 0, J' = ?, K' = ?;
  };
  transition t11 := {
    from   := f32;
    to     := f9;
    guard  := 0 > H;
    action := E' = 1, J' = ?, K' = ?;
  };
  transition t12 := {
    from   := f32;
    to     := f9;
    guard  := H > 0;
    action := E' = 1, J' = ?, K' = ?;
  };
  transition t13 := {
    from   := f9;
    to     := f38;
    guard  := E > D;
    action := J' = ?, K' = ?;
  };
  transition t14 := {
    from   := f9;
    to     := f38;
    guard  := D > E;
    action := J' = ?, K' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
