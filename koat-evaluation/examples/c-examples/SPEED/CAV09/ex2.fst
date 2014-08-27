model main {
  var A, B, C, D;
  states evalfstart, evalfentryin, evalfbb3in, evalfbbin, evalfreturnin, evalfbb1in, evalfbb2in, evalfstop;
  transition t0 := {
    from   := evalfstart;
    to     := evalfentryin;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := evalfentryin;
    to     := evalfbb3in;
    guard  := true;
    action := A' = 0, B' = 0;
  };
  transition t2 := {
    from   := evalfbb3in;
    to     := evalfbbin;
    guard  := C > B;
    action := ;
  };
  transition t3 := {
    from   := evalfbb3in;
    to     := evalfreturnin;
    guard  := B >= C;
    action := ;
  };
  transition t4 := {
    from   := evalfbbin;
    to     := evalfbb1in;
    guard  := D > A;
    action := ;
  };
  transition t5 := {
    from   := evalfbbin;
    to     := evalfbb2in;
    guard  := A >= D;
    action := ;
  };
  transition t6 := {
    from   := evalfbb1in;
    to     := evalfbb3in;
    guard  := true;
    action := A' = A + 1;
  };
  transition t7 := {
    from   := evalfbb2in;
    to     := evalfbb3in;
    guard  := true;
    action := A' = 0, B' = B + 1;
  };
  transition t8 := {
    from   := evalfreturnin;
    to     := evalfstop;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = evalfstart };
}
