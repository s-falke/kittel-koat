model main {
  var A, B, C, D;
  states f2, f300, f1;
  transition t0 := {
    from   := f2;
    to     := f300;
    guard  := A > 2 && B > 1;
    action := C' = D, D' = ?;
  };
  transition t1 := {
    from   := f2;
    to     := f2;
    guard  := 1 >= D && B = 1 && A = 1;
    action := B' = 2, A' = 1, D' = ?;
  };
  transition t2 := {
    from   := f2;
    to     := f2;
    guard  := A > 1 && 1 >= D && B = 1;
    action := B' = 2, A' = 1 + A, D' = ?;
  };
  transition t3 := {
    from   := f2;
    to     := f2;
    guard  := 0 >= A && 1 >= D && B = 1;
    action := B' = 2, A' = 1 + A, D' = ?;
  };
  transition t4 := {
    from   := f2;
    to     := f2;
    guard  := B > 1 && 1 >= B && A = 1;
    action := B' = 1 + B, A' = 1, D' = ?;
  };
  transition t5 := {
    from   := f2;
    to     := f2;
    guard  := 0 >= B && 1 >= B && A = 1;
    action := B' = 1 + B, A' = 1, D' = ?;
  };
  transition t6 := {
    from   := f2;
    to     := f2;
    guard  := 1 >= B && A > 1 && B > 1;
    action := B' = 1 + B, A' = 1 + A, D' = ?;
  };
  transition t7 := {
    from   := f2;
    to     := f2;
    guard  := 1 >= B && A > 1 && 0 >= B;
    action := B' = 1 + B, A' = 1 + A, D' = ?;
  };
  transition t8 := {
    from   := f2;
    to     := f2;
    guard  := 1 >= B && 0 >= A && B > 1;
    action := B' = 1 + B, A' = 1 + A, D' = ?;
  };
  transition t9 := {
    from   := f2;
    to     := f2;
    guard  := 1 >= B && 0 >= A && 0 >= B;
    action := B' = 1 + B, A' = 1 + A, D' = ?;
  };
  transition t10 := {
    from   := f2;
    to     := f2;
    guard  := B > 1 && 2 >= D && A = 1;
    action := B' = 1 + B, A' = 1, D' = ?;
  };
  transition t11 := {
    from   := f2;
    to     := f2;
    guard  := B > 1 && 0 >= B && 2 >= D && A = 1;
    action := B' = 1 + B, A' = 1, D' = ?;
  };
  transition t12 := {
    from   := f2;
    to     := f2;
    guard  := B > 1 && A = 2;
    action := B' = 1 + B, A' = 1 + A, D' = ?;
  };
  transition t13 := {
    from   := f2;
    to     := f2;
    guard  := B > 1 && 0 >= B && A = 2;
    action := B' = 1 + B, A' = 1 + A, D' = ?;
  };
  transition t14 := {
    from   := f2;
    to     := f2;
    guard  := B > 1 && 2 >= A && 0 >= A;
    action := B' = 1 + B, A' = 1 + A, D' = ?;
  };
  transition t15 := {
    from   := f2;
    to     := f2;
    guard  := B > 1 && 2 >= A && 0 >= A && 0 >= B;
    action := B' = 1 + B, A' = 1 + A, D' = ?;
  };
  transition t16 := {
    from   := f1;
    to     := f2;
    guard  := true;
    action := D' = ?;
  };
}
strategy dumb {
  Region init := { state = f1 };
}
