model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q;
  states f48, f52, f46, f2, f10, f14, f23, f27, f42, f44, f59, f63, f1;
  transition t0 := {
    from   := f48;
    to     := f52;
    guard  := A > 0;
    action := ;
  };
  transition t1 := {
    from   := f52;
    to     := f46;
    guard  := 0 >= B;
    action := ;
  };
  transition t2 := {
    from   := f2;
    to     := f10;
    guard  := C >= 0 && D > 0;
    action := E' = 0, F' = 1, G' = 0;
  };
  transition t3 := {
    from   := f10;
    to     := f14;
    guard  := D > G && 0 >= G;
    action := H' = 1;
  };
  transition t4 := {
    from   := f10;
    to     := f14;
    guard  := D > G && G > 0;
    action := H' = 0;
  };
  transition t5 := {
    from   := f14;
    to     := f23;
    guard  := I >= 0 && G + 1 >= D && 1 >= I;
    action := J' = 1, K' = L;
  };
  transition t6 := {
    from   := f14;
    to     := f23;
    guard  := I >= 0 && D > 1 + G && 1 >= I;
    action := J' = 0, K' = L;
  };
  transition t7 := {
    from   := f23;
    to     := f27;
    guard  := I > 0 && 0 >= C && 0 >= E;
    action := E' = E + 1;
  };
  transition t8 := {
    from   := f23;
    to     := f27;
    guard  := I > 0 && 0 >= C && E = 1;
    action := E' = E + 1;
  };
  transition t9 := {
    from   := f23;
    to     := f27;
    guard  := E > 1 && C = 0;
    action := E' = 0, F' = F + 1;
  };
  transition t10 := {
    from   := f23;
    to     := f27;
    guard  := C > 0;
    action := C' = C - 1;
  };
  transition t11 := {
    from   := f27;
    to     := f42;
    guard  := M > 0 && I > 0;
    action := A' = H, B' = J, N' = K, M' = 1;
  };
  transition t12 := {
    from   := f27;
    to     := f42;
    guard  := 0 >= M && I > 0;
    action := A' = H, B' = J, N' = K, M' = 1, O' = K;
  };
  transition t13 := {
    from   := f42;
    to     := f44;
    guard  := 0 > A && N = O;
    action := O' = N;
  };
  transition t14 := {
    from   := f42;
    to     := f44;
    guard  := A > 0 && N = O;
    action := O' = N;
  };
  transition t15 := {
    from   := f42;
    to     := f48;
    guard  := A = 0 && N = O;
    action := A' = 0, O' = N;
  };
  transition t16 := {
    from   := f44;
    to     := f46;
    guard  := B = 0;
    action := B' = 0, P' = 1;
  };
  transition t17 := {
    from   := f44;
    to     := f48;
    guard  := 0 > B;
    action := ;
  };
  transition t18 := {
    from   := f44;
    to     := f48;
    guard  := B > 0;
    action := ;
  };
  transition t19 := {
    from   := f48;
    to     := f46;
    guard  := 0 >= B && 0 >= A;
    action := P' = 2;
  };
  transition t20 := {
    from   := f48;
    to     := f52;
    guard  := B > 0 && 0 >= A;
    action := ;
  };
  transition t21 := {
    from   := f52;
    to     := f46;
    guard  := B > 0;
    action := P' = 3;
  };
  transition t22 := {
    from   := f42;
    to     := f59;
    guard  := Q >= 0 && N > O && 1 >= Q;
    action := ;
  };
  transition t23 := {
    from   := f42;
    to     := f59;
    guard  := Q >= 0 && O > N && 1 >= Q;
    action := ;
  };
  transition t24 := {
    from   := f46;
    to     := f59;
    guard  := Q >= 0 && O > 0 && 1 >= Q;
    action := O' = 0;
  };
  transition t25 := {
    from   := f46;
    to     := f59;
    guard  := Q >= 0 && 0 >= O && 1 >= Q;
    action := O' = 1;
  };
  transition t26 := {
    from   := f59;
    to     := f63;
    guard  := Q > 0 && 0 >= C && 0 >= E;
    action := E' = E + 1;
  };
  transition t27 := {
    from   := f59;
    to     := f63;
    guard  := Q > 0 && 0 >= C && E = 1;
    action := E' = E + 1;
  };
  transition t28 := {
    from   := f59;
    to     := f63;
    guard  := E > 1 && C = 0;
    action := E' = 0, F' = F + 1;
  };
  transition t29 := {
    from   := f59;
    to     := f63;
    guard  := C > 0;
    action := C' = C - 1;
  };
  transition t30 := {
    from   := f63;
    to     := f23;
    guard  := I >= 0 && 1 >= I && 0 >= Q && D >= F;
    action := ;
  };
  transition t31 := {
    from   := f63;
    to     := f23;
    guard  := I >= 0 && 1 >= I && Q > 1 && D >= F;
    action := ;
  };
  transition t32 := {
    from   := f27;
    to     := f23;
    guard  := D >= F && I = 0;
    action := ;
  };
  transition t33 := {
    from   := f63;
    to     := f10;
    guard  := L > 0 && D >= F && Q = 1;
    action := G' = G + 1, Q' = 1, L' = 0;
  };
  transition t34 := {
    from   := f63;
    to     := f10;
    guard  := 0 >= L && D >= F && Q = 1;
    action := G' = G + 1, Q' = 1, L' = 1;
  };
  transition t35 := {
    from   := f10;
    to     := f1;
    guard  := G >= D;
    action := ;
  };
}
strategy dumb {
  Region init := { state = f2 };
}
