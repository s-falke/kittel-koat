model main {
  var A, B;
  states evalfstart, evalfentryin, evalfbb1in, evalfbbin, evalfreturnin, evalfstop;
  transition t0 := {
    from   := evalfstart;
    to     := evalfentryin;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := evalfentryin;
    to     := evalfbb1in;
    guard  := true;
    action := A' = B, B' = A;
  };
  transition t2 := {
    from   := evalfbb1in;
    to     := evalfbbin;
    guard  := A >= B;
    action := ;
  };
  transition t3 := {
    from   := evalfbb1in;
    to     := evalfreturnin;
    guard  := B > A;
    action := ;
  };
  transition t4 := {
    from   := evalfbbin;
    to     := evalfbb1in;
    guard  := true;
    action := B' = B + 1;
  };
  transition t5 := {
    from   := evalfreturnin;
    to     := evalfstop;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = evalfstart };
}
