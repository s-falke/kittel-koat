model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V;
  states f2, f5, f9, f26, f32, f52, f55, f62, f1;
  transition t0 := {
    from   := f2;
    to     := f5;
    guard  := A > 1;
    action := S' = ?, T' = ?, U' = ?, V' = ?;
  };
  transition t1 := {
    from   := f5;
    to     := f9;
    guard  := A > B;
    action := C' = 0, S' = ?, T' = ?, U' = ?, V' = ?;
  };
  transition t2 := {
    from   := f9;
    to     := f9;
    guard  := C > S && A >= D;
    action := D' = D + 1, E' = C, F' = S, G' = S, S' = ?, T' = ?, U' = ?, V' = ?;
  };
  transition t3 := {
    from   := f9;
    to     := f9;
    guard  := S >= C && A >= D;
    action := C' = S, D' = D + 1, E' = C, F' = S, G' = S, S' = ?, T' = ?, U' = ?, V' = ?;
  };
  transition t4 := {
    from   := f26;
    to     := f26;
    guard  := A >= D;
    action := D' = D + 1, S' = ?, T' = ?, U' = ?, V' = ?;
  };
  transition t5 := {
    from   := f32;
    to     := f32;
    guard  := A >= D;
    action := D' = D + 1, H' = 0, I' = 0, S' = ?, T' = ?, U' = ?, V' = ?;
  };
  transition t6 := {
    from   := f32;
    to     := f32;
    guard  := 0 > S && A >= D;
    action := D' = D + 1, H' = S, I' = S*S, J' = J + S*S, S' = ?, T' = ?, U' = ?, V' = ?;
  };
  transition t7 := {
    from   := f32;
    to     := f32;
    guard  := S > 0 && A >= D;
    action := D' = D + 1, H' = S, I' = S*S, J' = J + S*S, S' = ?, T' = ?, U' = ?, V' = ?;
  };
  transition t8 := {
    from   := f52;
    to     := f55;
    guard  := A >= K;
    action := S' = ?, T' = ?, U' = ?, V' = ?;
  };
  transition t9 := {
    from   := f55;
    to     := f55;
    guard  := A >= D;
    action := D' = D + 1, J' = J + S*T, S' = ?, T' = ?, U' = ?, V' = ?;
  };
  transition t10 := {
    from   := f62;
    to     := f62;
    guard  := A >= D;
    action := D' = D + 1, S' = ?, T' = ?, U' = ?, V' = ?;
  };
  transition t11 := {
    from   := f62;
    to     := f52;
    guard  := D > A;
    action := K' = K + 1, S' = ?, T' = ?, U' = ?, V' = ?;
  };
  transition t12 := {
    from   := f55;
    to     := f62;
    guard  := J >= T*U && T*U + T > J && T >= S && J >= U*V && U*V + V > J && S >= V && D > A;
    action := L' = S, S' = ?, T' = ?, U' = ?, V' = ?;
  };
  transition t13 := {
    from   := f52;
    to     := f5;
    guard  := K > A;
    action := B' = B + 1, S' = ?, T' = ?, U' = ?, V' = ?;
  };
  transition t14 := {
    from   := f32;
    to     := f52;
    guard  := D > A;
    action := M' = S, N' = T, O' = T, S' = ?, T' = ?, U' = ?, V' = ?;
  };
  transition t15 := {
    from   := f32;
    to     := f52;
    guard  := D > A;
    action := O' = -S, P' = T, Q' = S, S' = ?, T' = ?, U' = ?, V' = ?;
  };
  transition t16 := {
    from   := f26;
    to     := f32;
    guard  := D > A;
    action := S' = ?, T' = ?, U' = ?, V' = ?;
  };
  transition t17 := {
    from   := f9;
    to     := f5;
    guard  := D > A && C = 0;
    action := B' = B + 1, C' = 0, R' = 0, S' = ?, T' = ?, U' = ?, V' = ?;
  };
  transition t18 := {
    from   := f9;
    to     := f26;
    guard  := 0 > C && D > A;
    action := S' = ?, T' = ?, U' = ?, V' = ?;
  };
  transition t19 := {
    from   := f9;
    to     := f26;
    guard  := C > 0 && D > A;
    action := S' = ?, T' = ?, U' = ?, V' = ?;
  };
  transition t20 := {
    from   := f5;
    to     := f1;
    guard  := B >= A && 0 > S;
    action := S' = ?, T' = ?, U' = ?, V' = ?;
  };
  transition t21 := {
    from   := f5;
    to     := f1;
    guard  := B >= A && S > 0;
    action := S' = ?, T' = ?, U' = ?, V' = ?;
  };
  transition t22 := {
    from   := f5;
    to     := f1;
    guard  := B >= A;
    action := S' = ?, T' = ?, U' = ?, V' = ?;
  };
}
strategy dumb {
  Region init := { state = f2 };
}
