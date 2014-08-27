model main {
  var A, B, C, D, E;
  states evalfstart, evalfentryin, evalfbb10in, evalfbb8in, evalfreturnin, evalfbb6in, evalfbb4in, evalfbb7in, evalfbb3in, evalfbb5in, evalfstop;
  transition t0 := {
    from   := evalfstart;
    to     := evalfentryin;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := evalfentryin;
    to     := evalfbb10in;
    guard  := true;
    action := A' = 1;
  };
  transition t2 := {
    from   := evalfbb10in;
    to     := evalfbb8in;
    guard  := B >= A;
    action := C' = 1;
  };
  transition t3 := {
    from   := evalfbb10in;
    to     := evalfreturnin;
    guard  := A > B;
    action := ;
  };
  transition t4 := {
    from   := evalfbb8in;
    to     := evalfbb6in;
    guard  := A >= C;
    action := D' = A + 1;
  };
  transition t5 := {
    from   := evalfbb8in;
    to     := evalfbb10in;
    guard  := C > A;
    action := A' = A + 1;
  };
  transition t6 := {
    from   := evalfbb6in;
    to     := evalfbb4in;
    guard  := B >= D;
    action := E' = 1;
  };
  transition t7 := {
    from   := evalfbb6in;
    to     := evalfbb7in;
    guard  := D > B;
    action := ;
  };
  transition t8 := {
    from   := evalfbb4in;
    to     := evalfbb3in;
    guard  := D >= E;
    action := ;
  };
  transition t9 := {
    from   := evalfbb4in;
    to     := evalfbb5in;
    guard  := E > D;
    action := ;
  };
  transition t10 := {
    from   := evalfbb3in;
    to     := evalfbb4in;
    guard  := true;
    action := E' = E + 1;
  };
  transition t11 := {
    from   := evalfbb5in;
    to     := evalfbb6in;
    guard  := true;
    action := D' = D + 1;
  };
  transition t12 := {
    from   := evalfbb7in;
    to     := evalfbb8in;
    guard  := true;
    action := C' = C + 1;
  };
  transition t13 := {
    from   := evalfreturnin;
    to     := evalfstop;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = evalfstart };
}
