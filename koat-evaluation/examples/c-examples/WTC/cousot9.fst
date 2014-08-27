model main {
  var A, B, C, D;
  states evalcousot9start, evalcousot9entryin, evalcousot9bb3in, evalcousot9bbin, evalcousot9returnin, evalcousot9bb1in, evalcousot9bb2in, evalcousot9stop;
  transition t0 := {
    from   := evalcousot9start;
    to     := evalcousot9entryin;
    guard  := true;
    action := D' = ?;
  };
  transition t1 := {
    from   := evalcousot9entryin;
    to     := evalcousot9bb3in;
    guard  := true;
    action := A' = D, B' = C, D' = ?;
  };
  transition t2 := {
    from   := evalcousot9bb3in;
    to     := evalcousot9bbin;
    guard  := B > 0;
    action := D' = ?;
  };
  transition t3 := {
    from   := evalcousot9bb3in;
    to     := evalcousot9returnin;
    guard  := 0 >= B;
    action := D' = ?;
  };
  transition t4 := {
    from   := evalcousot9bbin;
    to     := evalcousot9bb1in;
    guard  := A > 0;
    action := D' = ?;
  };
  transition t5 := {
    from   := evalcousot9bbin;
    to     := evalcousot9bb2in;
    guard  := 0 >= A;
    action := D' = ?;
  };
  transition t6 := {
    from   := evalcousot9bb1in;
    to     := evalcousot9bb3in;
    guard  := true;
    action := A' = A - 1, D' = ?;
  };
  transition t7 := {
    from   := evalcousot9bb2in;
    to     := evalcousot9bb3in;
    guard  := true;
    action := A' = C, B' = B - 1, D' = ?;
  };
  transition t8 := {
    from   := evalcousot9returnin;
    to     := evalcousot9stop;
    guard  := true;
    action := D' = ?;
  };
}
strategy dumb {
  Region init := { state = evalcousot9start };
}
