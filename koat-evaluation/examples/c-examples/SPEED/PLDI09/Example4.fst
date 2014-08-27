model main {
  var A, B, C;
  states evalfstart, evalfentryin, evalfbb3in, evalfreturnin, evalfbb4in, evalfbbin, evalfbb1in, evalfbb2in, evalfstop;
  transition t0 := {
    from   := evalfstart;
    to     := evalfentryin;
    guard  := true;
    action := C' = ?;
  };
  transition t1 := {
    from   := evalfentryin;
    to     := evalfbb3in;
    guard  := A > 0 && B > A;
    action := B' = A, A' = B, C' = ?;
  };
  transition t2 := {
    from   := evalfbb3in;
    to     := evalfreturnin;
    guard  := 0 >= A;
    action := C' = ?;
  };
  transition t3 := {
    from   := evalfbb3in;
    to     := evalfbb4in;
    guard  := A > 0;
    action := C' = ?;
  };
  transition t4 := {
    from   := evalfbb4in;
    to     := evalfbbin;
    guard  := 0 > C;
    action := C' = ?;
  };
  transition t5 := {
    from   := evalfbb4in;
    to     := evalfbbin;
    guard  := C > 0;
    action := C' = ?;
  };
  transition t6 := {
    from   := evalfbb4in;
    to     := evalfreturnin;
    guard  := true;
    action := C' = ?;
  };
  transition t7 := {
    from   := evalfbbin;
    to     := evalfbb1in;
    guard  := B > A;
    action := C' = ?;
  };
  transition t8 := {
    from   := evalfbbin;
    to     := evalfbb2in;
    guard  := A >= B;
    action := C' = ?;
  };
  transition t9 := {
    from   := evalfbb1in;
    to     := evalfbb3in;
    guard  := true;
    action := A' = A + 1, C' = ?;
  };
  transition t10 := {
    from   := evalfbb2in;
    to     := evalfbb3in;
    guard  := true;
    action := A' = A - B, C' = ?;
  };
  transition t11 := {
    from   := evalfreturnin;
    to     := evalfstop;
    guard  := true;
    action := C' = ?;
  };
}
strategy dumb {
  Region init := { state = evalfstart };
}
