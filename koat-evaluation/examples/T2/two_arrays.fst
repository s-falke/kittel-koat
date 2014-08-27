model main {
  var A, B, C, D, E, F, G, H, I;
  states f0, f15, f25, f33, f42, f52, f60, f69;
  transition t0 := {
    from   := f0;
    to     := f15;
    guard  := true;
    action := A' = 0, B' = H, C' = I, D' = 0, H' = ?, I' = ?;
  };
  transition t1 := {
    from   := f15;
    to     := f15;
    guard  := 49 >= D;
    action := D' = D + 1, H' = ?, I' = ?;
  };
  transition t2 := {
    from   := f25;
    to     := f25;
    guard  := 49 >= E;
    action := E' = E + 1, H' = ?, I' = ?;
  };
  transition t3 := {
    from   := f33;
    to     := f33;
    guard  := 49 >= A;
    action := A' = A + 1, H' = ?, I' = ?;
  };
  transition t4 := {
    from   := f42;
    to     := f42;
    guard  := 49 >= F;
    action := F' = F + 1, H' = ?, I' = ?;
  };
  transition t5 := {
    from   := f52;
    to     := f52;
    guard  := 49 >= G;
    action := G' = G + 1, H' = ?, I' = ?;
  };
  transition t6 := {
    from   := f60;
    to     := f60;
    guard  := 49 >= A;
    action := A' = A + 1, H' = ?, I' = ?;
  };
  transition t7 := {
    from   := f60;
    to     := f69;
    guard  := A > 49;
    action := H' = ?, I' = ?;
  };
  transition t8 := {
    from   := f52;
    to     := f60;
    guard  := G > 49;
    action := A' = 0, H' = ?, I' = ?;
  };
  transition t9 := {
    from   := f42;
    to     := f52;
    guard  := F > 49;
    action := G' = 0, H' = ?, I' = ?;
  };
  transition t10 := {
    from   := f33;
    to     := f42;
    guard  := A > 49;
    action := F' = 0, H' = ?, I' = ?;
  };
  transition t11 := {
    from   := f25;
    to     := f33;
    guard  := E > 49;
    action := A' = 0, H' = ?, I' = ?;
  };
  transition t12 := {
    from   := f15;
    to     := f25;
    guard  := D > 49;
    action := E' = 0, H' = ?, I' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
