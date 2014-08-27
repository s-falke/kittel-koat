model main {
  var A, B, C, D, E, F;
  states evalfstart, evalfentryin, evalfbb7in, evalfbb5in, evalfreturnin, evalfbb1in, evalfbb6in, evalfbb3in, evalfbb2in, evalfbb4in, evalfstop;
  transition t0 := {
    from   := evalfstart;
    to     := evalfentryin;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := evalfentryin;
    to     := evalfbb7in;
    guard  := true;
    action := A' = B, B' = C, C' = D, D' = A;
  };
  transition t2 := {
    from   := evalfbb7in;
    to     := evalfbb5in;
    guard  := A >= D;
    action := E' = B;
  };
  transition t3 := {
    from   := evalfbb7in;
    to     := evalfreturnin;
    guard  := D > A;
    action := ;
  };
  transition t4 := {
    from   := evalfbb5in;
    to     := evalfbb1in;
    guard  := C >= E;
    action := ;
  };
  transition t5 := {
    from   := evalfbb5in;
    to     := evalfbb6in;
    guard  := E > C;
    action := ;
  };
  transition t6 := {
    from   := evalfbb1in;
    to     := evalfbb3in;
    guard  := true;
    action := F' = D - E;
  };
  transition t7 := {
    from   := evalfbb3in;
    to     := evalfbb2in;
    guard  := D + E >= F;
    action := ;
  };
  transition t8 := {
    from   := evalfbb3in;
    to     := evalfbb4in;
    guard  := F > D + E;
    action := ;
  };
  transition t9 := {
    from   := evalfbb2in;
    to     := evalfbb3in;
    guard  := true;
    action := F' = F + 1;
  };
  transition t10 := {
    from   := evalfbb4in;
    to     := evalfbb5in;
    guard  := true;
    action := E' = E + 1;
  };
  transition t11 := {
    from   := evalfbb6in;
    to     := evalfbb7in;
    guard  := true;
    action := D' = D + 1;
  };
  transition t12 := {
    from   := evalfreturnin;
    to     := evalfstop;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = evalfstart };
}
