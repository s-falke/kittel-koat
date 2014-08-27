model main {
  var A, B, C, D, E;
  states evalfstart, evalfentryin, evalfbb7in, evalfbb5in, evalfreturnin, evalfbb3in, evalfbb6in, evalfbb2in, evalfbb4in, evalfstop;
  transition t0 := {
    from   := evalfstart;
    to     := evalfentryin;
    guard  := true;
    action := E' = ?;
  };
  transition t1 := {
    from   := evalfentryin;
    to     := evalfbb7in;
    guard  := true;
    action := A' = 0, E' = ?;
  };
  transition t2 := {
    from   := evalfbb7in;
    to     := evalfbb5in;
    guard  := B*B*B >= 0 && 0 >= B*B*B && 0 > A;
    action := C' = 0, E' = ?;
  };
  transition t3 := {
    from   := evalfbb7in;
    to     := evalfbb5in;
    guard  := B*B*B > 0 && E >= 0 && B*B*B >= 2*E && 1 + 2*E >= B*B*B && E > A;
    action := C' = 0, E' = ?;
  };
  transition t4 := {
    from   := evalfbb7in;
    to     := evalfbb5in;
    guard  := 0 > B*B*B && 0 >= E && E > A && 2*E >= B*B*B && 1 + B*B*B >= 2*E;
    action := C' = 0, E' = ?;
  };
  transition t5 := {
    from   := evalfbb7in;
    to     := evalfreturnin;
    guard  := B*B*B >= 0 && 0 >= B*B*B && A >= 0;
    action := E' = ?;
  };
  transition t6 := {
    from   := evalfbb7in;
    to     := evalfreturnin;
    guard  := B*B*B > 0 && E >= 0 && B*B*B >= 2*E && 1 + 2*E >= B*B*B && A >= E;
    action := E' = ?;
  };
  transition t7 := {
    from   := evalfbb7in;
    to     := evalfreturnin;
    guard  := 0 > B*B*B && 0 >= E && A >= E && 2*E >= B*B*B && 1 + B*B*B >= 2*E;
    action := E' = ?;
  };
  transition t8 := {
    from   := evalfbb5in;
    to     := evalfbb3in;
    guard  := B > C;
    action := D' = 0, E' = ?;
  };
  transition t9 := {
    from   := evalfbb5in;
    to     := evalfbb6in;
    guard  := C >= B;
    action := E' = ?;
  };
  transition t10 := {
    from   := evalfbb3in;
    to     := evalfbb2in;
    guard  := C > D;
    action := E' = ?;
  };
  transition t11 := {
    from   := evalfbb3in;
    to     := evalfbb4in;
    guard  := D >= C;
    action := E' = ?;
  };
  transition t12 := {
    from   := evalfbb2in;
    to     := evalfbb3in;
    guard  := true;
    action := D' = D + 1, E' = ?;
  };
  transition t13 := {
    from   := evalfbb4in;
    to     := evalfbb5in;
    guard  := true;
    action := C' = C + 1, E' = ?;
  };
  transition t14 := {
    from   := evalfbb6in;
    to     := evalfbb7in;
    guard  := true;
    action := A' = A + 1, E' = ?;
  };
  transition t15 := {
    from   := evalfreturnin;
    to     := evalfstop;
    guard  := true;
    action := E' = ?;
  };
}
strategy dumb {
  Region init := { state = evalfstart };
}
