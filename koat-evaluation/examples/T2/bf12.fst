model main {
  var A, B, C, D, E, F, G, H, I;
  states f0, f46, f54, f57, f68, f74, f78;
  transition t0 := {
    from   := f0;
    to     := f46;
    guard  := true;
    action := A' = 5, B' = 12, C' = 0, D' = 0, H' = ?, I' = ?;
  };
  transition t1 := {
    from   := f46;
    to     := f46;
    guard  := A > D && C = D;
    action := D' = C + 1, H' = ?, I' = ?;
  };
  transition t2 := {
    from   := f46;
    to     := f46;
    guard  := A > D && C > D;
    action := D' = D + 1, H' = ?, I' = ?;
  };
  transition t3 := {
    from   := f46;
    to     := f46;
    guard  := A > D && D > C;
    action := D' = D + 1, H' = ?, I' = ?;
  };
  transition t4 := {
    from   := f54;
    to     := f57;
    guard  := A > D;
    action := E' = 0, H' = ?, I' = ?;
  };
  transition t5 := {
    from   := f57;
    to     := f57;
    guard  := B > E;
    action := E' = E + 1, F' = H, G' = I, H' = ?, I' = ?;
  };
  transition t6 := {
    from   := f68;
    to     := f74;
    guard  := B > D;
    action := F' = H, G' = I, H' = ?, I' = ?;
  };
  transition t7 := {
    from   := f68;
    to     := f68;
    guard  := B > D;
    action := D' = D + 1, F' = H, G' = I, H' = ?, I' = ?;
  };
  transition t8 := {
    from   := f78;
    to     := f78;
    guard  := A > D;
    action := D' = D + 1, H' = ?, I' = ?;
  };
  transition t9 := {
    from   := f78;
    to     := f74;
    guard  := D >= A;
    action := H' = ?, I' = ?;
  };
  transition t10 := {
    from   := f68;
    to     := f78;
    guard  := D >= B;
    action := D' = 0, H' = ?, I' = ?;
  };
  transition t11 := {
    from   := f57;
    to     := f54;
    guard  := E >= B;
    action := D' = D + 1, H' = ?, I' = ?;
  };
  transition t12 := {
    from   := f54;
    to     := f68;
    guard  := D >= A;
    action := D' = 0, H' = ?, I' = ?;
  };
  transition t13 := {
    from   := f46;
    to     := f54;
    guard  := D >= A;
    action := D' = 0, H' = ?, I' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
