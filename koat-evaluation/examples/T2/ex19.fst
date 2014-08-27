model main {
  var A, B, C, D;
  states f0, f6, f14;
  transition t0 := {
    from   := f0;
    to     := f6;
    guard  := true;
    action := A' = B, C' = D;
  };
  transition t1 := {
    from   := f6;
    to     := f6;
    guard  := 0 > A;
    action := A' = A - 1, C' = C - 1;
  };
  transition t2 := {
    from   := f6;
    to     := f6;
    guard  := A > 0;
    action := A' = A - 1, C' = C - 1;
  };
  transition t3 := {
    from   := f6;
    to     := f14;
    guard  := D > B && A = 0;
    action := A' = 0;
  };
  transition t4 := {
    from   := f6;
    to     := f14;
    guard  := B > D && A = 0;
    action := A' = 0;
  };
  transition t5 := {
    from   := f6;
    to     := f14;
    guard  := A = 0 && B = D;
    action := A' = 0, D' = B;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
