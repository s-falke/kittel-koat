model main {
  var A, B, C, D, E;
  states evalfstart, evalfentryin, evalfbb3in, evalfreturnin, evalfbb4in, evalfbbin, evalfbb1in, evalfbb2in, evalfstop;
  transition t0 := {
    from   := evalfstart;
    to     := evalfentryin;
    guard  := true;
    action := E' = ?;
  };
  transition t1 := {
    from   := evalfentryin;
    to     := evalfbb3in;
    guard  := A > 0 && B > A;
    action := C' = 0, D' = 0, E' = ?;
  };
  transition t2 := {
    from   := evalfbb3in;
    to     := evalfreturnin;
    guard  := D >= B;
    action := E' = ?;
  };
  transition t3 := {
    from   := evalfbb3in;
    to     := evalfbb4in;
    guard  := B > D;
    action := E' = ?;
  };
  transition t4 := {
    from   := evalfbb4in;
    to     := evalfbbin;
    guard  := 0 > E;
    action := E' = ?;
  };
  transition t5 := {
    from   := evalfbb4in;
    to     := evalfbbin;
    guard  := E > 0;
    action := E' = ?;
  };
  transition t6 := {
    from   := evalfbb4in;
    to     := evalfreturnin;
    guard  := true;
    action := E' = ?;
  };
  transition t7 := {
    from   := evalfbbin;
    to     := evalfbb1in;
    guard  := A > C;
    action := E' = ?;
  };
  transition t8 := {
    from   := evalfbbin;
    to     := evalfbb2in;
    guard  := C >= A;
    action := E' = ?;
  };
  transition t9 := {
    from   := evalfbb1in;
    to     := evalfbb3in;
    guard  := true;
    action := C' = C + 1, E' = ?;
  };
  transition t10 := {
    from   := evalfbb2in;
    to     := evalfbb3in;
    guard  := true;
    action := C' = 0, D' = D + 1, E' = ?;
  };
  transition t11 := {
    from   := evalfreturnin;
    to     := evalfstop;
    guard  := true;
    action := E' = ?;
  };
}
strategy dumb {
  Region init := { state = evalfstart };
}
