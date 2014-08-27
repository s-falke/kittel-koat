model main {
  var A, B, C, D;
  states evalspeedpldi3start, evalspeedpldi3entryin, evalspeedpldi3returnin, evalspeedpldi3bb5in, evalspeedpldi3bb2in, evalspeedpldi3bb3in, evalspeedpldi3bb4in, evalspeedpldi3stop;
  transition t0 := {
    from   := evalspeedpldi3start;
    to     := evalspeedpldi3entryin;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := evalspeedpldi3entryin;
    to     := evalspeedpldi3returnin;
    guard  := 0 >= A;
    action := ;
  };
  transition t2 := {
    from   := evalspeedpldi3entryin;
    to     := evalspeedpldi3returnin;
    guard  := A >= B;
    action := ;
  };
  transition t3 := {
    from   := evalspeedpldi3entryin;
    to     := evalspeedpldi3bb5in;
    guard  := A > 0 && B > A;
    action := C' = 0, D' = 0;
  };
  transition t4 := {
    from   := evalspeedpldi3bb5in;
    to     := evalspeedpldi3bb2in;
    guard  := B > D;
    action := ;
  };
  transition t5 := {
    from   := evalspeedpldi3bb5in;
    to     := evalspeedpldi3returnin;
    guard  := D >= B;
    action := ;
  };
  transition t6 := {
    from   := evalspeedpldi3bb2in;
    to     := evalspeedpldi3bb3in;
    guard  := A > C;
    action := ;
  };
  transition t7 := {
    from   := evalspeedpldi3bb2in;
    to     := evalspeedpldi3bb4in;
    guard  := C >= A;
    action := ;
  };
  transition t8 := {
    from   := evalspeedpldi3bb3in;
    to     := evalspeedpldi3bb5in;
    guard  := true;
    action := C' = C + 1;
  };
  transition t9 := {
    from   := evalspeedpldi3bb4in;
    to     := evalspeedpldi3bb5in;
    guard  := true;
    action := C' = 0, D' = D + 1;
  };
  transition t10 := {
    from   := evalspeedpldi3returnin;
    to     := evalspeedpldi3stop;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = evalspeedpldi3start };
}
