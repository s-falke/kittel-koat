model main {
  var A, B, C, D, E, F;
  states evalfstart, evalfentryin, evalfbb7in, evalfbbin, evalfreturnin, evalfbb3in, evalfbb6in, evalfbb5in, evalfbb4in, evalfbb2in, evalfstop;
  transition t0 := {
    from   := evalfstart;
    to     := evalfentryin;
    guard  := true;
    action := F' = ?;
  };
  transition t1 := {
    from   := evalfentryin;
    to     := evalfbb7in;
    guard  := true;
    action := A' = B, C' = 0, F' = ?;
  };
  transition t2 := {
    from   := evalfbb7in;
    to     := evalfbbin;
    guard  := A >= 0 && C >= 0;
    action := F' = ?;
  };
  transition t3 := {
    from   := evalfbb7in;
    to     := evalfreturnin;
    guard  := 0 > A;
    action := F' = ?;
  };
  transition t4 := {
    from   := evalfbb7in;
    to     := evalfreturnin;
    guard  := 0 > C;
    action := F' = ?;
  };
  transition t5 := {
    from   := evalfbbin;
    to     := evalfbb3in;
    guard  := 0 > F;
    action := D' = C, F' = ?;
  };
  transition t6 := {
    from   := evalfbbin;
    to     := evalfbb3in;
    guard  := F > 0;
    action := D' = C, F' = ?;
  };
  transition t7 := {
    from   := evalfbbin;
    to     := evalfbb6in;
    guard  := true;
    action := D' = A, E' = C, F' = ?;
  };
  transition t8 := {
    from   := evalfbb3in;
    to     := evalfbb5in;
    guard  := D > B;
    action := F' = ?;
  };
  transition t9 := {
    from   := evalfbb3in;
    to     := evalfbb4in;
    guard  := B >= D;
    action := F' = ?;
  };
  transition t10 := {
    from   := evalfbb4in;
    to     := evalfbb2in;
    guard  := 0 > F;
    action := F' = ?;
  };
  transition t11 := {
    from   := evalfbb4in;
    to     := evalfbb2in;
    guard  := F > 0;
    action := F' = ?;
  };
  transition t12 := {
    from   := evalfbb4in;
    to     := evalfbb5in;
    guard  := true;
    action := F' = ?;
  };
  transition t13 := {
    from   := evalfbb2in;
    to     := evalfbb3in;
    guard  := true;
    action := D' = D + 1, F' = ?;
  };
  transition t14 := {
    from   := evalfbb5in;
    to     := evalfbb6in;
    guard  := true;
    action := D' = A - 1, E' = D, F' = ?;
  };
  transition t15 := {
    from   := evalfbb6in;
    to     := evalfbb7in;
    guard  := true;
    action := A' = D, C' = E - 1, F' = ?;
  };
  transition t16 := {
    from   := evalfreturnin;
    to     := evalfstop;
    guard  := true;
    action := F' = ?;
  };
}
strategy dumb {
  Region init := { state = evalfstart };
}
