model main {
  var A, B;
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
    action := A' = B, B' = A;
  };
  transition t2 := {
    from   := evalfbb3in;
    to     := evalfbbin;
    guard  := B > 0 && 254 >= B;
    action := ;
  };
  transition t3 := {
    from   := evalfbb3in;
    to     := evalfreturnin;
    guard  := 0 >= B;
    action := ;
  };
  transition t4 := {
    from   := evalfbb3in;
    to     := evalfreturnin;
    guard  := B > 254;
    action := ;
  };
  transition t5 := {
    from   := evalfbbin;
    to     := evalfbb1in;
    guard  := 0 > A;
    action := ;
  };
  transition t6 := {
    from   := evalfbbin;
    to     := evalfbb1in;
    guard  := A > 0;
    action := ;
  };
  transition t7 := {
    from   := evalfbbin;
    to     := evalfbb2in;
    guard  := A = 0;
    action := ;
  };
  transition t8 := {
    from   := evalfbb1in;
    to     := evalfbb3in;
    guard  := true;
    action := B' = B + 1;
  };
  transition t9 := {
    from   := evalfbb2in;
    to     := evalfbb3in;
    guard  := true;
    action := B' = B - 1;
  };
  transition t10 := {
    from   := evalfreturnin;
    to     := evalfstop;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = evalfstart };
}
