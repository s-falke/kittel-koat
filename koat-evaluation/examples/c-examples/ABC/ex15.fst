model main {
  var A, B, C, D, E, F, G;
  states evalfstart, evalfentryin, evalfbb10in, evalfbb8in, evalfreturnin, evalfbb6in, evalfbb9in, evalfbb4in, evalfbb7in, evalfbb3in, evalfbb5in, evalfstop;
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
    action := A' = B, B' = C, C' = D, D' = A;
  };
  transition t2 := {
    from   := evalfbb10in;
    to     := evalfbb8in;
    guard  := D > 0;
    action := E' = 1;
  };
  transition t3 := {
    from   := evalfbb10in;
    to     := evalfreturnin;
    guard  := 0 >= D;
    action := ;
  };
  transition t4 := {
    from   := evalfbb8in;
    to     := evalfbb6in;
    guard  := A >= E;
    action := F' = D;
  };
  transition t5 := {
    from   := evalfbb8in;
    to     := evalfbb9in;
    guard  := E > A;
    action := ;
  };
  transition t6 := {
    from   := evalfbb6in;
    to     := evalfbb4in;
    guard  := B >= F;
    action := G' = C;
  };
  transition t7 := {
    from   := evalfbb6in;
    to     := evalfbb7in;
    guard  := F > B;
    action := ;
  };
  transition t8 := {
    from   := evalfbb4in;
    to     := evalfbb3in;
    guard  := E >= G;
    action := ;
  };
  transition t9 := {
    from   := evalfbb4in;
    to     := evalfbb5in;
    guard  := G > E;
    action := ;
  };
  transition t10 := {
    from   := evalfbb3in;
    to     := evalfbb4in;
    guard  := true;
    action := G' = G - 1;
  };
  transition t11 := {
    from   := evalfbb5in;
    to     := evalfbb6in;
    guard  := true;
    action := F' = F + 1;
  };
  transition t12 := {
    from   := evalfbb7in;
    to     := evalfbb8in;
    guard  := true;
    action := E' = E + 1;
  };
  transition t13 := {
    from   := evalfbb9in;
    to     := evalfbb10in;
    guard  := true;
    action := D' = D - 1;
  };
  transition t14 := {
    from   := evalfreturnin;
    to     := evalfstop;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = evalfstart };
}
