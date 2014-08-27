model main {
  var A, B, C;
  states evalDis2start, evalDis2entryin, evalDis2bb3in, evalDis2bbin, evalDis2returnin, evalDis2bb1in, evalDis2bb2in, evalDis2stop;
  transition t0 := {
    from   := evalDis2start;
    to     := evalDis2entryin;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := evalDis2entryin;
    to     := evalDis2bb3in;
    guard  := true;
    action := A' = B, C' = A, B' = C;
  };
  transition t2 := {
    from   := evalDis2bb3in;
    to     := evalDis2bbin;
    guard  := A > C;
    action := ;
  };
  transition t3 := {
    from   := evalDis2bb3in;
    to     := evalDis2returnin;
    guard  := C >= A;
    action := ;
  };
  transition t4 := {
    from   := evalDis2bbin;
    to     := evalDis2bb1in;
    guard  := B > C;
    action := ;
  };
  transition t5 := {
    from   := evalDis2bbin;
    to     := evalDis2bb2in;
    guard  := C >= B;
    action := ;
  };
  transition t6 := {
    from   := evalDis2bb1in;
    to     := evalDis2bb3in;
    guard  := true;
    action := C' = C + 1;
  };
  transition t7 := {
    from   := evalDis2bb2in;
    to     := evalDis2bb3in;
    guard  := true;
    action := B' = B + 1;
  };
  transition t8 := {
    from   := evalDis2returnin;
    to     := evalDis2stop;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = evalDis2start };
}
