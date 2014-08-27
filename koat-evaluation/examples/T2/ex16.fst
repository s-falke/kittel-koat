model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R;
  states f0, f18, f10, f25, f33, f40, f48, f52;
  transition t0 := {
    from   := f0;
    to     := f18;
    guard  := true;
    action := A' = 3, B' = 3, C' = 0, D' = 3;
  };
  transition t1 := {
    from   := f10;
    to     := f10;
    guard  := 0 >= A && A >= C;
    action := ;
  };
  transition t2 := {
    from   := f10;
    to     := f10;
    guard  := A > 0 && A >= C;
    action := B' = B + A;
  };
  transition t3 := {
    from   := f18;
    to     := f25;
    guard  := true;
    action := E' = D, F' = D, G' = -3, H' = 4, I' = 0;
  };
  transition t4 := {
    from   := f25;
    to     := f25;
    guard  := 0 >= G && G >= I;
    action := ;
  };
  transition t5 := {
    from   := f25;
    to     := f25;
    guard  := G > 0 && G >= I;
    action := H' = H + G;
  };
  transition t6 := {
    from   := f33;
    to     := f40;
    guard  := true;
    action := J' = K, L' = K, M' = 3, N' = -6, O' = 0;
  };
  transition t7 := {
    from   := f40;
    to     := f40;
    guard  := 0 >= M && M >= O;
    action := ;
  };
  transition t8 := {
    from   := f40;
    to     := f40;
    guard  := M > 0 && M >= O;
    action := N' = N + M;
  };
  transition t9 := {
    from   := f48;
    to     := f52;
    guard  := 4 >= F;
    action := P' = Q, R' = Q;
  };
  transition t10 := {
    from   := f48;
    to     := f52;
    guard  := F > 4;
    action := P' = Q, R' = Q;
  };
  transition t11 := {
    from   := f40;
    to     := f48;
    guard  := O > M;
    action := Q' = N;
  };
  transition t12 := {
    from   := f25;
    to     := f33;
    guard  := I > G;
    action := K' = H;
  };
  transition t13 := {
    from   := f10;
    to     := f18;
    guard  := C > A;
    action := D' = B;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
