model main {
  var A, B, C, D, E, F, G, H, I, J, K;
  states f0, f17, f27, f37, f45, f55, f65, f75, f83, f93;
  transition t0 := {
    from   := f0;
    to     := f17;
    guard  := true;
    action := A' = 0, B' = J, C' = K, D' = 0, J' = ?, K' = ?;
  };
  transition t1 := {
    from   := f17;
    to     := f17;
    guard  := 49 >= D;
    action := D' = D + 1, J' = ?, K' = ?;
  };
  transition t2 := {
    from   := f27;
    to     := f27;
    guard  := 49 >= E;
    action := E' = E + 1, J' = ?, K' = ?;
  };
  transition t3 := {
    from   := f37;
    to     := f37;
    guard  := 49 >= F;
    action := F' = F + 1, J' = ?, K' = ?;
  };
  transition t4 := {
    from   := f45;
    to     := f45;
    guard  := 49 >= A;
    action := A' = A + 1, J' = ?, K' = ?;
  };
  transition t5 := {
    from   := f55;
    to     := f55;
    guard  := 49 >= G;
    action := G' = G + 1, J' = ?, K' = ?;
  };
  transition t6 := {
    from   := f65;
    to     := f65;
    guard  := 49 >= H;
    action := H' = H + 1, J' = ?, K' = ?;
  };
  transition t7 := {
    from   := f75;
    to     := f75;
    guard  := 49 >= I;
    action := I' = I + 1, J' = ?, K' = ?;
  };
  transition t8 := {
    from   := f83;
    to     := f83;
    guard  := 49 >= A;
    action := A' = A + 1, J' = ?, K' = ?;
  };
  transition t9 := {
    from   := f83;
    to     := f93;
    guard  := A > 49;
    action := J' = ?, K' = ?;
  };
  transition t10 := {
    from   := f75;
    to     := f83;
    guard  := I > 49;
    action := A' = 0, J' = ?, K' = ?;
  };
  transition t11 := {
    from   := f65;
    to     := f75;
    guard  := H > 49;
    action := I' = 0, J' = ?, K' = ?;
  };
  transition t12 := {
    from   := f55;
    to     := f65;
    guard  := G > 49;
    action := H' = 0, J' = ?, K' = ?;
  };
  transition t13 := {
    from   := f45;
    to     := f55;
    guard  := A > 49;
    action := G' = 0, J' = ?, K' = ?;
  };
  transition t14 := {
    from   := f37;
    to     := f45;
    guard  := F > 49;
    action := A' = 0, J' = ?, K' = ?;
  };
  transition t15 := {
    from   := f27;
    to     := f37;
    guard  := E > 49;
    action := F' = 0, J' = ?, K' = ?;
  };
  transition t16 := {
    from   := f17;
    to     := f27;
    guard  := D > 49;
    action := E' = 0, J' = ?, K' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
