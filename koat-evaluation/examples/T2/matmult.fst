model main {
  var A, B, C, D, E, F, G, H, I, J, K;
  states f16, f19, f33, f36, f52, f55, f59, f73, f0;
  transition t0 := {
    from   := f16;
    to     := f19;
    guard  := 19 >= A;
    action := B' = 0, K' = ?;
  };
  transition t1 := {
    from   := f33;
    to     := f36;
    guard  := 19 >= C;
    action := D' = 0, K' = ?;
  };
  transition t2 := {
    from   := f52;
    to     := f55;
    guard  := 19 >= E;
    action := F' = 0, K' = ?;
  };
  transition t3 := {
    from   := f55;
    to     := f59;
    guard  := 19 >= F;
    action := G' = 0, K' = ?;
  };
  transition t4 := {
    from   := f59;
    to     := f59;
    guard  := 19 >= G;
    action := G' = G + 1, K' = ?;
  };
  transition t5 := {
    from   := f59;
    to     := f55;
    guard  := G > 19;
    action := F' = F + 1, K' = ?;
  };
  transition t6 := {
    from   := f55;
    to     := f52;
    guard  := F > 19;
    action := E' = E + 1, K' = ?;
  };
  transition t7 := {
    from   := f52;
    to     := f73;
    guard  := E > 19;
    action := K' = ?;
  };
  transition t8 := {
    from   := f36;
    to     := f36;
    guard  := 19 >= D;
    action := H' = K, D' = D + 1, I' = K, K' = ?;
  };
  transition t9 := {
    from   := f36;
    to     := f33;
    guard  := D > 19;
    action := C' = C + 1, K' = ?;
  };
  transition t10 := {
    from   := f33;
    to     := f52;
    guard  := C > 19;
    action := E' = 0, K' = ?;
  };
  transition t11 := {
    from   := f19;
    to     := f19;
    guard  := 19 >= B;
    action := H' = K, B' = B + 1, J' = K, K' = ?;
  };
  transition t12 := {
    from   := f19;
    to     := f16;
    guard  := B > 19;
    action := A' = A + 1, K' = ?;
  };
  transition t13 := {
    from   := f16;
    to     := f33;
    guard  := A > 19;
    action := C' = 0, K' = ?;
  };
  transition t14 := {
    from   := f0;
    to     := f16;
    guard  := true;
    action := H' = 0, A' = 0, K' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
