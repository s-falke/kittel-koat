model main {
  var A, B, C;
  states evalspeedpldi2start, evalspeedpldi2entryin, evalspeedpldi2bb5in, evalspeedpldi2returnin, evalspeedpldi2bb2in, evalspeedpldi2bb3in, evalspeedpldi2stop;
  transition t0 := {
    from   := evalspeedpldi2start;
    to     := evalspeedpldi2entryin;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := evalspeedpldi2entryin;
    to     := evalspeedpldi2bb5in;
    guard  := A >= 0 && B > 0;
    action := A' = B, B' = 0, C' = A;
  };
  transition t2 := {
    from   := evalspeedpldi2entryin;
    to     := evalspeedpldi2returnin;
    guard  := 0 > A;
    action := ;
  };
  transition t3 := {
    from   := evalspeedpldi2entryin;
    to     := evalspeedpldi2returnin;
    guard  := 0 >= B;
    action := ;
  };
  transition t4 := {
    from   := evalspeedpldi2bb5in;
    to     := evalspeedpldi2bb2in;
    guard  := C > 0;
    action := ;
  };
  transition t5 := {
    from   := evalspeedpldi2bb5in;
    to     := evalspeedpldi2returnin;
    guard  := 0 >= C;
    action := ;
  };
  transition t6 := {
    from   := evalspeedpldi2bb2in;
    to     := evalspeedpldi2bb3in;
    guard  := A > B;
    action := ;
  };
  transition t7 := {
    from   := evalspeedpldi2bb2in;
    to     := evalspeedpldi2bb5in;
    guard  := B >= A;
    action := B' = 0;
  };
  transition t8 := {
    from   := evalspeedpldi2bb3in;
    to     := evalspeedpldi2bb5in;
    guard  := true;
    action := B' = B + 1, C' = C - 1;
  };
  transition t9 := {
    from   := evalspeedpldi2returnin;
    to     := evalspeedpldi2stop;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = evalspeedpldi2start };
}
