model main {
  var A, B;
  states evalspeedpldi4start, evalspeedpldi4entryin, evalspeedpldi4returnin, evalspeedpldi4bb5in, evalspeedpldi4bb2in, evalspeedpldi4bb3in, evalspeedpldi4bb4in, evalspeedpldi4stop;
  transition t0 := {
    from   := evalspeedpldi4start;
    to     := evalspeedpldi4entryin;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := evalspeedpldi4entryin;
    to     := evalspeedpldi4returnin;
    guard  := 0 >= A;
    action := ;
  };
  transition t2 := {
    from   := evalspeedpldi4entryin;
    to     := evalspeedpldi4returnin;
    guard  := A >= B;
    action := ;
  };
  transition t3 := {
    from   := evalspeedpldi4entryin;
    to     := evalspeedpldi4bb5in;
    guard  := A > 0 && B > A;
    action := ;
  };
  transition t4 := {
    from   := evalspeedpldi4bb5in;
    to     := evalspeedpldi4bb2in;
    guard  := B > 0;
    action := ;
  };
  transition t5 := {
    from   := evalspeedpldi4bb5in;
    to     := evalspeedpldi4returnin;
    guard  := 0 >= B;
    action := ;
  };
  transition t6 := {
    from   := evalspeedpldi4bb2in;
    to     := evalspeedpldi4bb3in;
    guard  := A > B;
    action := ;
  };
  transition t7 := {
    from   := evalspeedpldi4bb2in;
    to     := evalspeedpldi4bb4in;
    guard  := B >= A;
    action := ;
  };
  transition t8 := {
    from   := evalspeedpldi4bb3in;
    to     := evalspeedpldi4bb5in;
    guard  := true;
    action := B' = B - 1;
  };
  transition t9 := {
    from   := evalspeedpldi4bb4in;
    to     := evalspeedpldi4bb5in;
    guard  := true;
    action := B' = B - A;
  };
  transition t10 := {
    from   := evalspeedpldi4returnin;
    to     := evalspeedpldi4stop;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = evalspeedpldi4start };
}
