model main {
  var A, B, C, D;
  states evalEx3start, evalEx3entryin, evalEx3bb4in, evalEx3bbin, evalEx3returnin, evalEx3bb2in, evalEx3bb3in, evalEx3bb1in, evalEx3stop;
  transition t0 := {
    from   := evalEx3start;
    to     := evalEx3entryin;
    guard  := true;
    action := D' = ?;
  };
  transition t1 := {
    from   := evalEx3entryin;
    to     := evalEx3bb4in;
    guard  := true;
    action := D' = ?;
  };
  transition t2 := {
    from   := evalEx3bb4in;
    to     := evalEx3bbin;
    guard  := A > 0;
    action := D' = ?;
  };
  transition t3 := {
    from   := evalEx3bb4in;
    to     := evalEx3returnin;
    guard  := 0 >= A;
    action := D' = ?;
  };
  transition t4 := {
    from   := evalEx3bbin;
    to     := evalEx3bb2in;
    guard  := true;
    action := B' = D, C' = A, D' = ?;
  };
  transition t5 := {
    from   := evalEx3bb2in;
    to     := evalEx3bb4in;
    guard  := 0 >= C;
    action := A' = C, D' = ?;
  };
  transition t6 := {
    from   := evalEx3bb2in;
    to     := evalEx3bb3in;
    guard  := C > 0;
    action := D' = ?;
  };
  transition t7 := {
    from   := evalEx3bb3in;
    to     := evalEx3bb1in;
    guard  := true;
    action := D' = ?;
  };
  transition t8 := {
    from   := evalEx3bb3in;
    to     := evalEx3bb4in;
    guard  := B > D;
    action := A' = C, D' = ?;
  };
  transition t9 := {
    from   := evalEx3bb3in;
    to     := evalEx3bb4in;
    guard  := D > B;
    action := A' = C, D' = ?;
  };
  transition t10 := {
    from   := evalEx3bb1in;
    to     := evalEx3bb2in;
    guard  := true;
    action := C' = C - 1, D' = ?;
  };
  transition t11 := {
    from   := evalEx3returnin;
    to     := evalEx3stop;
    guard  := true;
    action := D' = ?;
  };
}
strategy dumb {
  Region init := { state = evalEx3start };
}
