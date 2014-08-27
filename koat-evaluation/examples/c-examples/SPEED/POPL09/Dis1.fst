model main {
  var A, B, C, D;
  states evalDis1start, evalDis1entryin, evalDis1bb3in, evalDis1bbin, evalDis1returnin, evalDis1bb1in, evalDis1bb2in, evalDis1stop;
  transition t0 := {
    from   := evalDis1start;
    to     := evalDis1entryin;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := evalDis1entryin;
    to     := evalDis1bb3in;
    guard  := true;
    action := A' = B, C' = D, B' = A, D' = C;
  };
  transition t2 := {
    from   := evalDis1bb3in;
    to     := evalDis1bbin;
    guard  := A > B;
    action := ;
  };
  transition t3 := {
    from   := evalDis1bb3in;
    to     := evalDis1returnin;
    guard  := B >= A;
    action := ;
  };
  transition t4 := {
    from   := evalDis1bbin;
    to     := evalDis1bb1in;
    guard  := C > D;
    action := ;
  };
  transition t5 := {
    from   := evalDis1bbin;
    to     := evalDis1bb2in;
    guard  := D >= C;
    action := ;
  };
  transition t6 := {
    from   := evalDis1bb1in;
    to     := evalDis1bb3in;
    guard  := true;
    action := D' = D + 1;
  };
  transition t7 := {
    from   := evalDis1bb2in;
    to     := evalDis1bb3in;
    guard  := true;
    action := B' = B + 1;
  };
  transition t8 := {
    from   := evalDis1returnin;
    to     := evalDis1stop;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = evalDis1start };
}
