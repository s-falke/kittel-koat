model main {
  var A, B, C, D, E, F, G, H, I, J, K, L;
  states f0, f17, f27, f37, f45, f55, f65, f75, f83, f93;
  transition t0 := {
    from   := f0;
    to     := f17;
    guard  := true;
    action := A' = 0, B' = K, C' = L, D' = 0, K' = ?, L' = ?;
  };
  transition t1 := {
    from   := f17;
    to     := f17;
    guard  := E > D;
    action := D' = D + 1, K' = ?, L' = ?;
  };
  transition t2 := {
    from   := f27;
    to     := f27;
    guard  := F >= 0;
    action := F' = F - 1, K' = ?, L' = ?;
  };
  transition t3 := {
    from   := f37;
    to     := f37;
    guard  := E > G;
    action := G' = G + 1, K' = ?, L' = ?;
  };
  transition t4 := {
    from   := f45;
    to     := f45;
    guard  := E > A;
    action := A' = A + 1, K' = ?, L' = ?;
  };
  transition t5 := {
    from   := f55;
    to     := f55;
    guard  := E > H;
    action := H' = H + 1, K' = ?, L' = ?;
  };
  transition t6 := {
    from   := f65;
    to     := f65;
    guard  := I >= 0;
    action := I' = I - 1, K' = ?, L' = ?;
  };
  transition t7 := {
    from   := f75;
    to     := f75;
    guard  := E > J;
    action := J' = J + 1, K' = ?, L' = ?;
  };
  transition t8 := {
    from   := f83;
    to     := f83;
    guard  := A >= 0;
    action := A' = A - 1, K' = ?, L' = ?;
  };
  transition t9 := {
    from   := f83;
    to     := f93;
    guard  := 0 > A;
    action := K' = ?, L' = ?;
  };
  transition t10 := {
    from   := f75;
    to     := f83;
    guard  := J >= E;
    action := A' = E - 1, K' = ?, L' = ?;
  };
  transition t11 := {
    from   := f65;
    to     := f75;
    guard  := 0 > I;
    action := J' = 0, K' = ?, L' = ?;
  };
  transition t12 := {
    from   := f55;
    to     := f65;
    guard  := H >= E;
    action := I' = E - 1, K' = ?, L' = ?;
  };
  transition t13 := {
    from   := f45;
    to     := f55;
    guard  := A >= E;
    action := H' = 0, K' = ?, L' = ?;
  };
  transition t14 := {
    from   := f37;
    to     := f45;
    guard  := G >= E;
    action := A' = 0, K' = ?, L' = ?;
  };
  transition t15 := {
    from   := f27;
    to     := f37;
    guard  := 0 > F;
    action := G' = 0, K' = ?, L' = ?;
  };
  transition t16 := {
    from   := f17;
    to     := f27;
    guard  := D >= E;
    action := F' = E - 1, K' = ?, L' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
