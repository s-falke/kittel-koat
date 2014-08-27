model main {
  var A, B, C, D, E, F, G, H, I;
  states f0, f25, f33, f36, f47, f53, f57;
  transition t0 := {
    from   := f0;
    to     := f25;
    guard  := true;
    action := A' = 5, B' = 5, C' = 0, D' = 0, H' = ?, I' = ?;
  };
  transition t1 := {
    from   := f25;
    to     := f25;
    guard  := A > D && C = D;
    action := D' = C + 1, H' = ?, I' = ?;
  };
  transition t2 := {
    from   := f25;
    to     := f25;
    guard  := A > D && C > D;
    action := D' = D + 1, H' = ?, I' = ?;
  };
  transition t3 := {
    from   := f25;
    to     := f25;
    guard  := A > D && D > C;
    action := D' = D + 1, H' = ?, I' = ?;
  };
  transition t4 := {
    from   := f33;
    to     := f36;
    guard  := A > D;
    action := E' = 0, H' = ?, I' = ?;
  };
  transition t5 := {
    from   := f36;
    to     := f36;
    guard  := B > E;
    action := E' = E + 1, F' = H, G' = I, H' = ?, I' = ?;
  };
  transition t6 := {
    from   := f47;
    to     := f53;
    guard  := B > D;
    action := F' = H, G' = I, H' = ?, I' = ?;
  };
  transition t7 := {
    from   := f47;
    to     := f47;
    guard  := B > D;
    action := D' = D + 1, F' = H, G' = I, H' = ?, I' = ?;
  };
  transition t8 := {
    from   := f57;
    to     := f57;
    guard  := A > D;
    action := D' = D + 1, H' = ?, I' = ?;
  };
  transition t9 := {
    from   := f57;
    to     := f53;
    guard  := D >= A;
    action := H' = ?, I' = ?;
  };
  transition t10 := {
    from   := f47;
    to     := f57;
    guard  := D >= B;
    action := D' = 0, H' = ?, I' = ?;
  };
  transition t11 := {
    from   := f36;
    to     := f33;
    guard  := E >= B;
    action := D' = D + 1, H' = ?, I' = ?;
  };
  transition t12 := {
    from   := f33;
    to     := f47;
    guard  := D >= A;
    action := D' = 0, H' = ?, I' = ?;
  };
  transition t13 := {
    from   := f25;
    to     := f33;
    guard  := D >= A;
    action := D' = 0, H' = ?, I' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
