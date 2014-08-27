model main {
  var A, B, C, D;
  states evalSimpleMultipleDepstart, evalSimpleMultipleDepentryin, evalSimpleMultipleDepbb3in, evalSimpleMultipleDepbbin, evalSimpleMultipleDepreturnin, evalSimpleMultipleDepbb1in, evalSimpleMultipleDepbb2in, evalSimpleMultipleDepstop;
  transition t0 := {
    from   := evalSimpleMultipleDepstart;
    to     := evalSimpleMultipleDepentryin;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := evalSimpleMultipleDepentryin;
    to     := evalSimpleMultipleDepbb3in;
    guard  := true;
    action := A' = 0, B' = 0;
  };
  transition t2 := {
    from   := evalSimpleMultipleDepbb3in;
    to     := evalSimpleMultipleDepbbin;
    guard  := C > B;
    action := ;
  };
  transition t3 := {
    from   := evalSimpleMultipleDepbb3in;
    to     := evalSimpleMultipleDepreturnin;
    guard  := B >= C;
    action := ;
  };
  transition t4 := {
    from   := evalSimpleMultipleDepbbin;
    to     := evalSimpleMultipleDepbb1in;
    guard  := D > A;
    action := ;
  };
  transition t5 := {
    from   := evalSimpleMultipleDepbbin;
    to     := evalSimpleMultipleDepbb2in;
    guard  := A >= D;
    action := ;
  };
  transition t6 := {
    from   := evalSimpleMultipleDepbb1in;
    to     := evalSimpleMultipleDepbb3in;
    guard  := true;
    action := A' = A + 1;
  };
  transition t7 := {
    from   := evalSimpleMultipleDepbb2in;
    to     := evalSimpleMultipleDepbb3in;
    guard  := true;
    action := A' = 0, B' = B + 1;
  };
  transition t8 := {
    from   := evalSimpleMultipleDepreturnin;
    to     := evalSimpleMultipleDepstop;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = evalSimpleMultipleDepstart };
}
