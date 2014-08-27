model main {
  var A, B;
  states evalndloopstart, evalndloopentryin, evalndloopbbin, evalndloopreturnin, evalndloopstop;
  transition t0 := {
    from   := evalndloopstart;
    to     := evalndloopentryin;
    guard  := true;
    action := B' = ?;
  };
  transition t1 := {
    from   := evalndloopentryin;
    to     := evalndloopbbin;
    guard  := true;
    action := A' = 0, B' = ?;
  };
  transition t2 := {
    from   := evalndloopbbin;
    to     := evalndloopbbin;
    guard  := 2 + A >= B && B > A && 9 >= B;
    action := A' = B, B' = ?;
  };
  transition t3 := {
    from   := evalndloopbbin;
    to     := evalndloopreturnin;
    guard  := B > A + 2;
    action := B' = ?;
  };
  transition t4 := {
    from   := evalndloopbbin;
    to     := evalndloopreturnin;
    guard  := A >= B;
    action := B' = ?;
  };
  transition t5 := {
    from   := evalndloopbbin;
    to     := evalndloopreturnin;
    guard  := B > 9;
    action := B' = ?;
  };
  transition t6 := {
    from   := evalndloopreturnin;
    to     := evalndloopstop;
    guard  := true;
    action := B' = ?;
  };
}
strategy dumb {
  Region init := { state = evalndloopstart };
}
