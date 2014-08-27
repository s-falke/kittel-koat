model main {
  var A, B, C, D;
  states f0, f10001, f2, f1200, f2200, f10000, f12, f100, f110, f120, f1000;
  transition t0 := {
    from   := f0;
    to     := f10001;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := f2;
    to     := f2;
    guard  := true;
    action := ;
  };
  transition t2 := {
    from   := f2;
    to     := f10001;
    guard  := true;
    action := ;
  };
  transition t3 := {
    from   := f2;
    to     := f1200;
    guard  := true;
    action := A' = B;
  };
  transition t4 := {
    from   := f2200;
    to     := f10000;
    guard  := C = 0;
    action := C' = 0;
  };
  transition t5 := {
    from   := f12;
    to     := f12;
    guard  := true;
    action := ;
  };
  transition t6 := {
    from   := f100;
    to     := f110;
    guard  := true;
    action := B' = 1;
  };
  transition t7 := {
    from   := f110;
    to     := f120;
    guard  := true;
    action := B' = 2;
  };
  transition t8 := {
    from   := f120;
    to     := f120;
    guard  := true;
    action := ;
  };
  transition t9 := {
    from   := f1200;
    to     := f1200;
    guard  := true;
    action := ;
  };
  transition t10 := {
    from   := f0;
    to     := f2;
    guard  := true;
    action := B' = 2;
  };
  transition t11 := {
    from   := f0;
    to     := f10001;
    guard  := true;
    action := B' = 1;
  };
  transition t12 := {
    from   := f0;
    to     := f110;
    guard  := true;
    action := B' = 1, A' = 1;
  };
  transition t13 := {
    from   := f0;
    to     := f12;
    guard  := true;
    action := B' = 2, A' = B;
  };
  transition t14 := {
    from   := f12;
    to     := f10001;
    guard  := true;
    action := D' = 1;
  };
  transition t15 := {
    from   := f0;
    to     := f10001;
    guard  := true;
    action := A' = B, D' = 1;
  };
  transition t16 := {
    from   := f0;
    to     := f10001;
    guard  := true;
    action := B' = 1, A' = B, D' = 1;
  };
  transition t17 := {
    from   := f100;
    to     := f10001;
    guard  := true;
    action := D' = 1;
  };
  transition t18 := {
    from   := f110;
    to     := f10001;
    guard  := true;
    action := D' = 1;
  };
  transition t19 := {
    from   := f120;
    to     := f10001;
    guard  := true;
    action := D' = 1;
  };
  transition t20 := {
    from   := f1000;
    to     := f1200;
    guard  := true;
    action := B' = 2;
  };
  transition t21 := {
    from   := f1000;
    to     := f10001;
    guard  := true;
    action := D' = 1;
  };
  transition t22 := {
    from   := f1200;
    to     := f10001;
    guard  := true;
    action := D' = 1;
  };
  transition t23 := {
    from   := f1000;
    to     := f10001;
    guard  := true;
    action := B' = 1, D' = 1;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
