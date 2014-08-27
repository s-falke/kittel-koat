model main {
  var A, B, C, D;
  states start, stop, lbl6, cut, lbl101, lbl111, start0;
  transition t0 := {
    from   := start;
    to     := stop;
    guard  := 0 >= A && B = C && D = A;
    action := ;
  };
  transition t1 := {
    from   := start;
    to     := lbl6;
    guard  := A > 0 && 0 >= C && B = C && D = A;
    action := ;
  };
  transition t2 := {
    from   := start;
    to     := cut;
    guard  := A > 0 && D = A && B = A && C = A;
    action := ;
  };
  transition t3 := {
    from   := start;
    to     := lbl101;
    guard  := A > 0 && C > A && B = C && D = A;
    action := B' = B - D;
  };
  transition t4 := {
    from   := start;
    to     := lbl111;
    guard  := A > C && C > 0 && B = C && D = A;
    action := D' = D - B;
  };
  transition t5 := {
    from   := lbl6;
    to     := stop;
    guard  := A > 0 && 0 >= C && D = A && B = C;
    action := ;
  };
  transition t6 := {
    from   := lbl101;
    to     := cut;
    guard  := A >= B && B > 0 && C >= 2*B && D = B;
    action := ;
  };
  transition t7 := {
    from   := lbl101;
    to     := lbl101;
    guard  := B > D && A >= D && B > 0 && D > 0 && C >= D + B;
    action := B' = B - D;
  };
  transition t8 := {
    from   := lbl101;
    to     := lbl111;
    guard  := D > B && A >= D && B > 0 && D > 0 && C >= D + B;
    action := D' = D - B;
  };
  transition t9 := {
    from   := lbl111;
    to     := cut;
    guard  := C >= B && B > 0 && A >= 2*B && D = B;
    action := ;
  };
  transition t10 := {
    from   := lbl111;
    to     := lbl101;
    guard  := B > D && C >= B && B > 0 && D > 0 && A >= D + B;
    action := B' = B - D;
  };
  transition t11 := {
    from   := lbl111;
    to     := lbl111;
    guard  := D > B && C >= B && B > 0 && D > 0 && A >= D + B;
    action := D' = D - B;
  };
  transition t12 := {
    from   := cut;
    to     := stop;
    guard  := A >= B && B > 0 && C >= B && D = B;
    action := ;
  };
  transition t13 := {
    from   := start0;
    to     := start;
    guard  := true;
    action := D' = A, B' = C;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
