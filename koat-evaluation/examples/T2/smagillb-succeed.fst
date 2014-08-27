model main {
  var A, B, C, D, E, F, G, H, I;
  states f14, f24, f26, f29, f0;
  transition t0 := {
    from   := f14;
    to     := f14;
    guard  := A > 0 && H > 0;
    action := B' = B - 1, C' = C + 1, A' = A - 1, D' = H, H' = ?, I' = ?;
  };
  transition t1 := {
    from   := f14;
    to     := f14;
    guard  := 0 >= H && A > 0 && A > B;
    action := A' = A - 1, D' = H, H' = ?, I' = ?;
  };
  transition t2 := {
    from   := f24;
    to     := f24;
    guard  := true;
    action := H' = ?, I' = ?;
  };
  transition t3 := {
    from   := f26;
    to     := f29;
    guard  := true;
    action := H' = ?, I' = ?;
  };
  transition t4 := {
    from   := f14;
    to     := f24;
    guard  := 0 >= A;
    action := H' = ?, I' = ?;
  };
  transition t5 := {
    from   := f0;
    to     := f14;
    guard  := H > 0 && 2*I >= 0;
    action := E' = H, B' = H, F' = 2*I + 1, G' = I, C' = 0, A' = 2*I + 1, H' = ?, I' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
