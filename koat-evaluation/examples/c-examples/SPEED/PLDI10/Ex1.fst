model main {
  var A, B, C, D, E;
  states evalEx1start, evalEx1entryin, evalEx1bb6in, evalEx1bbin, evalEx1returnin, evalEx1bb4in, evalEx1bb1in, evalEx1bb5in, evalEx1stop;
  transition t0 := {
    from   := evalEx1start;
    to     := evalEx1entryin;
    guard  := true;
    action := E' = ?;
  };
  transition t1 := {
    from   := evalEx1entryin;
    to     := evalEx1bb6in;
    guard  := true;
    action := A' = 0, B' = A, E' = ?;
  };
  transition t2 := {
    from   := evalEx1bb6in;
    to     := evalEx1bbin;
    guard  := B > A;
    action := E' = ?;
  };
  transition t3 := {
    from   := evalEx1bb6in;
    to     := evalEx1returnin;
    guard  := A >= B;
    action := E' = ?;
  };
  transition t4 := {
    from   := evalEx1bbin;
    to     := evalEx1bb4in;
    guard  := true;
    action := C' = A + 1, D' = B, E' = ?;
  };
  transition t5 := {
    from   := evalEx1bb4in;
    to     := evalEx1bb1in;
    guard  := D > C;
    action := E' = ?;
  };
  transition t6 := {
    from   := evalEx1bb4in;
    to     := evalEx1bb5in;
    guard  := C >= D;
    action := E' = ?;
  };
  transition t7 := {
    from   := evalEx1bb1in;
    to     := evalEx1bb4in;
    guard  := 0 > E;
    action := D' = D - 1, E' = ?;
  };
  transition t8 := {
    from   := evalEx1bb1in;
    to     := evalEx1bb4in;
    guard  := 0 > E && E > 0;
    action := D' = D - 1, E' = ?;
  };
  transition t9 := {
    from   := evalEx1bb1in;
    to     := evalEx1bb4in;
    guard  := E > 0;
    action := D' = D - 1, E' = ?;
  };
  transition t10 := {
    from   := evalEx1bb1in;
    to     := evalEx1bb4in;
    guard  := 0 > 0;
    action := E' = ?;
  };
  transition t11 := {
    from   := evalEx1bb1in;
    to     := evalEx1bb4in;
    guard  := 0 > 0;
    action := E' = ?;
  };
  transition t12 := {
    from   := evalEx1bb1in;
    to     := evalEx1bb4in;
    guard  := 0 > 0;
    action := C' = C + 1, D' = D - 1, E' = ?;
  };
  transition t13 := {
    from   := evalEx1bb1in;
    to     := evalEx1bb4in;
    guard  := 0 > 0;
    action := C' = C + 1, D' = D - 1, E' = ?;
  };
  transition t14 := {
    from   := evalEx1bb1in;
    to     := evalEx1bb4in;
    guard  := true;
    action := C' = C + 1, E' = ?;
  };
  transition t15 := {
    from   := evalEx1bb5in;
    to     := evalEx1bb6in;
    guard  := true;
    action := A' = A + 1, B' = D, E' = ?;
  };
  transition t16 := {
    from   := evalEx1returnin;
    to     := evalEx1stop;
    guard  := true;
    action := E' = ?;
  };
}
strategy dumb {
  Region init := { state = evalEx1start };
}
