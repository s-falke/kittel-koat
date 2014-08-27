model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N;
  states f0, f23, f29, f33, f44, f52, f55, f63, f71;
  transition t0 := {
    from   := f0;
    to     := f23;
    guard  := true;
    action := A' = 1, B' = 1, C' = 10, D' = M, E' = N, F' = 0, M' = ?, N' = ?;
  };
  transition t1 := {
    from   := f23;
    to     := f23;
    guard  := C > F;
    action := F' = F + 1, M' = ?, N' = ?;
  };
  transition t2 := {
    from   := f29;
    to     := f33;
    guard  := C > F;
    action := G' = 0, H' = 0, M' = ?, N' = ?;
  };
  transition t3 := {
    from   := f33;
    to     := f33;
    guard  := 0 > G && C > H;
    action := G' = 1, H' = H + 1, I' = 1, M' = ?, N' = ?;
  };
  transition t4 := {
    from   := f33;
    to     := f33;
    guard  := G > 0 && C > H;
    action := G' = 1, H' = H + 1, I' = 1, M' = ?, N' = ?;
  };
  transition t5 := {
    from   := f33;
    to     := f33;
    guard  := C > H && G = 0;
    action := G' = 1, H' = H + 1, I' = 1, M' = ?, N' = ?;
  };
  transition t6 := {
    from   := f33;
    to     := f33;
    guard  := M > N && C > H && G = 0;
    action := G' = 0, H' = H + 1, I' = 0, M' = ?, N' = ?;
  };
  transition t7 := {
    from   := f33;
    to     := f33;
    guard  := C > H && G = 0;
    action := G' = 0, H' = H + 1, I' = 0, M' = ?, N' = ?;
  };
  transition t8 := {
    from   := f44;
    to     := f29;
    guard  := 0 > G;
    action := A' = 1, F' = F + 1, J' = 1, M' = ?, N' = ?;
  };
  transition t9 := {
    from   := f44;
    to     := f29;
    guard  := G > 0;
    action := A' = 1, F' = F + 1, J' = 1, M' = ?, N' = ?;
  };
  transition t10 := {
    from   := f44;
    to     := f29;
    guard  := G = 0;
    action := A' = 0, F' = F + 1, G' = 0, J' = 0, M' = ?, N' = ?;
  };
  transition t11 := {
    from   := f52;
    to     := f55;
    guard  := 0 > B && C > 1 + F;
    action := M' = ?, N' = ?;
  };
  transition t12 := {
    from   := f52;
    to     := f55;
    guard  := B > 0 && C > 1 + F;
    action := M' = ?, N' = ?;
  };
  transition t13 := {
    from   := f55;
    to     := f52;
    guard  := M > N;
    action := B' = 1, F' = F + 1, K' = 1, M' = ?, N' = ?;
  };
  transition t14 := {
    from   := f55;
    to     := f52;
    guard  := true;
    action := B' = 0, F' = F + 1, K' = 0, M' = ?, N' = ?;
  };
  transition t15 := {
    from   := f52;
    to     := f52;
    guard  := C > 1 + F && B = 0;
    action := B' = 0, F' = F + 1, K' = 0, M' = ?, N' = ?;
  };
  transition t16 := {
    from   := f63;
    to     := f71;
    guard  := 0 > B;
    action := L' = 0, M' = ?, N' = ?;
  };
  transition t17 := {
    from   := f63;
    to     := f71;
    guard  := B > 0;
    action := L' = 0, M' = ?, N' = ?;
  };
  transition t18 := {
    from   := f63;
    to     := f71;
    guard  := B = 0;
    action := B' = 0, L' = 1, M' = ?, N' = ?;
  };
  transition t19 := {
    from   := f52;
    to     := f63;
    guard  := 0 > A && F + 1 >= C;
    action := M' = ?, N' = ?;
  };
  transition t20 := {
    from   := f52;
    to     := f63;
    guard  := A > 0 && F + 1 >= C;
    action := M' = ?, N' = ?;
  };
  transition t21 := {
    from   := f52;
    to     := f71;
    guard  := F + 1 >= C && A = 0;
    action := A' = 0, L' = 1, M' = ?, N' = ?;
  };
  transition t22 := {
    from   := f33;
    to     := f44;
    guard  := 0 > A && H >= C;
    action := M' = ?, N' = ?;
  };
  transition t23 := {
    from   := f33;
    to     := f44;
    guard  := A > 0 && H >= C;
    action := M' = ?, N' = ?;
  };
  transition t24 := {
    from   := f33;
    to     := f29;
    guard  := H >= C && A = 0;
    action := A' = 0, F' = F + 1, J' = 0, M' = ?, N' = ?;
  };
  transition t25 := {
    from   := f29;
    to     := f52;
    guard  := F >= C;
    action := F' = 0, M' = ?, N' = ?;
  };
  transition t26 := {
    from   := f23;
    to     := f29;
    guard  := F >= C;
    action := F' = 0, M' = ?, N' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
