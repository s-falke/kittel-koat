model main {
  var A, B, C;
  states evalterminatestart, evalterminateentryin, evalterminatebb1in, evalterminatebbin, evalterminatereturnin, evalterminatestop;
  transition t0 := {
    from   := evalterminatestart;
    to     := evalterminateentryin;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := evalterminateentryin;
    to     := evalterminatebb1in;
    guard  := true;
    action := A' = B, B' = A;
  };
  transition t2 := {
    from   := evalterminatebb1in;
    to     := evalterminatebbin;
    guard  := 100 >= B && A >= C;
    action := ;
  };
  transition t3 := {
    from   := evalterminatebb1in;
    to     := evalterminatereturnin;
    guard  := B > 100;
    action := ;
  };
  transition t4 := {
    from   := evalterminatebb1in;
    to     := evalterminatereturnin;
    guard  := C > A;
    action := ;
  };
  transition t5 := {
    from   := evalterminatebbin;
    to     := evalterminatebb1in;
    guard  := true;
    action := A' = A - 1, C' = B + 1, B' = C;
  };
  transition t6 := {
    from   := evalterminatereturnin;
    to     := evalterminatestop;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = evalterminatestart };
}
