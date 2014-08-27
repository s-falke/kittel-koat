model main {
  var A, B, C, D, E, F, G, H, I, J;
  states f4, f14, f13, f400, f2, f23, f33, f6, f43, f53, f61, f63, f71, f73;
  transition t0 := {
    from   := f4;
    to     := f14;
    guard  := 0 >= A;
    action := G' = ?, H' = ?, I' = ?, J' = ?;
  };
  transition t1 := {
    from   := f13;
    to     := f4;
    guard  := true;
    action := G' = ?, H' = ?, I' = ?, J' = ?;
  };
  transition t2 := {
    from   := f13;
    to     := f400;
    guard  := B > A;
    action := G' = ?, H' = ?, I' = ?, J' = ?;
  };
  transition t3 := {
    from   := f2;
    to     := f23;
    guard  := G > 0 && H > 0 && 0 >= I;
    action := C' = H, D' = J, B' = I, A' = G, E' = 1, G' = ?, H' = ?, I' = ?, J' = ?;
  };
  transition t4 := {
    from   := f2;
    to     := f23;
    guard  := G > 0 && H > 0 && I > 0;
    action := C' = H, D' = J, B' = I, A' = G, E' = 1, F' = 0, G' = ?, H' = ?, I' = ?, J' = ?;
  };
  transition t5 := {
    from   := f23;
    to     := f4;
    guard  := E >= C;
    action := G' = ?, H' = ?, I' = ?, J' = ?;
  };
  transition t6 := {
    from   := f23;
    to     := f4;
    guard  := C > E;
    action := F' = 1, G' = ?, H' = ?, I' = ?, J' = ?;
  };
  transition t7 := {
    from   := f4;
    to     := f33;
    guard  := H >= C && 0 >= B && A > 0;
    action := C' = H, D' = J, A' = A - 1, E' = C, G' = ?, H' = ?, I' = ?, J' = ?;
  };
  transition t8 := {
    from   := f4;
    to     := f33;
    guard  := H >= C && B > 0 && A > 0;
    action := C' = H, D' = J, A' = A - 1, E' = C, F' = 0, G' = ?, H' = ?, I' = ?, J' = ?;
  };
  transition t9 := {
    from   := f33;
    to     := f6;
    guard  := E >= C;
    action := G' = ?, H' = ?, I' = ?, J' = ?;
  };
  transition t10 := {
    from   := f33;
    to     := f6;
    guard  := C > E;
    action := F' = 1, G' = ?, H' = ?, I' = ?, J' = ?;
  };
  transition t11 := {
    from   := f6;
    to     := f43;
    guard  := H >= C && 0 >= C && 0 >= B;
    action := C' = H, D' = J, E' = C, G' = ?, H' = ?, I' = ?, J' = ?;
  };
  transition t12 := {
    from   := f6;
    to     := f43;
    guard  := H >= C && 0 >= C && B > 0;
    action := C' = H, D' = J, E' = C, F' = 0, G' = ?, H' = ?, I' = ?, J' = ?;
  };
  transition t13 := {
    from   := f43;
    to     := f6;
    guard  := C = E;
    action := E' = C, G' = ?, H' = ?, I' = ?, J' = ?;
  };
  transition t14 := {
    from   := f43;
    to     := f6;
    guard  := C > E;
    action := F' = 1, G' = ?, H' = ?, I' = ?, J' = ?;
  };
  transition t15 := {
    from   := f6;
    to     := f53;
    guard  := H + 1 >= C && C > 0 && 0 >= B;
    action := C' = H, D' = J, E' = C - 1, G' = ?, H' = ?, I' = ?, J' = ?;
  };
  transition t16 := {
    from   := f6;
    to     := f53;
    guard  := H + 1 >= C && C > 0 && B > 0;
    action := C' = H, D' = J, E' = C - 1, F' = 0, G' = ?, H' = ?, I' = ?, J' = ?;
  };
  transition t17 := {
    from   := f53;
    to     := f61;
    guard  := E >= C;
    action := B' = A, E' = C, G' = ?, H' = ?, I' = ?, J' = ?;
  };
  transition t18 := {
    from   := f53;
    to     := f61;
    guard  := C > E;
    action := B' = A, E' = C, F' = 1, G' = ?, H' = ?, I' = ?, J' = ?;
  };
  transition t19 := {
    from   := f61;
    to     := f63;
    guard  := 0 >= B && H >= E;
    action := C' = H, D' = J, G' = ?, H' = ?, I' = ?, J' = ?;
  };
  transition t20 := {
    from   := f61;
    to     := f63;
    guard  := B > 0 && H >= E;
    action := C' = H, D' = J, F' = 0, G' = ?, H' = ?, I' = ?, J' = ?;
  };
  transition t21 := {
    from   := f63;
    to     := f71;
    guard  := E >= C;
    action := D' = D + 1, E' = C, G' = ?, H' = ?, I' = ?, J' = ?;
  };
  transition t22 := {
    from   := f63;
    to     := f71;
    guard  := C > E;
    action := D' = D + 1, E' = C, F' = 1, G' = ?, H' = ?, I' = ?, J' = ?;
  };
  transition t23 := {
    from   := f71;
    to     := f73;
    guard  := 0 >= B && H >= E;
    action := C' = H, D' = J, G' = ?, H' = ?, I' = ?, J' = ?;
  };
  transition t24 := {
    from   := f71;
    to     := f73;
    guard  := B > 0 && H >= E;
    action := C' = H, D' = J, F' = 0, G' = ?, H' = ?, I' = ?, J' = ?;
  };
  transition t25 := {
    from   := f73;
    to     := f13;
    guard  := E >= C;
    action := G' = ?, H' = ?, I' = ?, J' = ?;
  };
  transition t26 := {
    from   := f73;
    to     := f13;
    guard  := C > E;
    action := F' = 1, G' = ?, H' = ?, I' = ?, J' = ?;
  };
}
strategy dumb {
  Region init := { state = f2 };
}
