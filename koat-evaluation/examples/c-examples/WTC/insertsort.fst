model main {
  var A, B, C, D, E;
  states evalinsertsortstart, evalinsertsortentryin, evalinsertsortbb5in, evalinsertsortbbin, evalinsertsortreturnin, evalinsertsortbb2in, evalinsertsortbb4in, evalinsertsortbb3in, evalinsertsortbb1in, evalinsertsortstop;
  transition t0 := {
    from   := evalinsertsortstart;
    to     := evalinsertsortentryin;
    guard  := true;
    action := E' = ?;
  };
  transition t1 := {
    from   := evalinsertsortentryin;
    to     := evalinsertsortbb5in;
    guard  := true;
    action := A' = 1, E' = ?;
  };
  transition t2 := {
    from   := evalinsertsortbb5in;
    to     := evalinsertsortbbin;
    guard  := B > A;
    action := E' = ?;
  };
  transition t3 := {
    from   := evalinsertsortbb5in;
    to     := evalinsertsortreturnin;
    guard  := A >= B;
    action := E' = ?;
  };
  transition t4 := {
    from   := evalinsertsortbbin;
    to     := evalinsertsortbb2in;
    guard  := true;
    action := C' = E, D' = A - 1, E' = ?;
  };
  transition t5 := {
    from   := evalinsertsortbb2in;
    to     := evalinsertsortbb4in;
    guard  := 0 > D;
    action := E' = ?;
  };
  transition t6 := {
    from   := evalinsertsortbb2in;
    to     := evalinsertsortbb3in;
    guard  := D >= 0;
    action := E' = ?;
  };
  transition t7 := {
    from   := evalinsertsortbb3in;
    to     := evalinsertsortbb1in;
    guard  := E > C;
    action := E' = ?;
  };
  transition t8 := {
    from   := evalinsertsortbb3in;
    to     := evalinsertsortbb4in;
    guard  := C >= E;
    action := E' = ?;
  };
  transition t9 := {
    from   := evalinsertsortbb1in;
    to     := evalinsertsortbb2in;
    guard  := true;
    action := D' = D - 1, E' = ?;
  };
  transition t10 := {
    from   := evalinsertsortbb4in;
    to     := evalinsertsortbb5in;
    guard  := true;
    action := A' = A + 1, E' = ?;
  };
  transition t11 := {
    from   := evalinsertsortreturnin;
    to     := evalinsertsortstop;
    guard  := true;
    action := E' = ?;
  };
}
strategy dumb {
  Region init := { state = evalinsertsortstart };
}
