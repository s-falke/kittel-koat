model main {
  var A, B, C, D, E, F;
  states f5, f300, f4, f2, f1;
  transition t0 := {
    from   := f5;
    to     := f300;
    guard  := true;
    action := F' = ?;
  };
  transition t1 := {
    from   := f4;
    to     := f300;
    guard  := A >= B;
    action := C' = 1 + C, F' = ?;
  };
  transition t2 := {
    from   := f4;
    to     := f4;
    guard  := F > 0 && B > A;
    action := A' = 1 + A, D' = F, F' = ?;
  };
  transition t3 := {
    from   := f4;
    to     := f4;
    guard  := 0 > F && B > A;
    action := A' = 1 + A, D' = F, F' = ?;
  };
  transition t4 := {
    from   := f4;
    to     := f2;
    guard  := B > A;
    action := D' = 0, F' = ?;
  };
  transition t5 := {
    from   := f2;
    to     := f4;
    guard  := F > 0 && B > A;
    action := A' = 1 + A, D' = F, F' = ?;
  };
  transition t6 := {
    from   := f2;
    to     := f4;
    guard  := 0 > F && B > A;
    action := A' = 1 + A, D' = F, F' = ?;
  };
  transition t7 := {
    from   := f2;
    to     := f2;
    guard  := B > A;
    action := D' = 0, F' = ?;
  };
  transition t8 := {
    from   := f300;
    to     := f1;
    guard  := C >= A;
    action := E' = F, F' = ?;
  };
  transition t9 := {
    from   := f300;
    to     := f300;
    guard  := A > C && A >= B;
    action := C' = 1 + C, F' = ?;
  };
  transition t10 := {
    from   := f300;
    to     := f4;
    guard  := F > 0 && A > C && B > A;
    action := A' = 1 + A, D' = F, F' = ?;
  };
  transition t11 := {
    from   := f300;
    to     := f4;
    guard  := 0 > F && A > C && B > A;
    action := A' = 1 + A, D' = F, F' = ?;
  };
  transition t12 := {
    from   := f300;
    to     := f2;
    guard  := A > C && B > A;
    action := D' = 0, F' = ?;
  };
}
strategy dumb {
  Region init := { state = f5 };
}
