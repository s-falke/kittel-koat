model main {
  var A, B;
  states evalSimpleSinglestart, evalSimpleSingleentryin, evalSimpleSinglebb3in, evalSimpleSinglebbin, evalSimpleSinglereturnin, evalSimpleSinglestop;
  transition t0 := {
    from   := evalSimpleSinglestart;
    to     := evalSimpleSingleentryin;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := evalSimpleSingleentryin;
    to     := evalSimpleSinglebb3in;
    guard  := true;
    action := A' = 0;
  };
  transition t2 := {
    from   := evalSimpleSinglebb3in;
    to     := evalSimpleSinglebbin;
    guard  := B > A;
    action := ;
  };
  transition t3 := {
    from   := evalSimpleSinglebb3in;
    to     := evalSimpleSinglereturnin;
    guard  := A >= B;
    action := ;
  };
  transition t4 := {
    from   := evalSimpleSinglebbin;
    to     := evalSimpleSinglebb3in;
    guard  := true;
    action := A' = A + 1;
  };
  transition t5 := {
    from   := evalSimpleSinglereturnin;
    to     := evalSimpleSinglestop;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = evalSimpleSinglestart };
}
