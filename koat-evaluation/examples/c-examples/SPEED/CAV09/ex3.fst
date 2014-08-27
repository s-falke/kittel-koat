model main {
  var A, B, C, D;
  states evalfstart, evalfentryin, evalfbb5in, evalfreturnin, evalfbb6in, evalfbb2in, evalfbb4in, evalfbb3in, evalfbb1in, evalfstop;
  transition t0 := {
    from   := evalfstart;
    to     := evalfentryin;
    guard  := true;
    action := D' = ?;
  };
  transition t1 := {
    from   := evalfentryin;
    to     := evalfbb5in;
    guard  := true;
    action := A' = 0, D' = ?;
  };
  transition t2 := {
    from   := evalfbb5in;
    to     := evalfreturnin;
    guard  := A >= B;
    action := D' = ?;
  };
  transition t3 := {
    from   := evalfbb5in;
    to     := evalfbb6in;
    guard  := B > A;
    action := D' = ?;
  };
  transition t4 := {
    from   := evalfbb6in;
    to     := evalfbb2in;
    guard  := 0 > D;
    action := C' = A, D' = ?;
  };
  transition t5 := {
    from   := evalfbb6in;
    to     := evalfbb2in;
    guard  := D > 0;
    action := C' = A, D' = ?;
  };
  transition t6 := {
    from   := evalfbb6in;
    to     := evalfreturnin;
    guard  := true;
    action := D' = ?;
  };
  transition t7 := {
    from   := evalfbb2in;
    to     := evalfbb4in;
    guard  := C >= B;
    action := D' = ?;
  };
  transition t8 := {
    from   := evalfbb2in;
    to     := evalfbb3in;
    guard  := B > C;
    action := D' = ?;
  };
  transition t9 := {
    from   := evalfbb3in;
    to     := evalfbb1in;
    guard  := 0 > D;
    action := D' = ?;
  };
  transition t10 := {
    from   := evalfbb3in;
    to     := evalfbb1in;
    guard  := D > 0;
    action := D' = ?;
  };
  transition t11 := {
    from   := evalfbb3in;
    to     := evalfbb4in;
    guard  := true;
    action := D' = ?;
  };
  transition t12 := {
    from   := evalfbb1in;
    to     := evalfbb2in;
    guard  := true;
    action := C' = C + 1, D' = ?;
  };
  transition t13 := {
    from   := evalfbb4in;
    to     := evalfbb5in;
    guard  := true;
    action := A' = C + 1, D' = ?;
  };
  transition t14 := {
    from   := evalfreturnin;
    to     := evalfstop;
    guard  := true;
    action := D' = ?;
  };
}
strategy dumb {
  Region init := { state = evalfstart };
}
