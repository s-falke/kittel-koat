model main {
  var A, B, C, D, E;
  states evalNestedMultipleDepstart, evalNestedMultipleDepentryin, evalNestedMultipleDepbb3in, evalNestedMultipleDepbbin, evalNestedMultipleDepreturnin, evalNestedMultipleDepbb2in, evalNestedMultipleDepbb1in, evalNestedMultipleDepstop;
  transition t0 := {
    from   := evalNestedMultipleDepstart;
    to     := evalNestedMultipleDepentryin;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := evalNestedMultipleDepentryin;
    to     := evalNestedMultipleDepbb3in;
    guard  := true;
    action := A' = 0;
  };
  transition t2 := {
    from   := evalNestedMultipleDepbb3in;
    to     := evalNestedMultipleDepbbin;
    guard  := B > A;
    action := ;
  };
  transition t3 := {
    from   := evalNestedMultipleDepbb3in;
    to     := evalNestedMultipleDepreturnin;
    guard  := A >= B;
    action := ;
  };
  transition t4 := {
    from   := evalNestedMultipleDepbbin;
    to     := evalNestedMultipleDepbb2in;
    guard  := true;
    action := C' = A + 1, D' = 0;
  };
  transition t5 := {
    from   := evalNestedMultipleDepbb2in;
    to     := evalNestedMultipleDepbb1in;
    guard  := E > D;
    action := ;
  };
  transition t6 := {
    from   := evalNestedMultipleDepbb2in;
    to     := evalNestedMultipleDepbb3in;
    guard  := D >= E;
    action := A' = C;
  };
  transition t7 := {
    from   := evalNestedMultipleDepbb1in;
    to     := evalNestedMultipleDepbb2in;
    guard  := true;
    action := D' = D + 1;
  };
  transition t8 := {
    from   := evalNestedMultipleDepreturnin;
    to     := evalNestedMultipleDepstop;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = evalNestedMultipleDepstart };
}
