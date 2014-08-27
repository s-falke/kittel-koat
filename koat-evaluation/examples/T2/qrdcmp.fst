model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U;
  states f0, f10, f13, f29, f34, f53, f55, f61, f73;
  transition t0 := {
    from   := f0;
    to     := f10;
    guard  := A > 1;
    action := S' = ?, T' = ?, U' = ?;
  };
  transition t1 := {
    from   := f10;
    to     := f13;
    guard  := A > B;
    action := C' = 0, S' = ?, T' = ?, U' = ?;
  };
  transition t2 := {
    from   := f13;
    to     := f13;
    guard  := C > S && A >= D;
    action := D' = D + 1, E' = C, F' = S, G' = S, S' = ?, T' = ?, U' = ?;
  };
  transition t3 := {
    from   := f13;
    to     := f13;
    guard  := S >= C && A >= D;
    action := C' = S, D' = D + 1, E' = C, F' = S, G' = S, S' = ?, T' = ?, U' = ?;
  };
  transition t4 := {
    from   := f29;
    to     := f29;
    guard  := A >= D;
    action := D' = D + 1, S' = ?, T' = ?, U' = ?;
  };
  transition t5 := {
    from   := f34;
    to     := f34;
    guard  := A >= D;
    action := D' = D + 1, H' = 0, I' = 0, S' = ?, T' = ?, U' = ?;
  };
  transition t6 := {
    from   := f34;
    to     := f34;
    guard  := 0 > S && A >= D;
    action := D' = D + 1, H' = S, I' = T, J' = J + T, S' = ?, T' = ?, U' = ?;
  };
  transition t7 := {
    from   := f34;
    to     := f34;
    guard  := S > 0 && A >= D;
    action := D' = D + 1, H' = S, I' = T, J' = J + T, S' = ?, T' = ?, U' = ?;
  };
  transition t8 := {
    from   := f53;
    to     := f55;
    guard  := A >= K;
    action := S' = ?, T' = ?, U' = ?;
  };
  transition t9 := {
    from   := f55;
    to     := f55;
    guard  := A >= D;
    action := D' = D + 1, J' = S, S' = ?, T' = ?, U' = ?;
  };
  transition t10 := {
    from   := f61;
    to     := f61;
    guard  := A >= D;
    action := D' = D + 1, S' = ?, T' = ?, U' = ?;
  };
  transition t11 := {
    from   := f61;
    to     := f53;
    guard  := D > A;
    action := K' = K + 1, S' = ?, T' = ?, U' = ?;
  };
  transition t12 := {
    from   := f55;
    to     := f61;
    guard  := D > A;
    action := L' = S, S' = ?, T' = ?, U' = ?;
  };
  transition t13 := {
    from   := f53;
    to     := f10;
    guard  := K > A;
    action := B' = B + 1, S' = ?, T' = ?, U' = ?;
  };
  transition t14 := {
    from   := f34;
    to     := f53;
    guard  := D > A;
    action := M' = S, N' = T, O' = T, S' = ?, T' = ?, U' = ?;
  };
  transition t15 := {
    from   := f34;
    to     := f53;
    guard  := 0 > U && D > A;
    action := O' = -S, P' = T, Q' = S, S' = ?, T' = ?, U' = ?;
  };
  transition t16 := {
    from   := f29;
    to     := f34;
    guard  := D > A;
    action := S' = ?, T' = ?, U' = ?;
  };
  transition t17 := {
    from   := f13;
    to     := f10;
    guard  := D > A && C = 0;
    action := B' = B + 1, C' = 0, R' = 0, S' = ?, T' = ?, U' = ?;
  };
  transition t18 := {
    from   := f13;
    to     := f29;
    guard  := 0 > C && D > A;
    action := S' = ?, T' = ?, U' = ?;
  };
  transition t19 := {
    from   := f13;
    to     := f29;
    guard  := C > 0 && D > A;
    action := S' = ?, T' = ?, U' = ?;
  };
  transition t20 := {
    from   := f10;
    to     := f73;
    guard  := B >= A && 0 > S;
    action := S' = ?, T' = ?, U' = ?;
  };
  transition t21 := {
    from   := f10;
    to     := f73;
    guard  := B >= A;
    action := S' = ?, T' = ?, U' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
