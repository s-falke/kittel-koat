model main {
  var A, B, C;
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
    guard  := A > 0 && B > A;
    action := A' = C, C' = A;
  };
  transition t2 := {
    from   := evalfbb3in;
    to     := evalfbbin;
    guard  := C > 0 && B > C;
    action := ;
  };
  transition t3 := {
    from   := evalfbb3in;
    to     := evalfreturnin;
    guard  := 0 >= C;
    action := ;
  };
  transition t4 := {
    from   := evalfbb3in;
    to     := evalfreturnin;
    guard  := C >= B;
    action := ;
  };
  transition t5 := {
    from   := evalfbbin;
    to     := evalfbb1in;
    guard  := A > 0;
    action := ;
  };
  transition t6 := {
    from   := evalfbbin;
    to     := evalfbb2in;
    guard  := 0 >= A;
    action := ;
  };
  transition t7 := {
    from   := evalfbb1in;
    to     := evalfbb3in;
    guard  := true;
    action := C' = C + 1;
  };
  transition t8 := {
    from   := evalfbb2in;
    to     := evalfbb3in;
    guard  := true;
    action := C' = C - 1;
  };
  transition t9 := {
    from   := evalfreturnin;
    to     := evalfstop;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = evalfstart };
}
