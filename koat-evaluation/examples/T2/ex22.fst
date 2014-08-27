model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X;
  states f0, f17, f20, f45, f26, f29, f57, f60, f85, f66, f69, f97, f100, f125, f106, f109, f137, f140, f146, f149, f166;
  transition t0 := {
    from   := f0;
    to     := f17;
    guard  := true;
    action := A' = 100, B' = 0;
  };
  transition t1 := {
    from   := f0;
    to     := f17;
    guard  := true;
    action := A' = 100, B' = 10;
  };
  transition t2 := {
    from   := f17;
    to     := f20;
    guard  := 0 > B;
    action := C' = B;
  };
  transition t3 := {
    from   := f17;
    to     := f20;
    guard  := B > 0;
    action := C' = B;
  };
  transition t4 := {
    from   := f17;
    to     := f45;
    guard  := B = 0;
    action := B' = 0, C' = 0;
  };
  transition t5 := {
    from   := f20;
    to     := f26;
    guard  := true;
    action := D' = 0;
  };
  transition t6 := {
    from   := f20;
    to     := f26;
    guard  := true;
    action := D' = 10;
  };
  transition t7 := {
    from   := f26;
    to     := f45;
    guard  := D = 0;
    action := D' = 0, E' = 0;
  };
  transition t8 := {
    from   := f26;
    to     := f29;
    guard  := 0 > D;
    action := E' = D, F' = 0;
  };
  transition t9 := {
    from   := f26;
    to     := f29;
    guard  := D > 0;
    action := E' = D, F' = 0;
  };
  transition t10 := {
    from   := f45;
    to     := f57;
    guard  := true;
    action := G' = 200, H' = 0;
  };
  transition t11 := {
    from   := f45;
    to     := f57;
    guard  := true;
    action := G' = 200, H' = 10;
  };
  transition t12 := {
    from   := f57;
    to     := f60;
    guard  := 0 > H;
    action := I' = H;
  };
  transition t13 := {
    from   := f57;
    to     := f60;
    guard  := H > 0;
    action := I' = H;
  };
  transition t14 := {
    from   := f57;
    to     := f85;
    guard  := H = 0;
    action := H' = 0, I' = 0;
  };
  transition t15 := {
    from   := f60;
    to     := f66;
    guard  := true;
    action := J' = 0;
  };
  transition t16 := {
    from   := f60;
    to     := f66;
    guard  := true;
    action := J' = 10;
  };
  transition t17 := {
    from   := f66;
    to     := f85;
    guard  := J = 0;
    action := J' = 0, K' = 0;
  };
  transition t18 := {
    from   := f66;
    to     := f69;
    guard  := 0 > J;
    action := K' = J, L' = 0;
  };
  transition t19 := {
    from   := f66;
    to     := f69;
    guard  := J > 0;
    action := K' = J, L' = 0;
  };
  transition t20 := {
    from   := f85;
    to     := f97;
    guard  := true;
    action := M' = 50, N' = 0;
  };
  transition t21 := {
    from   := f85;
    to     := f97;
    guard  := true;
    action := M' = 50, N' = 10;
  };
  transition t22 := {
    from   := f97;
    to     := f100;
    guard  := 0 > N;
    action := O' = N;
  };
  transition t23 := {
    from   := f97;
    to     := f100;
    guard  := N > 0;
    action := O' = N;
  };
  transition t24 := {
    from   := f97;
    to     := f125;
    guard  := N = 0;
    action := N' = 0, O' = 0;
  };
  transition t25 := {
    from   := f100;
    to     := f106;
    guard  := true;
    action := P' = 0;
  };
  transition t26 := {
    from   := f100;
    to     := f106;
    guard  := true;
    action := P' = 10;
  };
  transition t27 := {
    from   := f106;
    to     := f125;
    guard  := P = 0;
    action := P' = 0, Q' = 0;
  };
  transition t28 := {
    from   := f106;
    to     := f109;
    guard  := 0 > P;
    action := Q' = P, R' = 0;
  };
  transition t29 := {
    from   := f106;
    to     := f109;
    guard  := P > 0;
    action := Q' = P, R' = 0;
  };
  transition t30 := {
    from   := f125;
    to     := f137;
    guard  := true;
    action := S' = 20, T' = 0;
  };
  transition t31 := {
    from   := f125;
    to     := f137;
    guard  := true;
    action := S' = 20, T' = 10;
  };
  transition t32 := {
    from   := f137;
    to     := f140;
    guard  := 0 > T;
    action := U' = T;
  };
  transition t33 := {
    from   := f137;
    to     := f140;
    guard  := T > 0;
    action := U' = T;
  };
  transition t34 := {
    from   := f140;
    to     := f146;
    guard  := true;
    action := V' = 0;
  };
  transition t35 := {
    from   := f140;
    to     := f146;
    guard  := true;
    action := V' = 10;
  };
  transition t36 := {
    from   := f146;
    to     := f149;
    guard  := 0 > V;
    action := W' = V, X' = 0;
  };
  transition t37 := {
    from   := f146;
    to     := f149;
    guard  := V > 0;
    action := W' = V, X' = 0;
  };
  transition t38 := {
    from   := f137;
    to     := f166;
    guard  := T = 0;
    action := T' = 0, U' = 0;
  };
  transition t39 := {
    from   := f146;
    to     := f166;
    guard  := V = 0;
    action := V' = 0, W' = 0;
  };
  transition t40 := {
    from   := f149;
    to     := f149;
    guard  := S > X;
    action := X' = X + 1;
  };
  transition t41 := {
    from   := f149;
    to     := f166;
    guard  := X >= S;
    action := ;
  };
  transition t42 := {
    from   := f109;
    to     := f109;
    guard  := M > R;
    action := R' = R + 1;
  };
  transition t43 := {
    from   := f109;
    to     := f125;
    guard  := R >= M;
    action := ;
  };
  transition t44 := {
    from   := f69;
    to     := f69;
    guard  := G > L;
    action := L' = L + 1;
  };
  transition t45 := {
    from   := f69;
    to     := f85;
    guard  := L >= G;
    action := ;
  };
  transition t46 := {
    from   := f29;
    to     := f29;
    guard  := A > F;
    action := F' = F + 1;
  };
  transition t47 := {
    from   := f29;
    to     := f45;
    guard  := F >= A;
    action := ;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
