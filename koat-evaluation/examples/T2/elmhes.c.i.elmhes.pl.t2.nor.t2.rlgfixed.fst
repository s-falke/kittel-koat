model main {
  var A, B, C, D, E, F, G, H, I, J, K;
  states f2, f8, f19, f27, f34, f36, f43, f49, f1, start;
  transition t0 := {
    from   := f2;
    to     := f8;
    guard  := A > B;
    action := C' = 0, D' = B, I' = ?, J' = ?, K' = ?;
  };
  transition t1 := {
    from   := f8;
    to     := f8;
    guard  := A >= E && I >= J;
    action := E' = E + 1, F' = J, G' = I, I' = ?, J' = ?, K' = ?;
  };
  transition t2 := {
    from   := f8;
    to     := f8;
    guard  := A >= E && I > K;
    action := C' = J, D' = E, E' = E + 1, F' = I, G' = K, I' = ?, J' = ?, K' = ?;
  };
  transition t3 := {
    from   := f19;
    to     := f19;
    guard  := A >= E;
    action := E' = E + 1, H' = J, I' = ?, J' = ?, K' = ?;
  };
  transition t4 := {
    from   := f27;
    to     := f27;
    guard  := A >= E;
    action := E' = E + 1, H' = J, I' = ?, J' = ?, K' = ?;
  };
  transition t5 := {
    from   := f34;
    to     := f36;
    guard  := 0 > C;
    action := I' = ?, J' = ?, K' = ?;
  };
  transition t6 := {
    from   := f34;
    to     := f36;
    guard  := C > 0;
    action := I' = ?, J' = ?, K' = ?;
  };
  transition t7 := {
    from   := f36;
    to     := f43;
    guard  := A >= D && 0 > I;
    action := H' = J, I' = ?, J' = ?, K' = ?;
  };
  transition t8 := {
    from   := f36;
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
    from   := f49;
    to     := f49;
    guard  := A >= E;
    action := E' = E + 1, I' = ?, J' = ?, K' = ?;
  };
  transition t11 := {
    from   := f36;
    to     := f36;
    guard  := A >= D;
    action := D' = D + 1, H' = 0, I' = ?, J' = ?, K' = ?;
  };
  transition t12 := {
    from   := f34;
    to     := f2;
    guard  := C = 0;
    action := B' = B + 1, C' = 0, I' = ?, J' = ?, K' = ?;
  };
  transition t13 := {
    from   := f49;
    to     := f36;
    guard  := E > A;
    action := D' = D + 1, I' = ?, J' = ?, K' = ?;
  };
  transition t14 := {
    from   := f43;
    to     := f49;
    guard  := E > A;
    action := I' = ?, J' = ?, K' = ?;
  };
  transition t15 := {
    from   := f36;
    to     := f2;
    guard  := D > A;
    action := B' = B + 1, I' = ?, J' = ?, K' = ?;
  };
  transition t16 := {
    from   := f27;
    to     := f34;
    guard  := E > A;
    action := I' = ?, J' = ?, K' = ?;
  };
  transition t17 := {
    from   := f19;
    to     := f27;
    guard  := E > A;
    action := I' = ?, J' = ?, K' = ?;
  };
  transition t18 := {
    from   := f8;
    to     := f34;
    guard  := E > A && B = D;
    action := D' = B, I' = ?, J' = ?, K' = ?;
  };
  transition t19 := {
    from   := f8;
    to     := f19;
    guard  := B > D && E > A;
    action := I' = ?, J' = ?, K' = ?;
  };
  transition t20 := {
    from   := f8;
    to     := f19;
    guard  := D > B && E > A;
    action := I' = ?, J' = ?, K' = ?;
  };
  transition t21 := {
    from   := f2;
    to     := f1;
    guard  := B >= A;
    action := I' = ?, J' = ?, K' = ?;
  };
  transition t22 := {
    from   := start;
    to     := f2;
    guard  := true;
    action := I' = ?, J' = ?, K' = ?;
  };
}
strategy dumb {
  Region init := { state = start };
}
