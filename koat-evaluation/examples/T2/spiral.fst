model main {
  var A, B;
  states f0, f2;
  transition t0 := {
    from   := f0;
    to     := f2;
    guard  := A > 0 && B > 0;
    action := ;
  };
  transition t1 := {
    from   := f0;
    to     := f2;
    guard  := A > 0 && 0 > B;
    action := ;
  };
  transition t2 := {
    from   := f0;
    to     := f2;
    guard  := 0 > A && B > 0;
    action := ;
  };
  transition t3 := {
    from   := f0;
    to     := f2;
    guard  := 0 > A && 0 > B;
    action := ;
  };
  transition t4 := {
    from   := f2;
    to     := f2;
    guard  := A >= B && B > 1 && A > 0 && A + B > 1;
    action := B' = B - 1;
  };
  transition t5 := {
    from   := f2;
    to     := f2;
    guard  := A >= B && B > 1 && 0 > A && A + B > 1;
    action := B' = B - 1;
  };
  transition t6 := {
    from   := f2;
    to     := f2;
    guard  := A >= B && 0 >= B && A > 0 && A + B > 1;
    action := B' = B - 1;
  };
  transition t7 := {
    from   := f2;
    to     := f2;
    guard  := A >= B && 0 >= B && 0 > A && A + B > 1;
    action := B' = B - 1;
  };
  transition t8 := {
    from   := f2;
    to     := f2;
    guard  := 1 >= A + B && A > B && A > 1 && B > 0;
    action := A' = A - 1;
  };
  transition t9 := {
    from   := f2;
    to     := f2;
    guard  := 1 >= A + B && A > B && A > 1 && 0 > B;
    action := A' = A - 1;
  };
  transition t10 := {
    from   := f2;
    to     := f2;
    guard  := 1 >= A + B && A > B && 0 >= A && B > 0;
    action := A' = A - 1;
  };
  transition t11 := {
    from   := f2;
    to     := f2;
    guard  := 1 >= A + B && A > B && 0 >= A && 0 > B;
    action := A' = A - 1;
  };
  transition t12 := {
    from   := f2;
    to     := f2;
    guard  := B >= A && B >= 0 && A > 0 && 0 > B + A;
    action := B' = B + 1;
  };
  transition t13 := {
    from   := f2;
    to     := f2;
    guard  := B >= A && B >= 0 && 0 > A && 0 > B + A;
    action := B' = B + 1;
  };
  transition t14 := {
    from   := f2;
    to     := f2;
    guard  := B >= A && 0 > B + 1 && A > 0 && 0 > B + A;
    action := B' = B + 1;
  };
  transition t15 := {
    from   := f2;
    to     := f2;
    guard  := B >= A && 0 > B + 1 && 0 > A && 0 > B + A;
    action := B' = B + 1;
  };
  transition t16 := {
    from   := f2;
    to     := f2;
    guard  := B + A >= 0 && B > A && A >= 0 && B > 0;
    action := A' = A + 1;
  };
  transition t17 := {
    from   := f2;
    to     := f2;
    guard  := B + A >= 0 && B > A && A >= 0 && 0 > B;
    action := A' = A + 1;
  };
  transition t18 := {
    from   := f2;
    to     := f2;
    guard  := B + A >= 0 && B > A && 0 > A + 1 && B > 0;
    action := A' = A + 1;
  };
  transition t19 := {
    from   := f2;
    to     := f2;
    guard  := B + A >= 0 && B > A && 0 > A + 1 && 0 > B;
    action := A' = A + 1;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
