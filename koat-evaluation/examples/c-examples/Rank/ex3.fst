model main {
  var A, B, C, D, E, F, G;
  states evalfstart, evalfentryin, evalfbb9in, evalfbbin, evalfreturnin, evalfbb6in, evalfbb8in, evalfbb7in, evalfbb1in, evalfbb3in, evalfbb5in, evalfbb4in, evalfbb2in, evalfstop;
  transition t0 := {
    from   := evalfstart;
    to     := evalfentryin;
    guard  := true;
    action := G' = ?;
  };
  transition t1 := {
    from   := evalfentryin;
    to     := evalfbb9in;
    guard  := true;
    action := A' = B, G' = ?;
  };
  transition t2 := {
    from   := evalfbb9in;
    to     := evalfbbin;
    guard  := B > 1;
    action := G' = ?;
  };
  transition t3 := {
    from   := evalfbb9in;
    to     := evalfreturnin;
    guard  := 1 >= B;
    action := G' = ?;
  };
  transition t4 := {
    from   := evalfbbin;
    to     := evalfbb6in;
    guard  := true;
    action := C' = B - 1, D' = A + B - 1, G' = ?;
  };
  transition t5 := {
    from   := evalfbb6in;
    to     := evalfbb8in;
    guard  := C >= D;
    action := G' = ?;
  };
  transition t6 := {
    from   := evalfbb6in;
    to     := evalfbb7in;
    guard  := D > C;
    action := G' = ?;
  };
  transition t7 := {
    from   := evalfbb7in;
    to     := evalfbb1in;
    guard  := 0 > G;
    action := G' = ?;
  };
  transition t8 := {
    from   := evalfbb7in;
    to     := evalfbb1in;
    guard  := G > 0;
    action := G' = ?;
  };
  transition t9 := {
    from   := evalfbb7in;
    to     := evalfbb8in;
    guard  := true;
    action := G' = ?;
  };
  transition t10 := {
    from   := evalfbb1in;
    to     := evalfbb3in;
    guard  := true;
    action := E' = C, F' = D - 1, G' = ?;
  };
  transition t11 := {
    from   := evalfbb3in;
    to     := evalfbb5in;
    guard  := true;
    action := G' = ?;
  };
  transition t12 := {
    from   := evalfbb3in;
    to     := evalfbb4in;
    guard  := 0 > 2;
    action := G' = ?;
  };
  transition t13 := {
    from   := evalfbb4in;
    to     := evalfbb2in;
    guard  := 0 > G;
    action := G' = ?;
  };
  transition t14 := {
    from   := evalfbb4in;
    to     := evalfbb2in;
    guard  := G > 0;
    action := G' = ?;
  };
  transition t15 := {
    from   := evalfbb4in;
    to     := evalfbb5in;
    guard  := true;
    action := G' = ?;
  };
  transition t16 := {
    from   := evalfbb2in;
    to     := evalfbb3in;
    guard  := true;
    action := E' = E + 1, F' = F - 2, G' = ?;
  };
  transition t17 := {
    from   := evalfbb5in;
    to     := evalfbb6in;
    guard  := true;
    action := C' = E, D' = F - 1, G' = ?;
  };
  transition t18 := {
    from   := evalfbb8in;
    to     := evalfbb9in;
    guard  := true;
    action := B' = C - 1, A' = D - C + 1, G' = ?;
  };
  transition t19 := {
    from   := evalfreturnin;
    to     := evalfstop;
    guard  := true;
    action := G' = ?;
  };
}
strategy dumb {
  Region init := { state = evalfstart };
}
