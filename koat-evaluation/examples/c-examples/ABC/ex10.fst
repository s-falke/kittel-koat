model main {
  var A, B, C;
  states evalfstart, evalfentryin, evalfbb4in, evalfbb2in, evalfreturnin, evalfbb1in, evalfbb3in, evalfstop;
  transition t0 := {
    from   := evalfstart;
    to     := evalfentryin;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := evalfentryin;
    to     := evalfbb4in;
    guard  := true;
    action := A' = B, B' = A;
  };
  transition t2 := {
    from   := evalfbb4in;
    to     := evalfbb2in;
    guard  := B > 0;
    action := C' = 1;
  };
  transition t3 := {
    from   := evalfbb4in;
    to     := evalfreturnin;
    guard  := 0 >= B;
    action := ;
  };
  transition t4 := {
    from   := evalfbb2in;
    to     := evalfbb1in;
    guard  := A >= C;
    action := ;
  };
  transition t5 := {
    from   := evalfbb2in;
    to     := evalfbb3in;
    guard  := C > A;
    action := ;
  };
  transition t6 := {
    from   := evalfbb1in;
    to     := evalfbb2in;
    guard  := true;
    action := C' = C + 1;
  };
  transition t7 := {
    from   := evalfbb3in;
    to     := evalfbb4in;
    guard  := true;
    action := B' = B - 1;
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
