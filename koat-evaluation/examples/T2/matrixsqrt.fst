model main {
  var A, B, C, D, E, F, G, H, I;
  states f0, f12, f15, f23, f26, f30, f52;
  transition t0 := {
    from   := f0;
    to     := f12;
    guard  := true;
    action := A' = 2, B' = H, C' = I, D' = 0, H' = ?, I' = ?;
  };
  transition t1 := {
    from   := f12;
    to     := f15;
    guard  := A > D;
    action := E' = 0, H' = ?, I' = ?;
  };
  transition t2 := {
    from   := f15;
    to     := f15;
    guard  := A > E;
    action := E' = E + 1, H' = ?, I' = ?;
  };
  transition t3 := {
    from   := f23;
    to     := f26;
    guard  := A > D;
    action := E' = 0, H' = ?, I' = ?;
  };
  transition t4 := {
    from   := f26;
    to     := f30;
    guard  := A > E;
    action := F' = 0, H' = ?, I' = ?;
  };
  transition t5 := {
    from   := f30;
    to     := f30;
    guard  := A > F;
    action := F' = F + 1, H' = ?, I' = ?;
  };
  transition t6 := {
    from   := f30;
    to     := f26;
    guard  := F >= A;
    action := E' = E + 1, H' = ?, I' = ?;
  };
  transition t7 := {
    from   := f26;
    to     := f23;
    guard  := E >= A;
    action := D' = D + 1, H' = ?, I' = ?;
  };
  transition t8 := {
    from   := f23;
    to     := f52;
    guard  := D >= A;
    action := G' = 0, H' = ?, I' = ?;
  };
  transition t9 := {
    from   := f23;
    to     := f52;
    guard  := D >= A && 49 >= H;
    action := G' = 1, H' = ?, I' = ?;
  };
  transition t10 := {
    from   := f23;
    to     := f52;
    guard  := D >= A;
    action := G' = 1, H' = ?, I' = ?;
  };
  transition t11 := {
    from   := f23;
    to     := f52;
    guard  := D >= A && 42 >= H;
    action := G' = 1, H' = ?, I' = ?;
  };
  transition t12 := {
    from   := f23;
    to     := f52;
    guard  := D >= A && 21 >= H;
    action := G' = 1, H' = ?, I' = ?;
  };
  transition t13 := {
    from   := f23;
    to     := f52;
    guard  := D >= A && 18 >= H;
    action := G' = 1, H' = ?, I' = ?;
  };
  transition t14 := {
    from   := f15;
    to     := f12;
    guard  := E >= A;
    action := D' = D + 1, H' = ?, I' = ?;
  };
  transition t15 := {
    from   := f12;
    to     := f23;
    guard  := D >= A;
    action := D' = 0, H' = ?, I' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
