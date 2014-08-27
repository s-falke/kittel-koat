model main {
  var A, B, C, D, E, F, G;
  states evalfstart, evalfentryin, evalfbb8in, evalfbb2in, evalfreturnin, evalfbb4in, evalfbb3in, evalfbb1in, evalfbb6in, evalfbb7in, evalfbb5in, evalfstop;
  transition t0 := {
    from   := evalfstart;
    to     := evalfentryin;
    guard  := true;
    action := G' = ?;
  };
  transition t1 := {
    from   := evalfentryin;
    to     := evalfbb8in;
    guard  := true;
    action := A' = B, B' = A, G' = ?;
  };
  transition t2 := {
    from   := evalfbb8in;
    to     := evalfbb2in;
    guard  := B >= 0;
    action := C' = A, G' = ?;
  };
  transition t3 := {
    from   := evalfbb8in;
    to     := evalfreturnin;
    guard  := 0 > B;
    action := G' = ?;
  };
  transition t4 := {
    from   := evalfbb2in;
    to     := evalfbb4in;
    guard  := 0 > C;
    action := G' = ?;
  };
  transition t5 := {
    from   := evalfbb2in;
    to     := evalfbb3in;
    guard  := C >= 0;
    action := G' = ?;
  };
  transition t6 := {
    from   := evalfbb3in;
    to     := evalfbb1in;
    guard  := 0 > G;
    action := G' = ?;
  };
  transition t7 := {
    from   := evalfbb3in;
    to     := evalfbb1in;
    guard  := G > 0;
    action := G' = ?;
  };
  transition t8 := {
    from   := evalfbb3in;
    to     := evalfbb4in;
    guard  := true;
    action := G' = ?;
  };
  transition t9 := {
    from   := evalfbb1in;
    to     := evalfbb2in;
    guard  := true;
    action := C' = C - 1, G' = ?;
  };
  transition t10 := {
    from   := evalfbb4in;
    to     := evalfbb6in;
    guard  := true;
    action := D' = B - 1, E' = C, G' = ?;
  };
  transition t11 := {
    from   := evalfbb6in;
    to     := evalfbb8in;
    guard  := E > F;
    action := A' = E, B' = D, G' = ?;
  };
  transition t12 := {
    from   := evalfbb6in;
    to     := evalfbb7in;
    guard  := F >= E;
    action := G' = ?;
  };
  transition t13 := {
    from   := evalfbb7in;
    to     := evalfbb5in;
    guard  := 0 > G;
    action := G' = ?;
  };
  transition t14 := {
    from   := evalfbb7in;
    to     := evalfbb5in;
    guard  := G > 0;
    action := G' = ?;
  };
  transition t15 := {
    from   := evalfbb7in;
    to     := evalfbb8in;
    guard  := true;
    action := A' = E, B' = D, G' = ?;
  };
  transition t16 := {
    from   := evalfbb5in;
    to     := evalfbb6in;
    guard  := true;
    action := E' = E + 1, G' = ?;
  };
  transition t17 := {
    from   := evalfreturnin;
    to     := evalfstop;
    guard  := true;
    action := G' = ?;
  };
}
strategy dumb {
  Region init := { state = evalfstart };
}
