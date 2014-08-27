model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R;
  states f11, f16, f13, f3000;
  transition t0 := {
    from   := f11;
    to     := f11;
    guard  := A >= 0 && B > 0;
    action := C' = B, D' = O, B' = P, O' = ?, P' = ?, Q' = ?, R' = ?;
  };
  transition t1 := {
    from   := f11;
    to     := f11;
    guard  := A >= 0 && 0 > B;
    action := C' = B, D' = O, B' = P, O' = ?, P' = ?, Q' = ?, R' = ?;
  };
  transition t2 := {
    from   := f16;
    to     := f16;
    guard  := E >= 0 && F > G + 1;
    action := G' = G + 1, H' = O, I' = O, J' = O, O' = ?, P' = ?, Q' = ?, R' = ?;
  };
  transition t3 := {
    from   := f11;
    to     := f13;
    guard  := A >= 0 && B = 0;
    action := K' = O, B' = 0, O' = ?, P' = ?, Q' = ?, R' = ?;
  };
  transition t4 := {
    from   := f16;
    to     := f11;
    guard  := 1 + G >= F && P > 0 && E >= 0;
    action := K' = O, C' = P, D' = Q, B' = R, L' = J, M' = J, O' = ?, P' = ?, Q' = ?, R' = ?;
  };
  transition t5 := {
    from   := f16;
    to     := f11;
    guard  := 1 + G >= F && 0 > P && E >= 0;
    action := K' = O, C' = P, D' = Q, B' = R, L' = J, M' = J, O' = ?, P' = ?, Q' = ?, R' = ?;
  };
  transition t6 := {
    from   := f3000;
    to     := f16;
    guard  := N >= 100*P && 99 + 100*P >= N && F > 1;
    action := G' = 1, H' = O, I' = O, J' = O, N' = -100*P + N, O' = ?, P' = ?, Q' = ?, R' = ?;
  };
  transition t7 := {
    from   := f3000;
    to     := f13;
    guard  := N >= 100*P && 99 + 100*P >= N && 1 >= F;
    action := K' = O, B' = 0, L' = 0, M' = 0, G' = 0, J' = 0, N' = -100*P + N, O' = ?, P' = ?, Q' = ?, R' = ?;
  };
}
strategy dumb {
  Region init := { state = f3000 };
}
