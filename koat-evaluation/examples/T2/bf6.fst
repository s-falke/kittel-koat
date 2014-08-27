model main {
  var A, B, C, D, E, F, G, H, I;
  states f0, f28, f36, f39, f50, f56, f60;
  transition t0 := {
    from   := f0;
    to     := f28;
    guard  := true;
    action := A' = 5, B' = 6, C' = 0, D' = 0, H' = ?, I' = ?;
  };
  transition t1 := {
    from   := f28;
    to     := f28;
    guard  := A > D && C = D;
    action := D' = C + 1, H' = ?, I' = ?;
  };
  transition t2 := {
    from   := f28;
    to     := f28;
    guard  := A > D && C > D;
    action := D' = D + 1, H' = ?, I' = ?;
  };
  transition t3 := {
    from   := f28;
    to     := f28;
    guard  := A > D && D > C;
    action := D' = D + 1, H' = ?, I' = ?;
  };
  transition t4 := {
    from   := f36;
    to     := f39;
    guard  := A > D;
    action := E' = 0, H' = ?, I' = ?;
  };
  transition t5 := {
    from   := f39;
    to     := f39;
    guard  := B > E;
    action := E' = E + 1, F' = H, G' = I, H' = ?, I' = ?;
  };
  transition t6 := {
    from   := f50;
    to     := f56;
    guard  := B > D;
    action := F' = H, G' = I, H' = ?, I' = ?;
  };
  transition t7 := {
    from   := f50;
    to     := f50;
    guard  := B > D;
    action := D' = D + 1, F' = H, G' = I, H' = ?, I' = ?;
  };
  transition t8 := {
    from   := f60;
    to     := f60;
    guard  := A > D;
    action := D' = D + 1, H' = ?, I' = ?;
  };
  transition t9 := {
    from   := f60;
    to     := f56;
    guard  := D >= A;
    action := H' = ?, I' = ?;
  };
  transition t10 := {
    from   := f50;
    to     := f60;
    guard  := D >= B;
    action := D' = 0, H' = ?, I' = ?;
  };
  transition t11 := {
    from   := f39;
    to     := f36;
    guard  := E >= B;
    action := D' = D + 1, H' = ?, I' = ?;
  };
  transition t12 := {
    from   := f36;
    to     := f50;
    guard  := D >= A;
    action := D' = 0, H' = ?, I' = ?;
  };
  transition t13 := {
    from   := f28;
    to     := f36;
    guard  := D >= A;
    action := D' = 0, H' = ?, I' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
