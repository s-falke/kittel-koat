model main {
  var A, B, C;
  states evalwhile2start, evalwhile2entryin, evalwhile2bb4in, evalwhile2bb2in, evalwhile2returnin, evalwhile2bb1in, evalwhile2bb3in, evalwhile2stop;
  transition t0 := {
    from   := evalwhile2start;
    to     := evalwhile2entryin;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := evalwhile2entryin;
    to     := evalwhile2bb4in;
    guard  := true;
    action := A' = B;
  };
  transition t2 := {
    from   := evalwhile2bb4in;
    to     := evalwhile2bb2in;
    guard  := A > 0;
    action := C' = B;
  };
  transition t3 := {
    from   := evalwhile2bb4in;
    to     := evalwhile2returnin;
    guard  := 0 >= A;
    action := ;
  };
  transition t4 := {
    from   := evalwhile2bb2in;
    to     := evalwhile2bb1in;
    guard  := C > 0;
    action := ;
  };
  transition t5 := {
    from   := evalwhile2bb2in;
    to     := evalwhile2bb3in;
    guard  := 0 >= C;
    action := ;
  };
  transition t6 := {
    from   := evalwhile2bb1in;
    to     := evalwhile2bb2in;
    guard  := true;
    action := C' = C - 1;
  };
  transition t7 := {
    from   := evalwhile2bb3in;
    to     := evalwhile2bb4in;
    guard  := true;
    action := A' = A - 1;
  };
  transition t8 := {
    from   := evalwhile2returnin;
    to     := evalwhile2stop;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = evalwhile2start };
}
