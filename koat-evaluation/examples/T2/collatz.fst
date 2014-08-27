model main {
  var A, B, C, D;
  states f0, f2;
  transition t0 := {
    from   := f0;
    to     := f2;
    guard  := C > 0 && C > 4 && C > 1 && C > 2;
    action := A' = C, B' = D, C' = ?, D' = ?;
  };
  transition t1 := {
    from   := f0;
    to     := f2;
    guard  := 0 > 3 && 0 > 0;
    action := A' = 1, B' = C, C' = ?, D' = ?;
  };
  transition t2 := {
    from   := f0;
    to     := f2;
    guard  := C > 0 && C > 4 && 0 >= C && C > 2;
    action := A' = C, B' = D, C' = ?, D' = ?;
  };
  transition t3 := {
    from   := f0;
    to     := f2;
    guard  := 0 > 3 && 0 > 0;
    action := A' = 1, B' = C, C' = ?, D' = ?;
  };
  transition t4 := {
    from   := f0;
    to     := f2;
    guard  := true;
    action := A' = 3, B' = C, C' = ?, D' = ?;
  };
  transition t5 := {
    from   := f0;
    to     := f2;
    guard  := 0 > 0;
    action := A' = 1, B' = C, C' = ?, D' = ?;
  };
  transition t6 := {
    from   := f0;
    to     := f2;
    guard  := 0 > 2;
    action := A' = 3, B' = C, C' = ?, D' = ?;
  };
  transition t7 := {
    from   := f0;
    to     := f2;
    guard  := 0 > 0;
    action := A' = 1, B' = C, C' = ?, D' = ?;
  };
  transition t8 := {
    from   := f2;
    to     := f2;
    guard  := B > 4 && B > 1 && B > 2 && A = 2*B;
    action := A' = B, B' = C, C' = ?, D' = ?;
  };
  transition t9 := {
    from   := f2;
    to     := f2;
    guard  := B > 4 && B > 1 && 1 >= B && A = 2*B;
    action := A' = B, B' = C, C' = ?, D' = ?;
  };
  transition t10 := {
    from   := f2;
    to     := f2;
    guard  := B > 4 && 0 >= B && B > 2 && A = 2*B;
    action := A' = B, B' = C, C' = ?, D' = ?;
  };
  transition t11 := {
    from   := f2;
    to     := f2;
    guard  := B > 4 && 0 >= B && 1 >= B && A = 2*B;
    action := A' = B, B' = C, C' = ?, D' = ?;
  };
  transition t12 := {
    from   := f2;
    to     := f2;
    guard  := B = 3 && A = 6;
    action := A' = B, B' = C, C' = ?, D' = ?;
  };
  transition t13 := {
    from   := f2;
    to     := f2;
    guard  := 3 >= B && B > 1 && 1 >= B && A = 2*B;
    action := A' = B, B' = C, C' = ?, D' = ?;
  };
  transition t14 := {
    from   := f2;
    to     := f2;
    guard  := 0 > 2 && B = 3 && A = 6;
    action := A' = B, B' = C, C' = ?, D' = ?;
  };
  transition t15 := {
    from   := f2;
    to     := f2;
    guard  := 3 >= B && 0 >= B && 1 >= B && A = 2*B;
    action := A' = B, B' = C, C' = ?, D' = ?;
  };
  transition t16 := {
    from   := f2;
    to     := f2;
    guard  := 6*B > 0 && 6*B + 2 >= 0 && 6*B + 1 >= 0 && A = 2*B + 1;
    action := A' = 6*B + 4, B' = C, C' = ?, D' = ?;
  };
  transition t17 := {
    from   := f2;
    to     := f2;
    guard  := 6*B > 0 && 6*B + 2 >= 0 && 0 > 2 + 6*B && A = 2*B + 1;
    action := A' = 6*B + 4, B' = C, C' = ?, D' = ?;
  };
  transition t18 := {
    from   := f2;
    to     := f2;
    guard  := 6*B > 0 && 0 > 3 + 6*B && 6*B + 1 >= 0 && A = 2*B + 1;
    action := A' = 6*B + 4, B' = C, C' = ?, D' = ?;
  };
  transition t19 := {
    from   := f2;
    to     := f2;
    guard  := 6*B > 0 && 0 > 3 + 6*B && 0 > 2 + 6*B && A = 2*B + 1;
    action := A' = 6*B + 4, B' = C, C' = ?, D' = ?;
  };
  transition t20 := {
    from   := f2;
    to     := f2;
    guard  := 0 > 6*B && 6*B + 2 >= 0 && 6*B + 1 >= 0 && A = 2*B + 1;
    action := A' = 6*B + 4, B' = C, C' = ?, D' = ?;
  };
  transition t21 := {
    from   := f2;
    to     := f2;
    guard  := 0 > 6*B && 6*B + 2 >= 0 && 0 > 2 + 6*B && A = 2*B + 1;
    action := A' = 6*B + 4, B' = C, C' = ?, D' = ?;
  };
  transition t22 := {
    from   := f2;
    to     := f2;
    guard  := 0 > 6*B && 0 > 3 + 6*B && 6*B + 1 >= 0 && A = 2*B + 1;
    action := A' = 6*B + 4, B' = C, C' = ?, D' = ?;
  };
  transition t23 := {
    from   := f2;
    to     := f2;
    guard  := 0 > 6*B && 0 > 3 + 6*B && 0 > 2 + 6*B && A = 2*B + 1;
    action := A' = 6*B + 4, B' = C, C' = ?, D' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
