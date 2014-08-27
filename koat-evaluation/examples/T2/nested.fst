model main {
  var A, B, C, D, E, F, G, H, I;
  states f0, f2, f1, f4, f3;
  transition t0 := {
    from   := f0;
    to     := f2;
    guard  := 0 >= A;
    action := H' = ?, I' = ?;
  };
  transition t1 := {
    from   := f0;
    to     := f0;
    guard  := A > 0;
    action := A' = -1 + A, B' = C, D' = A, C' = -1 + C, H' = ?, I' = ?;
  };
  transition t2 := {
    from   := f1;
    to     := f0;
    guard  := A > 0 && C > 0;
    action := A' = -1 + A, C' = -1 + C, E' = C, F' = A, H' = ?, I' = ?;
  };
  transition t3 := {
    from   := f2;
    to     := f4;
    guard  := 0 >= C;
    action := G' = H, H' = ?, I' = ?;
  };
  transition t4 := {
    from   := f2;
    to     := f0;
    guard  := H > 0 && C > 0;
    action := A' = H, H' = ?, I' = ?;
  };
  transition t5 := {
    from   := f3;
    to     := f2;
    guard  := true;
    action := A' = H, C' = I, H' = ?, I' = ?;
  };
}
strategy dumb {
  Region init := { state = f3 };
}
