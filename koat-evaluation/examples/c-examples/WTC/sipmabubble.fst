model main {
  var A, B, C, D;
  states evalsipmabubblestart, evalsipmabubbleentryin, evalsipmabubblebb6in, evalsipmabubblebb4in, evalsipmabubblereturnin, evalsipmabubblebb1in, evalsipmabubblebb5in, evalsipmabubblebb2in, evalsipmabubblebb3in, evalsipmabubblestop;
  transition t0 := {
    from   := evalsipmabubblestart;
    to     := evalsipmabubbleentryin;
    guard  := true;
    action := C' = ?, D' = ?;
  };
  transition t1 := {
    from   := evalsipmabubbleentryin;
    to     := evalsipmabubblebb6in;
    guard  := true;
    action := C' = ?, D' = ?;
  };
  transition t2 := {
    from   := evalsipmabubblebb6in;
    to     := evalsipmabubblebb4in;
    guard  := A >= 0;
    action := B' = 0, C' = ?, D' = ?;
  };
  transition t3 := {
    from   := evalsipmabubblebb6in;
    to     := evalsipmabubblereturnin;
    guard  := 0 > A;
    action := C' = ?, D' = ?;
  };
  transition t4 := {
    from   := evalsipmabubblebb4in;
    to     := evalsipmabubblebb1in;
    guard  := A > B;
    action := C' = ?, D' = ?;
  };
  transition t5 := {
    from   := evalsipmabubblebb4in;
    to     := evalsipmabubblebb5in;
    guard  := B >= A;
    action := C' = ?, D' = ?;
  };
  transition t6 := {
    from   := evalsipmabubblebb1in;
    to     := evalsipmabubblebb2in;
    guard  := C > D;
    action := C' = ?, D' = ?;
  };
  transition t7 := {
    from   := evalsipmabubblebb1in;
    to     := evalsipmabubblebb3in;
    guard  := D >= C;
    action := C' = ?, D' = ?;
  };
  transition t8 := {
    from   := evalsipmabubblebb2in;
    to     := evalsipmabubblebb3in;
    guard  := true;
    action := C' = ?, D' = ?;
  };
  transition t9 := {
    from   := evalsipmabubblebb3in;
    to     := evalsipmabubblebb4in;
    guard  := true;
    action := B' = B + 1, C' = ?, D' = ?;
  };
  transition t10 := {
    from   := evalsipmabubblebb5in;
    to     := evalsipmabubblebb6in;
    guard  := true;
    action := A' = A - 1, C' = ?, D' = ?;
  };
  transition t11 := {
    from   := evalsipmabubblereturnin;
    to     := evalsipmabubblestop;
    guard  := true;
    action := C' = ?, D' = ?;
  };
}
strategy dumb {
  Region init := { state = evalsipmabubblestart };
}
