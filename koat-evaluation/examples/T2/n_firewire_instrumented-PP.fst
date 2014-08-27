model main {
  var A, B, C, D, E, F, G, H, I, J;
  states f38, f11, f0, f34, f53;
  transition t0 := {
    from   := f38;
    to     := f11;
    guard  := A = B;
    action := B' = A, H' = ?, I' = ?, J' = ?;
  };
  transition t1 := {
    from   := f0;
    to     := f11;
    guard  := H >= 0 && I > 0;
    action := C' = H, D' = 0, E' = 1, F' = I, G' = I, A' = 0, B' = 0, H' = ?, I' = ?, J' = ?;
  };
  transition t2 := {
    from   := f11;
    to     := f34;
    guard  := H >= 0 && 1 >= H && G > 0 && 0 >= C && 0 >= D;
    action := D' = D + 1, A' = 0, B' = H, H' = ?, I' = ?, J' = ?;
  };
  transition t3 := {
    from   := f11;
    to     := f34;
    guard  := H >= 0 && 1 >= H && G > 0 && 0 >= C && D = 1;
    action := D' = D + 1, A' = 1, B' = H, H' = ?, I' = ?, J' = ?;
  };
  transition t4 := {
    from   := f11;
    to     := f34;
    guard  := H >= 0 && 1 >= H && G > 0 && 0 >= C && D = 2;
    action := D' = D + 1, A' = 0, B' = H, H' = ?, I' = ?, J' = ?;
  };
  transition t5 := {
    from   := f11;
    to     := f34;
    guard  := J >= 0 && 1 >= J && I >= 0 && 1 >= I && H >= 0 && G > 0 && 0 >= C && D > 2;
    action := C' = H, D' = 0, E' = E + 1, A' = I, B' = J, H' = ?, I' = ?, J' = ?;
  };
  transition t6 := {
    from   := f11;
    to     := f34;
    guard  := I >= 0 && 1 >= I && H >= 0 && 1 >= H && C > 0 && G > 0;
    action := C' = C - 1, A' = H, B' = I, H' = ?, I' = ?, J' = ?;
  };
  transition t7 := {
    from   := f34;
    to     := f38;
    guard  := 0 >= B && 0 >= C && 0 >= D;
    action := D' = D + 1, H' = ?, I' = ?, J' = ?;
  };
  transition t8 := {
    from   := f34;
    to     := f38;
    guard  := B > 0 && 0 >= C && D = 1;
    action := D' = D + 1, H' = ?, I' = ?, J' = ?;
  };
  transition t9 := {
    from   := f34;
    to     := f38;
    guard  := 0 >= B && 0 >= C && D = 2;
    action := D' = D + 1, H' = ?, I' = ?, J' = ?;
  };
  transition t10 := {
    from   := f34;
    to     := f38;
    guard  := H >= 0 && 0 >= C && D > 2;
    action := C' = H, D' = 0, E' = E + 1, H' = ?, I' = ?, J' = ?;
  };
  transition t11 := {
    from   := f34;
    to     := f38;
    guard  := C > 0;
    action := C' = C - 1, H' = ?, I' = ?, J' = ?;
  };
  transition t12 := {
    from   := f38;
    to     := f11;
    guard  := B > A;
    action := G' = G - 1, H' = ?, I' = ?, J' = ?;
  };
  transition t13 := {
    from   := f38;
    to     := f11;
    guard  := A > B;
    action := G' = G - 1, H' = ?, I' = ?, J' = ?;
  };
  transition t14 := {
    from   := f11;
    to     := f53;
    guard  := 0 >= G;
    action := H' = ?, I' = ?, J' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
