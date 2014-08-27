model main {
  var A, B, C, D, E;
  states evalSimpleSingle2start, evalSimpleSingle2entryin, evalSimpleSingle2bb4in, evalSimpleSingle2bbin, evalSimpleSingle2returnin, evalSimpleSingle2bb1in, evalSimpleSingle2bb2in, evalSimpleSingle2bb3in, evalSimpleSingle2stop;
  transition t0 := {
    from   := evalSimpleSingle2start;
    to     := evalSimpleSingle2entryin;
    guard  := true;
    action := E' = ?;
  };
  transition t1 := {
    from   := evalSimpleSingle2entryin;
    to     := evalSimpleSingle2bb4in;
    guard  := true;
    action := A' = 0, B' = 0, E' = ?;
  };
  transition t2 := {
    from   := evalSimpleSingle2bb4in;
    to     := evalSimpleSingle2bbin;
    guard  := 0 > E;
    action := E' = ?;
  };
  transition t3 := {
    from   := evalSimpleSingle2bb4in;
    to     := evalSimpleSingle2bbin;
    guard  := E > 0;
    action := E' = ?;
  };
  transition t4 := {
    from   := evalSimpleSingle2bb4in;
    to     := evalSimpleSingle2returnin;
    guard  := true;
    action := E' = ?;
  };
  transition t5 := {
    from   := evalSimpleSingle2bbin;
    to     := evalSimpleSingle2bb1in;
    guard  := C > B;
    action := E' = ?;
  };
  transition t6 := {
    from   := evalSimpleSingle2bbin;
    to     := evalSimpleSingle2bb2in;
    guard  := B >= C;
    action := E' = ?;
  };
  transition t7 := {
    from   := evalSimpleSingle2bb1in;
    to     := evalSimpleSingle2bb4in;
    guard  := true;
    action := A' = A + 1, B' = B + 1, E' = ?;
  };
  transition t8 := {
    from   := evalSimpleSingle2bb2in;
    to     := evalSimpleSingle2bb3in;
    guard  := D > A;
    action := E' = ?;
  };
  transition t9 := {
    from   := evalSimpleSingle2bb2in;
    to     := evalSimpleSingle2returnin;
    guard  := A >= D;
    action := E' = ?;
  };
  transition t10 := {
    from   := evalSimpleSingle2bb3in;
    to     := evalSimpleSingle2bb4in;
    guard  := true;
    action := A' = A + 1, B' = B + 1, E' = ?;
  };
  transition t11 := {
    from   := evalSimpleSingle2returnin;
    to     := evalSimpleSingle2stop;
    guard  := true;
    action := E' = ?;
  };
}
strategy dumb {
  Region init := { state = evalSimpleSingle2start };
}
