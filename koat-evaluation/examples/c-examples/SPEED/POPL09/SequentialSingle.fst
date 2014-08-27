model main {
  var A, B, C;
  states evalSequentialSinglestart, evalSequentialSingleentryin, evalSequentialSinglebb1in, evalSequentialSinglebb5in, evalSequentialSinglebb2in, evalSequentialSinglebbin, evalSequentialSinglebb4in, evalSequentialSinglereturnin, evalSequentialSinglestop;
  transition t0 := {
    from   := evalSequentialSinglestart;
    to     := evalSequentialSingleentryin;
    guard  := true;
    action := C' = ?;
  };
  transition t1 := {
    from   := evalSequentialSingleentryin;
    to     := evalSequentialSinglebb1in;
    guard  := true;
    action := A' = 0, C' = ?;
  };
  transition t2 := {
    from   := evalSequentialSinglebb1in;
    to     := evalSequentialSinglebb5in;
    guard  := A >= B;
    action := C' = ?;
  };
  transition t3 := {
    from   := evalSequentialSinglebb1in;
    to     := evalSequentialSinglebb2in;
    guard  := B > A;
    action := C' = ?;
  };
  transition t4 := {
    from   := evalSequentialSinglebb2in;
    to     := evalSequentialSinglebbin;
    guard  := 0 > C;
    action := C' = ?;
  };
  transition t5 := {
    from   := evalSequentialSinglebb2in;
    to     := evalSequentialSinglebbin;
    guard  := C > 0;
    action := C' = ?;
  };
  transition t6 := {
    from   := evalSequentialSinglebb2in;
    to     := evalSequentialSinglebb5in;
    guard  := true;
    action := C' = ?;
  };
  transition t7 := {
    from   := evalSequentialSinglebbin;
    to     := evalSequentialSinglebb1in;
    guard  := true;
    action := A' = A + 1, C' = ?;
  };
  transition t8 := {
    from   := evalSequentialSinglebb5in;
    to     := evalSequentialSinglebb4in;
    guard  := B > A;
    action := C' = ?;
  };
  transition t9 := {
    from   := evalSequentialSinglebb5in;
    to     := evalSequentialSinglereturnin;
    guard  := A >= B;
    action := C' = ?;
  };
  transition t10 := {
    from   := evalSequentialSinglebb4in;
    to     := evalSequentialSinglebb5in;
    guard  := true;
    action := A' = A + 1, C' = ?;
  };
  transition t11 := {
    from   := evalSequentialSinglereturnin;
    to     := evalSequentialSinglestop;
    guard  := true;
    action := C' = ?;
  };
}
strategy dumb {
  Region init := { state = evalSequentialSinglestart };
}
