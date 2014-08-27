model main {
  var A, B, C, D;
  states evalfstart, evalfentryin, evalfbb3in, evalfreturnin, evalfbb4in, evalfbbin, evalfbb1in, evalfstop;
  transition t0 := {
    from   := evalfstart;
    to     := evalfentryin;
    guard  := true;
    action := D' = ?;
  };
  transition t1 := {
    from   := evalfentryin;
    to     := evalfbb3in;
    guard  := A > 0 && B > 0;
    action := A' = B, B' = A, C' = 0, D' = ?;
  };
  transition t2 := {
    from   := evalfbb3in;
    to     := evalfreturnin;
    guard  := 0 >= B;
    action := D' = ?;
  };
  transition t3 := {
    from   := evalfbb3in;
    to     := evalfbb4in;
    guard  := B > 0;
    action := D' = ?;
  };
  transition t4 := {
    from   := evalfbb4in;
    to     := evalfbbin;
    guard  := 0 > D;
    action := D' = ?;
  };
  transition t5 := {
    from   := evalfbb4in;
    to     := evalfbbin;
    guard  := D > 0;
    action := D' = ?;
  };
  transition t6 := {
    from   := evalfbb4in;
    to     := evalfreturnin;
    guard  := true;
    action := D' = ?;
  };
  transition t7 := {
    from   := evalfbbin;
    to     := evalfbb1in;
    guard  := A > C;
    action := D' = ?;
  };
  transition t8 := {
    from   := evalfbbin;
    to     := evalfbb3in;
    guard  := C >= A;
    action := C' = 0, D' = ?;
  };
  transition t9 := {
    from   := evalfbb1in;
    to     := evalfbb3in;
    guard  := true;
    action := B' = B - 1, C' = C + 1, D' = ?;
  };
  transition t10 := {
    from   := evalfreturnin;
    to     := evalfstop;
    guard  := true;
    action := D' = ?;
  };
}
strategy dumb {
  Region init := { state = evalfstart };
}
