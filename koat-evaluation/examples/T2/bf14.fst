model main {
  var A, B, C, D, E, F, G, H, I;
  states f0, f52, f60, f63, f74, f80, f84;
  transition t0 := {
    from   := f0;
    to     := f52;
    guard  := true;
    action := A' = 5, B' = 14, C' = 0, D' = 0, H' = ?, I' = ?;
  };
  transition t1 := {
    from   := f52;
    to     := f52;
    guard  := A > D && C = D;
    action := D' = C + 1, H' = ?, I' = ?;
  };
  transition t2 := {
    from   := f52;
    to     := f52;
    guard  := A > D && C > D;
    action := D' = D + 1, H' = ?, I' = ?;
  };
  transition t3 := {
    from   := f52;
    to     := f52;
    guard  := A > D && D > C;
    action := D' = D + 1, H' = ?, I' = ?;
  };
  transition t4 := {
    from   := f60;
    to     := f63;
    guard  := A > D;
    action := E' = 0, H' = ?, I' = ?;
  };
  transition t5 := {
    from   := f63;
    to     := f63;
    guard  := B > E;
    action := E' = E + 1, F' = H, G' = I, H' = ?, I' = ?;
  };
  transition t6 := {
    from   := f74;
    to     := f80;
    guard  := B > D;
    action := F' = H, G' = I, H' = ?, I' = ?;
  };
  transition t7 := {
    from   := f74;
    to     := f74;
    guard  := B > D;
    action := D' = D + 1, F' = H, G' = I, H' = ?, I' = ?;
  };
  transition t8 := {
    from   := f84;
    to     := f84;
    guard  := A > D;
    action := D' = D + 1, H' = ?, I' = ?;
  };
  transition t9 := {
    from   := f84;
    to     := f80;
    guard  := D >= A;
    action := H' = ?, I' = ?;
  };
  transition t10 := {
    from   := f74;
    to     := f84;
    guard  := D >= B;
    action := D' = 0, H' = ?, I' = ?;
  };
  transition t11 := {
    from   := f63;
    to     := f60;
    guard  := E >= B;
    action := D' = D + 1, H' = ?, I' = ?;
  };
  transition t12 := {
    from   := f60;
    to     := f74;
    guard  := D >= A;
    action := D' = 0, H' = ?, I' = ?;
  };
  transition t13 := {
    from   := f52;
    to     := f60;
    guard  := D >= A;
    action := D' = 0, H' = ?, I' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
