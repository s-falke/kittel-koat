model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P;
  states f0, f3, f4, f8;
  transition t0 := {
    from   := f0;
    to     := f3;
    guard  := true;
    action := M' = ?, N' = ?, O' = ?, P' = ?;
  };
  transition t1 := {
    from   := f0;
    to     := f4;
    guard  := true;
    action := M' = ?, N' = ?, O' = ?, P' = ?;
  };
  transition t2 := {
    from   := f0;
    to     := f8;
    guard  := true;
    action := M' = ?, N' = ?, O' = ?, P' = ?;
  };
  transition t3 := {
    from   := f3;
    to     := f4;
    guard  := A > B;
    action := C' = D, E' = F, G' = A, H' = B, M' = ?, N' = ?, O' = ?, P' = ?;
  };
  transition t4 := {
    from   := f3;
    to     := f4;
    guard  := B > A;
    action := C' = D, E' = F, G' = A, H' = B, M' = ?, N' = ?, O' = ?, P' = ?;
  };
  transition t5 := {
    from   := f0;
    to     := f3;
    guard  := true;
    action := C' = D, E' = F, G' = A, H' = B, A' = F, B' = D, M' = ?, N' = ?, O' = ?, P' = ?;
  };
  transition t6 := {
    from   := f0;
    to     := f3;
    guard  := true;
    action := C' = D, E' = F, G' = M, H' = N, I' = M, J' = N, A' = F, B' = D, M' = ?, N' = ?, O' = ?, P' = ?;
  };
  transition t7 := {
    from   := f0;
    to     := f8;
    guard  := true;
    action := C' = D, E' = F, G' = A, H' = B, I' = M, J' = N, D' = M, F' = N, A' = O, B' = P, K' = O, L' = P, M' = ?, N' = ?, O' = ?, P' = ?;
  };
  transition t8 := {
    from   := f3;
    to     := f8;
    guard  := A = B;
    action := C' = D, E' = F, G' = A, H' = A, I' = M, J' = N, D' = M, F' = N, A' = O, B' = P, K' = O, L' = P, M' = ?, N' = ?, O' = ?, P' = ?;
  };
  transition t9 := {
    from   := f0;
    to     := f3;
    guard  := true;
    action := C' = D, E' = F, G' = A, H' = B, A' = A + 1, M' = ?, N' = ?, O' = ?, P' = ?;
  };
  transition t10 := {
    from   := f4;
    to     := f3;
    guard  := B > A;
    action := C' = D, E' = F, G' = A, H' = B, A' = A + 1, M' = ?, N' = ?, O' = ?, P' = ?;
  };
  transition t11 := {
    from   := f0;
    to     := f3;
    guard  := true;
    action := C' = D, E' = F, G' = A, H' = B, B' = B + 1, M' = ?, N' = ?, O' = ?, P' = ?;
  };
  transition t12 := {
    from   := f4;
    to     := f3;
    guard  := A >= B;
    action := C' = D, E' = F, G' = A, H' = B, B' = B + 1, M' = ?, N' = ?, O' = ?, P' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
