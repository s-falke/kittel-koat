model main {
  var A, B, C, D;
  states evalspeedFails4start, evalspeedFails4entryin, evalspeedFails4bb6in, evalspeedFails4bb3in, evalspeedFails4returnin, evalspeedFails4bb4in, evalspeedFails4bb5in, evalspeedFails4stop;
  transition t0 := {
    from   := evalspeedFails4start;
    to     := evalspeedFails4entryin;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := evalspeedFails4entryin;
    to     := evalspeedFails4bb6in;
    guard  := A > 0;
    action := B' = C, C' = A, A' = 1, D' = B;
  };
  transition t2 := {
    from   := evalspeedFails4entryin;
    to     := evalspeedFails4bb6in;
    guard  := 0 >= A;
    action := B' = C, C' = A, A' = -1, D' = B;
  };
  transition t3 := {
    from   := evalspeedFails4bb6in;
    to     := evalspeedFails4bb3in;
    guard  := B >= D;
    action := ;
  };
  transition t4 := {
    from   := evalspeedFails4bb6in;
    to     := evalspeedFails4returnin;
    guard  := D > B;
    action := ;
  };
  transition t5 := {
    from   := evalspeedFails4bb3in;
    to     := evalspeedFails4bb4in;
    guard  := C > 0;
    action := ;
  };
  transition t6 := {
    from   := evalspeedFails4bb3in;
    to     := evalspeedFails4bb5in;
    guard  := 0 >= C;
    action := ;
  };
  transition t7 := {
    from   := evalspeedFails4bb4in;
    to     := evalspeedFails4bb6in;
    guard  := true;
    action := D' = D + A;
  };
  transition t8 := {
    from   := evalspeedFails4bb5in;
    to     := evalspeedFails4bb6in;
    guard  := true;
    action := D' = D - A;
  };
  transition t9 := {
    from   := evalspeedFails4returnin;
    to     := evalspeedFails4stop;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = evalspeedFails4start };
}
