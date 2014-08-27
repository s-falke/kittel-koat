model main {
  var A, B, C, D, E, F;
  states evalEx5start, evalEx5entryin, evalEx5bb6in, evalEx5bb3in, evalEx5returnin, evalEx5bb1in, evalEx5bb4in, evalEx5bb2in, evalEx5stop;
  transition t0 := {
    from   := evalEx5start;
    to     := evalEx5entryin;
    guard  := true;
    action := F' = ?;
  };
  transition t1 := {
    from   := evalEx5entryin;
    to     := evalEx5bb6in;
    guard  := true;
    action := A' = 0, B' = A, F' = ?;
  };
  transition t2 := {
    from   := evalEx5bb6in;
    to     := evalEx5bb3in;
    guard  := B > A;
    action := C' = 0, D' = B, F' = ?;
  };
  transition t3 := {
    from   := evalEx5bb6in;
    to     := evalEx5returnin;
    guard  := A >= B;
    action := F' = ?;
  };
  transition t4 := {
    from   := evalEx5bb3in;
    to     := evalEx5bb1in;
    guard  := 0 > F;
    action := F' = ?;
  };
  transition t5 := {
    from   := evalEx5bb3in;
    to     := evalEx5bb1in;
    guard  := F > 0;
    action := F' = ?;
  };
  transition t6 := {
    from   := evalEx5bb3in;
    to     := evalEx5bb4in;
    guard  := true;
    action := F' = ?;
  };
  transition t7 := {
    from   := evalEx5bb1in;
    to     := evalEx5bb2in;
    guard  := 0 > F;
    action := E' = D - 1, F' = ?;
  };
  transition t8 := {
    from   := evalEx5bb1in;
    to     := evalEx5bb2in;
    guard  := 0 > F && F > 0;
    action := E' = D - 1, F' = ?;
  };
  transition t9 := {
    from   := evalEx5bb1in;
    to     := evalEx5bb2in;
    guard  := F > 0;
    action := E' = D - 1, F' = ?;
  };
  transition t10 := {
    from   := evalEx5bb1in;
    to     := evalEx5bb3in;
    guard  := 0 > 0;
    action := D' = D - 1, F' = ?;
  };
  transition t11 := {
    from   := evalEx5bb1in;
    to     := evalEx5bb3in;
    guard  := 0 > 0;
    action := D' = D - 1, F' = ?;
  };
  transition t12 := {
    from   := evalEx5bb1in;
    to     := evalEx5bb2in;
    guard  := 0 > 0;
    action := E' = D, F' = ?;
  };
  transition t13 := {
    from   := evalEx5bb1in;
    to     := evalEx5bb2in;
    guard  := 0 > 0;
    action := E' = D, F' = ?;
  };
  transition t14 := {
    from   := evalEx5bb1in;
    to     := evalEx5bb3in;
    guard  := true;
    action := F' = ?;
  };
  transition t15 := {
    from   := evalEx5bb2in;
    to     := evalEx5bb3in;
    guard  := true;
    action := C' = 1, D' = E, F' = ?;
  };
  transition t16 := {
    from   := evalEx5bb4in;
    to     := evalEx5bb6in;
    guard  := C = 0;
    action := A' = A + 1, B' = D, F' = ?;
  };
  transition t17 := {
    from   := evalEx5bb4in;
    to     := evalEx5bb6in;
    guard  := 0 > C;
    action := B' = D, F' = ?;
  };
  transition t18 := {
    from   := evalEx5bb4in;
    to     := evalEx5bb6in;
    guard  := C > 0;
    action := B' = D, F' = ?;
  };
  transition t19 := {
    from   := evalEx5returnin;
    to     := evalEx5stop;
    guard  := true;
    action := F' = ?;
  };
}
strategy dumb {
  Region init := { state = evalEx5start };
}
