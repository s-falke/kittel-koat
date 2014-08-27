model main {
  var A, B, C, D, E, F, G, H, I;
  states f0, f70, f78, f81, f92, f98, f102;
  transition t0 := {
    from   := f0;
    to     := f70;
    guard  := true;
    action := A' = 5, B' = 20, C' = 0, D' = 0, H' = ?, I' = ?;
  };
  transition t1 := {
    from   := f70;
    to     := f70;
    guard  := A > D && C = D;
    action := D' = C + 1, H' = ?, I' = ?;
  };
  transition t2 := {
    from   := f70;
    to     := f70;
    guard  := A > D && C > D;
    action := D' = D + 1, H' = ?, I' = ?;
  };
  transition t3 := {
    from   := f70;
    to     := f70;
    guard  := A > D && D > C;
    action := D' = D + 1, H' = ?, I' = ?;
  };
  transition t4 := {
    from   := f78;
    to     := f81;
    guard  := A > D;
    action := E' = 0, H' = ?, I' = ?;
  };
  transition t5 := {
    from   := f81;
    to     := f81;
    guard  := B > E;
    action := E' = E + 1, F' = H, G' = I, H' = ?, I' = ?;
  };
  transition t6 := {
    from   := f92;
    to     := f98;
    guard  := B > D;
    action := F' = H, G' = I, H' = ?, I' = ?;
  };
  transition t7 := {
    from   := f92;
    to     := f92;
    guard  := B > D;
    action := D' = D + 1, F' = H, G' = I, H' = ?, I' = ?;
  };
  transition t8 := {
    from   := f102;
    to     := f102;
    guard  := A > D;
    action := D' = D + 1, H' = ?, I' = ?;
  };
  transition t9 := {
    from   := f102;
    to     := f98;
    guard  := D >= A;
    action := H' = ?, I' = ?;
  };
  transition t10 := {
    from   := f92;
    to     := f102;
    guard  := D >= B;
    action := D' = 0, H' = ?, I' = ?;
  };
  transition t11 := {
    from   := f81;
    to     := f78;
    guard  := E >= B;
    action := D' = D + 1, H' = ?, I' = ?;
  };
  transition t12 := {
    from   := f78;
    to     := f92;
    guard  := D >= A;
    action := D' = 0, H' = ?, I' = ?;
  };
  transition t13 := {
    from   := f70;
    to     := f78;
    guard  := D >= A;
    action := D' = 0, H' = ?, I' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
