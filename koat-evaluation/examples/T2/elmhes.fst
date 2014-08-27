model main {
  var A, B, C, D, E, F, G, H, I, J, K;
  states f0, f12, f22, f29, f35, f37, f43, f48, f58, start;
  transition t0 := {
    from   := f0;
    to     := f12;
    guard  := A > B;
    action := C' = 0, D' = B, I' = ?, J' = ?, K' = ?;
  };
  transition t1 := {
    from   := f12;
    to     := f12;
    guard  := A >= E && I >= J;
    action := E' = E + 1, F' = J, G' = I, I' = ?, J' = ?, K' = ?;
  };
  transition t2 := {
    from   := f12;
    to     := f12;
    guard  := A >= E && I > K;
    action := C' = J, D' = E, E' = E + 1, F' = I, G' = K, I' = ?, J' = ?, K' = ?;
  };
  transition t3 := {
    from   := f22;
    to     := f22;
    guard  := A >= E;
    action := E' = E + 1, H' = J, I' = ?, J' = ?, K' = ?;
  };
  transition t4 := {
    from   := f29;
    to     := f29;
    guard  := A >= E;
    action := E' = E + 1, H' = J, I' = ?, J' = ?, K' = ?;
  };
  transition t5 := {
    from   := f35;
    to     := f37;
    guard  := 0 > C;
    action := I' = ?, J' = ?, K' = ?;
  };
  transition t6 := {
    from   := f35;
    to     := f37;
    guard  := C > 0;
    action := I' = ?, J' = ?, K' = ?;
  };
  transition t7 := {
    from   := f37;
    to     := f43;
    guard  := A >= D && 0 > I;
    action := H' = J, I' = ?, J' = ?, K' = ?;
  };
  transition t8 := {
    from   := f37;
    to     := f43;
    guard  := A >= D && I > 0;
    action := H' = J, I' = ?, J' = ?, K' = ?;
  };
  transition t9 := {
    from   := f43;
    to     := f43;
    guard  := A >= E;
    action := E' = E + 1, I' = ?, J' = ?, K' = ?;
  };
  transition t10 := {
    from   := f48;
    to     := f48;
    guard  := A >= E;
    action := E' = E + 1, I' = ?, J' = ?, K' = ?;
  };
  transition t11 := {
    from   := f37;
    to     := f37;
    guard  := A >= D;
    action := D' = D + 1, H' = 0, I' = ?, J' = ?, K' = ?;
  };
  transition t12 := {
    from   := f35;
    to     := f0;
    guard  := C = 0;
    action := B' = B + 1, C' = 0, I' = ?, J' = ?, K' = ?;
  };
  transition t13 := {
    from   := f48;
    to     := f37;
    guard  := E > A;
    action := D' = D + 1, I' = ?, J' = ?, K' = ?;
  };
  transition t14 := {
    from   := f43;
    to     := f48;
    guard  := E > A;
    action := I' = ?, J' = ?, K' = ?;
  };
  transition t15 := {
    from   := f37;
    to     := f0;
    guard  := D > A;
    action := B' = B + 1, I' = ?, J' = ?, K' = ?;
  };
  transition t16 := {
    from   := f29;
    to     := f35;
    guard  := E > A;
    action := I' = ?, J' = ?, K' = ?;
  };
  transition t17 := {
    from   := f22;
    to     := f29;
    guard  := E > A;
    action := I' = ?, J' = ?, K' = ?;
  };
  transition t18 := {
    from   := f12;
    to     := f35;
    guard  := E > A && B = D;
    action := D' = B, I' = ?, J' = ?, K' = ?;
  };
  transition t19 := {
    from   := f12;
    to     := f22;
    guard  := B > D && E > A;
    action := I' = ?, J' = ?, K' = ?;
  };
  transition t20 := {
    from   := f12;
    to     := f22;
    guard  := D > B && E > A;
    action := I' = ?, J' = ?, K' = ?;
  };
  transition t21 := {
    from   := f0;
    to     := f58;
    guard  := B >= A;
    action := I' = ?, J' = ?, K' = ?;
  };
  transition t22 := {
    from   := start;
    to     := f0;
    guard  := true;
    action := I' = ?, J' = ?, K' = ?;
  };
}
strategy dumb {
  Region init := { state = start };
}
