model main {
  var A, B, C, D;
  states evalSimpleMultiplestart, evalSimpleMultipleentryin, evalSimpleMultiplebb3in, evalSimpleMultiplebbin, evalSimpleMultiplereturnin, evalSimpleMultiplebb1in, evalSimpleMultiplebb2in, evalSimpleMultiplestop;
  transition t0 := {
    from   := evalSimpleMultiplestart;
    to     := evalSimpleMultipleentryin;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := evalSimpleMultipleentryin;
    to     := evalSimpleMultiplebb3in;
    guard  := true;
    action := A' = 0, B' = 0;
  };
  transition t2 := {
    from   := evalSimpleMultiplebb3in;
    to     := evalSimpleMultiplebbin;
    guard  := C > B;
    action := ;
  };
  transition t3 := {
    from   := evalSimpleMultiplebb3in;
    to     := evalSimpleMultiplereturnin;
    guard  := B >= C;
    action := ;
  };
  transition t4 := {
    from   := evalSimpleMultiplebbin;
    to     := evalSimpleMultiplebb1in;
    guard  := D > A;
    action := ;
  };
  transition t5 := {
    from   := evalSimpleMultiplebbin;
    to     := evalSimpleMultiplebb2in;
    guard  := A >= D;
    action := ;
  };
  transition t6 := {
    from   := evalSimpleMultiplebb1in;
    to     := evalSimpleMultiplebb3in;
    guard  := true;
    action := A' = A + 1;
  };
  transition t7 := {
    from   := evalSimpleMultiplebb2in;
    to     := evalSimpleMultiplebb3in;
    guard  := true;
    action := B' = B + 1;
  };
  transition t8 := {
    from   := evalSimpleMultiplereturnin;
    to     := evalSimpleMultiplestop;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = evalSimpleMultiplestart };
}
