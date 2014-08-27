model main {
  var A, B, C, D, E;
  states evalEx4start, evalEx4entryin, evalEx4bb4in, evalEx4bb2in, evalEx4returnin, evalEx4bb3in, evalEx4bb1in, evalEx4stop;
  transition t0 := {
    from   := evalEx4start;
    to     := evalEx4entryin;
    guard  := true;
    action := E' = ?;
  };
  transition t1 := {
    from   := evalEx4entryin;
    to     := evalEx4bb4in;
    guard  := true;
    action := A' = 1, B' = A, E' = ?;
  };
  transition t2 := {
    from   := evalEx4bb4in;
    to     := evalEx4bb2in;
    guard  := A = 1;
    action := C' = 0, D' = B, E' = ?;
  };
  transition t3 := {
    from   := evalEx4bb4in;
    to     := evalEx4returnin;
    guard  := 0 >= A;
    action := E' = ?;
  };
  transition t4 := {
    from   := evalEx4bb4in;
    to     := evalEx4returnin;
    guard  := A > 1;
    action := E' = ?;
  };
  transition t5 := {
    from   := evalEx4bb2in;
    to     := evalEx4bb4in;
    guard  := 0 >= D;
    action := A' = C, B' = D, E' = ?;
  };
  transition t6 := {
    from   := evalEx4bb2in;
    to     := evalEx4bb3in;
    guard  := D > 0;
    action := E' = ?;
  };
  transition t7 := {
    from   := evalEx4bb3in;
    to     := evalEx4bb1in;
    guard  := 0 > E;
    action := E' = ?;
  };
  transition t8 := {
    from   := evalEx4bb3in;
    to     := evalEx4bb1in;
    guard  := E > 0;
    action := E' = ?;
  };
  transition t9 := {
    from   := evalEx4bb3in;
    to     := evalEx4bb4in;
    guard  := true;
    action := A' = C, B' = D, E' = ?;
  };
  transition t10 := {
    from   := evalEx4bb1in;
    to     := evalEx4bb2in;
    guard  := true;
    action := C' = 1, D' = D - 1, E' = ?;
  };
  transition t11 := {
    from   := evalEx4returnin;
    to     := evalEx4stop;
    guard  := true;
    action := E' = ?;
  };
}
strategy dumb {
  Region init := { state = evalEx4start };
}
