model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q;
  states f20, f28, f40, f42, f45, f0;
  transition t0 := {
    from   := f20;
    to     := f28;
    guard  := 0 >= A;
    action := P' = ?, Q' = ?;
  };
  transition t1 := {
    from   := f40;
    to     := f40;
    guard  := true;
    action := P' = ?, Q' = ?;
  };
  transition t2 := {
    from   := f42;
    to     := f45;
    guard  := true;
    action := P' = ?, Q' = ?;
  };
  transition t3 := {
    from   := f28;
    to     := f40;
    guard  := A > 0;
    action := P' = ?, Q' = ?;
  };
  transition t4 := {
    from   := f28;
    to     := f40;
    guard  := 0 >= A && 999 + B >= P;
    action := C' = 0, D' = P, E' = P, F' = P, P' = ?, Q' = ?;
  };
  transition t5 := {
    from   := f28;
    to     := f40;
    guard  := 0 >= A && P > B + 999;
    action := A' = 1, C' = 0, D' = P, E' = P, F' = P, P' = ?, Q' = ?;
  };
  transition t6 := {
    from   := f20;
    to     := f28;
    guard  := A > 0;
    action := A' = 0, G' = 0, H' = P, I' = P, B' = P, P' = ?, Q' = ?;
  };
  transition t7 := {
    from   := f0;
    to     := f20;
    guard  := 0 >= P;
    action := A' = 1, J' = P, P' = ?, Q' = ?;
  };
  transition t8 := {
    from   := f0;
    to     := f20;
    guard  := P > 0 && Q > 0;
    action := A' = 1, J' = 0, K' = 1, L' = P, M' = P, N' = P, O' = P, P' = ?, Q' = ?;
  };
  transition t9 := {
    from   := f0;
    to     := f40;
    guard  := 0 >= P && Q > 0;
    action := A' = 1, J' = 0, K' = 1, L' = P, M' = P, N' = P, O' = P, P' = ?, Q' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
