model main {
  var A, B, C, D, E, F, G, H, I, J, K, L;
  states f18, f24, f31, f33, f36, f0;
  transition t0 := {
    from   := f18;
    to     := f24;
    guard  := 0 >= A;
    action := K' = ?, L' = ?;
  };
  transition t1 := {
    from   := f31;
    to     := f31;
    guard  := true;
    action := K' = ?, L' = ?;
  };
  transition t2 := {
    from   := f33;
    to     := f36;
    guard  := true;
    action := K' = ?, L' = ?;
  };
  transition t3 := {
    from   := f24;
    to     := f31;
    guard  := A > 0;
    action := B' = K, K' = ?, L' = ?;
  };
  transition t4 := {
    from   := f24;
    to     := f31;
    guard  := 0 >= A && 999 + C >= K;
    action := D' = K, B' = L, K' = ?, L' = ?;
  };
  transition t5 := {
    from   := f24;
    to     := f31;
    guard  := 0 >= A && K > C + 999;
    action := A' = 1, D' = K, B' = L, K' = ?, L' = ?;
  };
  transition t6 := {
    from   := f18;
    to     := f24;
    guard  := A > 0;
    action := A' = 0, E' = K, C' = K, K' = ?, L' = ?;
  };
  transition t7 := {
    from   := f0;
    to     := f18;
    guard  := 0 >= K;
    action := A' = 1, F' = K, G' = K, K' = ?, L' = ?;
  };
  transition t8 := {
    from   := f0;
    to     := f18;
    guard  := K > 0 && L > 0;
    action := A' = 1, F' = K, G' = 0, H' = 1, I' = L, J' = L, K' = ?, L' = ?;
  };
  transition t9 := {
    from   := f0;
    to     := f31;
    guard  := K > 0 && 0 >= L;
    action := A' = 1, F' = K, G' = 0, H' = 1, I' = L, J' = L, K' = ?, L' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
