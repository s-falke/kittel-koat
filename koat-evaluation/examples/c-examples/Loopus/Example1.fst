model main {
  var A, B, C, D, E;
  states evalfstart, evalfentryin, evalfbb6in, evalfbbin, evalfreturnin, evalfbb2in, evalfbb4in, evalfbb3in, evalfbb1in, evalfstop;
  transition t0 := {
    from   := evalfstart;
    to     := evalfentryin;
    guard  := true;
    action := E' = ?;
  };
  transition t1 := {
    from   := evalfentryin;
    to     := evalfbb6in;
    guard  := true;
    action := A' = 0, E' = ?;
  };
  transition t2 := {
    from   := evalfbb6in;
    to     := evalfbbin;
    guard  := B > A;
    action := E' = ?;
  };
  transition t3 := {
    from   := evalfbb6in;
    to     := evalfreturnin;
    guard  := A >= B;
    action := E' = ?;
  };
  transition t4 := {
    from   := evalfbbin;
    to     := evalfbb2in;
    guard  := true;
    action := C' = 0, D' = A + 1, E' = ?;
  };
  transition t5 := {
    from   := evalfbb2in;
    to     := evalfbb4in;
    guard  := D >= B;
    action := E' = ?;
  };
  transition t6 := {
    from   := evalfbb2in;
    to     := evalfbb3in;
    guard  := B > D;
    action := E' = ?;
  };
  transition t7 := {
    from   := evalfbb3in;
    to     := evalfbb1in;
    guard  := 0 > E;
    action := E' = ?;
  };
  transition t8 := {
    from   := evalfbb3in;
    to     := evalfbb1in;
    guard  := E > 0;
    action := E' = ?;
  };
  transition t9 := {
    from   := evalfbb3in;
    to     := evalfbb4in;
    guard  := true;
    action := E' = ?;
  };
  transition t10 := {
    from   := evalfbb1in;
    to     := evalfbb2in;
    guard  := true;
    action := C' = C + 1, D' = D + 1, E' = ?;
  };
  transition t11 := {
    from   := evalfbb4in;
    to     := evalfbb6in;
    guard  := C > 0;
    action := A' = D - 1, E' = ?;
  };
  transition t12 := {
    from   := evalfbb4in;
    to     := evalfbb6in;
    guard  := 0 >= C;
    action := A' = D, E' = ?;
  };
  transition t13 := {
    from   := evalfreturnin;
    to     := evalfstop;
    guard  := true;
    action := E' = ?;
  };
}
strategy dumb {
  Region init := { state = evalfstart };
}
