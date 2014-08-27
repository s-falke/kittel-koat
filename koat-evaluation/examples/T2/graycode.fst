model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N;
  states f62, f63, f0, f13, f19, f22, f32, f35, f38, f48, f52, f71;
  transition t0 := {
    from   := f62;
    to     := f63;
    guard  := 0 > A;
    action := M' = ?, N' = ?;
  };
  transition t1 := {
    from   := f62;
    to     := f63;
    guard  := A > 0;
    action := M' = ?, N' = ?;
  };
  transition t2 := {
    from   := f0;
    to     := f13;
    guard  := true;
    action := B' = 12, C' = 1, A' = 1, D' = 1, E' = M, F' = 0, M' = ?, N' = ?;
  };
  transition t3 := {
    from   := f13;
    to     := f13;
    guard  := B > F;
    action := F' = F + 1, M' = ?, N' = ?;
  };
  transition t4 := {
    from   := f19;
    to     := f22;
    guard  := 0 > C && B > F;
    action := M' = ?, N' = ?;
  };
  transition t5 := {
    from   := f19;
    to     := f22;
    guard  := C > 0 && B > F;
    action := M' = ?, N' = ?;
  };
  transition t6 := {
    from   := f22;
    to     := f19;
    guard  := M >= 0 && B > N;
    action := C' = 1, F' = F + 1, G' = 1, M' = ?, N' = ?;
  };
  transition t7 := {
    from   := f22;
    to     := f19;
    guard  := M >= 0;
    action := C' = 0, F' = F + 1, G' = 0, M' = ?, N' = ?;
  };
  transition t8 := {
    from   := f22;
    to     := f19;
    guard  := 0 > M;
    action := C' = 0, F' = F + 1, G' = 0, M' = ?, N' = ?;
  };
  transition t9 := {
    from   := f19;
    to     := f19;
    guard  := B > F && C = 0;
    action := C' = 0, F' = F + 1, G' = 0, M' = ?, N' = ?;
  };
  transition t10 := {
    from   := f32;
    to     := f35;
    guard  := B > 1 + F;
    action := H' = F + 1, M' = ?, N' = ?;
  };
  transition t11 := {
    from   := f35;
    to     := f38;
    guard  := 0 > A && B > H;
    action := M' = ?, N' = ?;
  };
  transition t12 := {
    from   := f35;
    to     := f38;
    guard  := A > 0 && B > H;
    action := M' = ?, N' = ?;
  };
  transition t13 := {
    from   := f38;
    to     := f35;
    guard  := M > N;
    action := A' = 1, H' = H + 1, I' = 1, M' = ?, N' = ?;
  };
  transition t14 := {
    from   := f38;
    to     := f35;
    guard  := true;
    action := A' = 1, H' = H + 1, I' = 1, M' = ?, N' = ?;
  };
  transition t15 := {
    from   := f38;
    to     := f35;
    guard  := true;
    action := A' = 0, H' = H + 1, I' = 0, M' = ?, N' = ?;
  };
  transition t16 := {
    from   := f35;
    to     := f35;
    guard  := B > H && A = 0;
    action := A' = 0, H' = H + 1, I' = 0, M' = ?, N' = ?;
  };
  transition t17 := {
    from   := f48;
    to     := f52;
    guard  := 0 > D && B > 1 + F;
    action := J' = M, M' = ?, N' = ?;
  };
  transition t18 := {
    from   := f48;
    to     := f52;
    guard  := D > 0 && B > 1 + F;
    action := J' = M, M' = ?, N' = ?;
  };
  transition t19 := {
    from   := f52;
    to     := f48;
    guard  := 0 > J;
    action := D' = 1, F' = F + 1, K' = 1, M' = ?, N' = ?;
  };
  transition t20 := {
    from   := f52;
    to     := f48;
    guard  := J > 0;
    action := D' = 1, F' = F + 1, K' = 1, M' = ?, N' = ?;
  };
  transition t21 := {
    from   := f52;
    to     := f48;
    guard  := J = 0;
    action := D' = 0, F' = F + 1, J' = 0, K' = 0, M' = ?, N' = ?;
  };
  transition t22 := {
    from   := f52;
    to     := f48;
    guard  := true;
    action := D' = 0, F' = F + 1, K' = 0, M' = ?, N' = ?;
  };
  transition t23 := {
    from   := f48;
    to     := f48;
    guard  := B > 1 + F && D = 0;
    action := D' = 0, F' = F + 1, J' = M, K' = 0, M' = ?, N' = ?;
  };
  transition t24 := {
    from   := f63;
    to     := f71;
    guard  := 0 > D;
    action := L' = 0, M' = ?, N' = ?;
  };
  transition t25 := {
    from   := f63;
    to     := f71;
    guard  := D > 0;
    action := L' = 0, M' = ?, N' = ?;
  };
  transition t26 := {
    from   := f63;
    to     := f71;
    guard  := D = 0;
    action := D' = 0, L' = 1, M' = ?, N' = ?;
  };
  transition t27 := {
    from   := f62;
    to     := f71;
    guard  := A = 0;
    action := A' = 0, L' = 1, M' = ?, N' = ?;
  };
  transition t28 := {
    from   := f48;
    to     := f62;
    guard  := 0 > C && F + 1 >= B;
    action := M' = ?, N' = ?;
  };
  transition t29 := {
    from   := f48;
    to     := f62;
    guard  := C > 0 && F + 1 >= B;
    action := M' = ?, N' = ?;
  };
  transition t30 := {
    from   := f48;
    to     := f71;
    guard  := F + 1 >= B && C = 0;
    action := C' = 0, L' = 1, M' = ?, N' = ?;
  };
  transition t31 := {
    from   := f35;
    to     := f32;
    guard  := H >= B;
    action := F' = F + 1, M' = ?, N' = ?;
  };
  transition t32 := {
    from   := f32;
    to     := f48;
    guard  := F + 1 >= B;
    action := F' = 0, M' = ?, N' = ?;
  };
  transition t33 := {
    from   := f19;
    to     := f32;
    guard  := F >= B;
    action := F' = 0, M' = ?, N' = ?;
  };
  transition t34 := {
    from   := f13;
    to     := f19;
    guard  := F >= B;
    action := F' = 0, M' = ?, N' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
