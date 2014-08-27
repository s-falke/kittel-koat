model main {
  var A, B, C;
  states evalEx7start, evalEx7entryin, evalEx7bb3in, evalEx7bbin, evalEx7returnin, evalEx7stop;
  transition t0 := {
    from   := evalEx7start;
    to     := evalEx7entryin;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := evalEx7entryin;
    to     := evalEx7bb3in;
    guard  := A > 0 && B > A;
    action := C' = A + 1;
  };
  transition t2 := {
    from   := evalEx7bb3in;
    to     := evalEx7bbin;
    guard  := A > C;
    action := ;
  };
  transition t3 := {
    from   := evalEx7bb3in;
    to     := evalEx7bbin;
    guard  := C > A;
    action := ;
  };
  transition t4 := {
    from   := evalEx7bb3in;
    to     := evalEx7returnin;
    guard  := C = A;
    action := ;
  };
  transition t5 := {
    from   := evalEx7bbin;
    to     := evalEx7bb3in;
    guard  := C > B;
    action := C' = 0;
  };
  transition t6 := {
    from   := evalEx7bbin;
    to     := evalEx7bb3in;
    guard  := B >= C;
    action := C' = C + 1;
  };
  transition t7 := {
    from   := evalEx7returnin;
    to     := evalEx7stop;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = evalEx7start };
}
