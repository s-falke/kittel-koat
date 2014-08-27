model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S;
  states f11, f14, f33, f36, f58, f0;
  transition t0 := {
    from   := f11;
    to     := f14;
    guard  := 9 >= A;
    action := B' = 0, R' = ?, S' = ?;
  };
  transition t1 := {
    from   := f33;
    to     := f36;
    guard  := 9 >= C;
    action := D' = 0, R' = ?, S' = ?;
  };
  transition t2 := {
    from   := f36;
    to     := f36;
    guard  := 9 >= D && 0 > R;
    action := E' = E + S, F' = F + 1, D' = D + 1, R' = ?, S' = ?;
  };
  transition t3 := {
    from   := f36;
    to     := f36;
    guard  := 9 >= D;
    action := G' = G + S, H' = H + 1, D' = D + 1, R' = ?, S' = ?;
  };
  transition t4 := {
    from   := f36;
    to     := f33;
    guard  := D > 9;
    action := C' = C + 1, R' = ?, S' = ?;
  };
  transition t5 := {
    from   := f33;
    to     := f58;
    guard  := C > 9;
    action := I' = E, J' = F, K' = G, L' = H, M' = 1500, N' = S, R' = ?, S' = ?;
  };
  transition t6 := {
    from   := f14;
    to     := f14;
    guard  := 9 >= B;
    action := O' = S, B' = B + 1, P' = S, R' = ?, S' = ?;
  };
  transition t7 := {
    from   := f14;
    to     := f11;
    guard  := B > 9;
    action := A' = A + 1, R' = ?, S' = ?;
  };
  transition t8 := {
    from   := f11;
    to     := f33;
    guard  := A > 9;
    action := Q' = 1000, E' = 0, G' = 0, F' = 0, H' = 0, C' = 0, R' = ?, S' = ?;
  };
  transition t9 := {
    from   := f0;
    to     := f11;
    guard  := true;
    action := O' = 0, A' = 0, R' = ?, S' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
