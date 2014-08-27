model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q;
  states f17, f18, f20, f22;
  transition t0 := {
    from   := f17;
    to     := f17;
    guard  := A > B && C >= 0 && D >= 0;
    action := D' = 1 + D, E' = P, B' = Q, P' = ?, Q' = ?;
  };
  transition t1 := {
    from   := f17;
    to     := f17;
    guard  := B > A && C >= 0 && D >= 0;
    action := D' = 1 + D, E' = P, B' = Q, P' = ?, Q' = ?;
  };
  transition t2 := {
    from   := f18;
    to     := f17;
    guard  := F >= 0 && A > B;
    action := D' = 1, E' = P, B' = Q, P' = ?, Q' = ?;
  };
  transition t3 := {
    from   := f18;
    to     := f17;
    guard  := F >= 0 && B > A;
    action := D' = 1, E' = P, B' = Q, P' = ?, Q' = ?;
  };
  transition t4 := {
    from   := f17;
    to     := f20;
    guard  := C >= 0 && D >= 0 && B = A;
    action := G' = P, A' = B, P' = ?, Q' = ?;
  };
  transition t5 := {
    from   := f22;
    to     := f18;
    guard  := A > H && F >= 0;
    action := I' = 2, J' = P, G' = Q, K' = P, L' = P, M' = P, N' = 3, O' = 0, B' = H, P' = ?, Q' = ?;
  };
  transition t6 := {
    from   := f22;
    to     := f18;
    guard  := H > A && F >= 0;
    action := I' = 2, J' = P, G' = Q, K' = P, L' = P, M' = P, N' = 3, O' = 0, B' = H, P' = ?, Q' = ?;
  };
}
strategy dumb {
  Region init := { state = f22 };
}
