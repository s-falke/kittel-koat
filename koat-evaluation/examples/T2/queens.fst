model main {
  var A, B, C, D, E, F, G, H, I, J, K, L;
  states f30, f31, f36, f37, f38, f0, f10, f16, f19, f27, f49, f56;
  transition t0 := {
    from   := f30;
    to     := f31;
    guard  := 0 > A;
    action := K' = ?, L' = ?;
  };
  transition t1 := {
    from   := f30;
    to     := f31;
    guard  := A > 0;
    action := K' = ?, L' = ?;
  };
  transition t2 := {
    from   := f36;
    to     := f37;
    guard  := 0 > A;
    action := K' = ?, L' = ?;
  };
  transition t3 := {
    from   := f36;
    to     := f37;
    guard  := A > 0;
    action := K' = ?, L' = ?;
  };
  transition t4 := {
    from   := f37;
    to     := f38;
    guard  := B + K > C + L;
    action := K' = ?, L' = ?;
  };
  transition t5 := {
    from   := f37;
    to     := f38;
    guard  := C + K > B + L;
    action := K' = ?, L' = ?;
  };
  transition t6 := {
    from   := f0;
    to     := f10;
    guard  := true;
    action := D' = 9, E' = 1, A' = 1, F' = K, C' = 0, K' = ?, L' = ?;
  };
  transition t7 := {
    from   := f10;
    to     := f10;
    guard  := D > C;
    action := C' = C + 1, K' = ?, L' = ?;
  };
  transition t8 := {
    from   := f16;
    to     := f19;
    guard  := 0 > E && D > C;
    action := K' = ?, L' = ?;
  };
  transition t9 := {
    from   := f16;
    to     := f19;
    guard  := E > 0 && D > C;
    action := K' = ?, L' = ?;
  };
  transition t10 := {
    from   := f19;
    to     := f27;
    guard  := D > K;
    action := E' = 1, G' = 1, B' = 0, K' = ?, L' = ?;
  };
  transition t11 := {
    from   := f19;
    to     := f27;
    guard  := true;
    action := E' = 0, G' = 0, B' = 0, K' = ?, L' = ?;
  };
  transition t12 := {
    from   := f19;
    to     := f27;
    guard  := 0 > K;
    action := E' = 0, G' = 0, B' = 0, K' = ?, L' = ?;
  };
  transition t13 := {
    from   := f16;
    to     := f27;
    guard  := D > C && E = 0;
    action := E' = 0, G' = 0, B' = 0, K' = ?, L' = ?;
  };
  transition t14 := {
    from   := f27;
    to     := f30;
    guard  := D > B && B > C;
    action := K' = ?, L' = ?;
  };
  transition t15 := {
    from   := f27;
    to     := f30;
    guard  := C > B && D > B;
    action := K' = ?, L' = ?;
  };
  transition t16 := {
    from   := f31;
    to     := f36;
    guard  := K > L;
    action := A' = 1, H' = 1, K' = ?, L' = ?;
  };
  transition t17 := {
    from   := f31;
    to     := f36;
    guard  := true;
    action := A' = 1, H' = 1, K' = ?, L' = ?;
  };
  transition t18 := {
    from   := f31;
    to     := f36;
    guard  := true;
    action := A' = 0, H' = 0, K' = ?, L' = ?;
  };
  transition t19 := {
    from   := f30;
    to     := f36;
    guard  := A = 0;
    action := A' = 0, H' = 0, K' = ?, L' = ?;
  };
  transition t20 := {
    from   := f27;
    to     := f27;
    guard  := D > B && C = B;
    action := B' = C + 1, K' = ?, L' = ?;
  };
  transition t21 := {
    from   := f38;
    to     := f27;
    guard  := B + K > C + L;
    action := A' = 1, B' = B + 1, I' = 1, K' = ?, L' = ?;
  };
  transition t22 := {
    from   := f38;
    to     := f27;
    guard  := C + K > B + L;
    action := A' = 1, B' = B + 1, I' = 1, K' = ?, L' = ?;
  };
  transition t23 := {
    from   := f38;
    to     := f27;
    guard  := true;
    action := A' = 0, B' = B + 1, I' = 0, K' = ?, L' = ?;
  };
  transition t24 := {
    from   := f37;
    to     := f27;
    guard  := true;
    action := A' = 0, B' = B + 1, I' = 0, K' = ?, L' = ?;
  };
  transition t25 := {
    from   := f36;
    to     := f27;
    guard  := A = 0;
    action := A' = 0, B' = B + 1, I' = 0, K' = ?, L' = ?;
  };
  transition t26 := {
    from   := f49;
    to     := f56;
    guard  := 0 > A;
    action := J' = 0, K' = ?, L' = ?;
  };
  transition t27 := {
    from   := f49;
    to     := f56;
    guard  := A > 0;
    action := J' = 0, K' = ?, L' = ?;
  };
  transition t28 := {
    from   := f49;
    to     := f56;
    guard  := A = 0;
    action := A' = 0, J' = 1, K' = ?, L' = ?;
  };
  transition t29 := {
    from   := f27;
    to     := f16;
    guard  := B >= D;
    action := C' = C + 1, K' = ?, L' = ?;
  };
  transition t30 := {
    from   := f16;
    to     := f49;
    guard  := 0 > E && C >= D;
    action := K' = ?, L' = ?;
  };
  transition t31 := {
    from   := f16;
    to     := f49;
    guard  := E > 0 && C >= D;
    action := K' = ?, L' = ?;
  };
  transition t32 := {
    from   := f16;
    to     := f56;
    guard  := C >= D && E = 0;
    action := E' = 0, J' = 1, K' = ?, L' = ?;
  };
  transition t33 := {
    from   := f10;
    to     := f16;
    guard  := C >= D;
    action := C' = 0, K' = ?, L' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
