model main {
  var A;
  states evalndecrstart, evalndecrentryin, evalndecrbb1in, evalndecrbbin, evalndecrreturnin, evalndecrstop;
  transition t0 := {
    from   := evalndecrstart;
    to     := evalndecrentryin;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := evalndecrentryin;
    to     := evalndecrbb1in;
    guard  := true;
    action := A' = A - 1;
  };
  transition t2 := {
    from   := evalndecrbb1in;
    to     := evalndecrbbin;
    guard  := A > 1;
    action := ;
  };
  transition t3 := {
    from   := evalndecrbb1in;
    to     := evalndecrreturnin;
    guard  := 1 >= A;
    action := ;
  };
  transition t4 := {
    from   := evalndecrbbin;
    to     := evalndecrbb1in;
    guard  := true;
    action := A' = A - 1;
  };
  transition t5 := {
    from   := evalndecrreturnin;
    to     := evalndecrstop;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = evalndecrstart };
}
