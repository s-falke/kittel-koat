model main {
  var A, B, C, D;
  states eval0, eval1, end, eval3, eval5, eval7, eval9, eval11;
  transition t0 := {
    from   := eval0;
    to     := eval1;
    guard  := true;
    action := A' = B, C' = 1;
  };
  transition t1 := {
    from   := eval1;
    to     := end;
    guard  := A > 100;
    action := ;
  };
  transition t2 := {
    from   := eval1;
    to     := eval3;
    guard  := 100 >= A;
    action := ;
  };
  transition t3 := {
    from   := eval3;
    to     := eval3;
    guard  := 100 >= A;
    action := A' = A + 11, C' = C + 1;
  };
  transition t4 := {
    from   := eval3;
    to     := eval5;
    guard  := A > 100;
    action := ;
  };
  transition t5 := {
    from   := eval5;
    to     := eval7;
    guard  := C > 1;
    action := A' = A - 10, C' = C - 1;
  };
  transition t6 := {
    from   := eval7;
    to     := eval5;
    guard  := A > 100 && C = 1;
    action := D' = A - 10;
  };
  transition t7 := {
    from   := eval7;
    to     := eval9;
    guard  := 100 >= A;
    action := ;
  };
  transition t8 := {
    from   := eval7;
    to     := eval9;
    guard  := 2 >= C;
    action := ;
  };
  transition t9 := {
    from   := eval7;
    to     := eval9;
    guard  := C >= 0;
    action := ;
  };
  transition t10 := {
    from   := eval9;
    to     := eval11;
    guard  := A > 100;
    action := A' = A - 10, C' = C - 1;
  };
  transition t11 := {
    from   := eval9;
    to     := eval11;
    guard  := 100 >= A;
    action := ;
  };
  transition t12 := {
    from   := eval11;
    to     := eval5;
    guard  := true;
    action := A' = A + 11, C' = C + 1;
  };
}
strategy dumb {
  Region init := { state = eval0 };
}
