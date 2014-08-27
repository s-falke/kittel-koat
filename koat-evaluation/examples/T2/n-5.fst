model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P;
  states f8, f32, f15, f300, f13, f1, f12, f10;
  transition t0 := {
    from   := f8;
    to     := f32;
    guard  := A >= B;
    action := C' = N, N' = ?, O' = ?, P' = ?;
  };
  transition t1 := {
    from   := f15;
    to     := f8;
    guard  := true;
    action := D' = N, N' = ?, O' = ?, P' = ?;
  };
  transition t2 := {
    from   := f300;
    to     := f8;
    guard  := B >= E;
    action := A' = 1 + A, N' = ?, O' = ?, P' = ?;
  };
  transition t3 := {
    from   := f8;
    to     := f8;
    guard  := B > A && B >= E;
    action := A' = 1 + A, N' = ?, O' = ?, P' = ?;
  };
  transition t4 := {
    from   := f13;
    to     := f1;
    guard  := true;
    action := C' = N, F' = O, G' = P, H' = 0, I' = -2, J' = 0, K' = 0, N' = ?, O' = ?, P' = ?;
  };
  transition t5 := {
    from   := f12;
    to     := f1;
    guard  := 4 >= I;
    action := C' = N, F' = O, G' = P, H' = 0, L' = -1 + I, J' = 0, K' = 0, N' = ?, O' = ?, P' = ?;
  };
  transition t6 := {
    from   := f10;
    to     := f1;
    guard  := true;
    action := C' = N, F' = O, G' = P, H' = 0, M' = -2, J' = 0, K' = 0, N' = ?, O' = ?, P' = ?;
  };
  transition t7 := {
    from   := f8;
    to     := f1;
    guard  := B > A && E > B;
    action := C' = N, F' = O, G' = P, H' = 0, J' = 0, K' = 0, N' = ?, O' = ?, P' = ?;
  };
  transition t8 := {
    from   := f1;
    to     := f1;
    guard  := E > B && 4 >= M;
    action := C' = N, F' = O, G' = P, H' = 0, J' = 0, K' = 0, N' = ?, O' = ?, P' = ?;
  };
  transition t9 := {
    from   := f300;
    to     := f1;
    guard  := E > B;
    action := C' = N, F' = O, G' = P, H' = 0, J' = 0, K' = 0, N' = ?, O' = ?, P' = ?;
  };
  transition t10 := {
    from   := f12;
    to     := f300;
    guard  := I > 4;
    action := B' = 1 + B, C' = N, F' = O, H' = 1, J' = 1, K' = 1, N' = ?, O' = ?, P' = ?;
  };
  transition t11 := {
    from   := f1;
    to     := f300;
    guard  := E > B && M > 4;
    action := B' = 1 + B, C' = N, F' = O, H' = 1, J' = 1, K' = 1, N' = ?, O' = ?, P' = ?;
  };
}
strategy dumb {
  Region init := { state = f15 };
}
