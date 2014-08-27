model main {
  var A, B, C, D, E;
  states evalfstart, evalfentryin, evalfbb5in, evalfbbin, evalfreturnin, evalfbb2in, evalfbb4in, evalfbb3in, evalfbb1in, evalfstop;
  transition t0 := {
    from   := evalfstart;
    to     := evalfentryin;
    guard  := true;
    action := E' = ?;
  };
  transition t1 := {
    from   := evalfentryin;
    to     := evalfbb5in;
    guard  := true;
    action := A' = B, E' = ?;
  };
  transition t2 := {
    from   := evalfbb5in;
    to     := evalfbbin;
    guard  := B > 1;
    action := E' = ?;
  };
  transition t3 := {
    from   := evalfbb5in;
    to     := evalfreturnin;
    guard  := 1 >= B;
    action := E' = ?;
  };
  transition t4 := {
    from   := evalfbbin;
    to     := evalfbb2in;
    guard  := true;
    action := C' = B - 1, D' = A + B - 1, E' = ?;
  };
  transition t5 := {
    from   := evalfbb2in;
    to     := evalfbb4in;
    guard  := C > D;
    action := E' = ?;
  };
  transition t6 := {
    from   := evalfbb2in;
    to     := evalfbb3in;
    guard  := D >= C;
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
    action := D' = D - 1, E' = ?;
  };
  transition t11 := {
    from   := evalfbb4in;
    to     := evalfbb5in;
    guard  := true;
    action := B' = C - 1, A' = D - C + 1, E' = ?;
  };
  transition t12 := {
    from   := evalfreturnin;
    to     := evalfstop;
    guard  := true;
    action := E' = ?;
  };
}
strategy dumb {
  Region init := { state = evalfstart };
}
