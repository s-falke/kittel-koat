model main {
  var A, B, C, D, E, F;
  states evalrealbubblestart, evalrealbubbleentryin, evalrealbubblebb7in, evalrealbubblebb4in, evalrealbubblereturnin, evalrealbubblebb1in, evalrealbubblebb5in, evalrealbubblebb2in, evalrealbubblebb3in, evalrealbubblebb6in, evalrealbubblestop;
  transition t0 := {
    from   := evalrealbubblestart;
    to     := evalrealbubbleentryin;
    guard  := true;
    action := E' = ?, F' = ?;
  };
  transition t1 := {
    from   := evalrealbubbleentryin;
    to     := evalrealbubblebb7in;
    guard  := true;
    action := A' = A - 1, E' = ?, F' = ?;
  };
  transition t2 := {
    from   := evalrealbubblebb7in;
    to     := evalrealbubblebb4in;
    guard  := A > 0;
    action := B' = 0, C' = 0, E' = ?, F' = ?;
  };
  transition t3 := {
    from   := evalrealbubblebb7in;
    to     := evalrealbubblereturnin;
    guard  := 0 >= A;
    action := E' = ?, F' = ?;
  };
  transition t4 := {
    from   := evalrealbubblebb4in;
    to     := evalrealbubblebb1in;
    guard  := A > B;
    action := E' = ?, F' = ?;
  };
  transition t5 := {
    from   := evalrealbubblebb4in;
    to     := evalrealbubblebb5in;
    guard  := B >= A;
    action := E' = ?, F' = ?;
  };
  transition t6 := {
    from   := evalrealbubblebb1in;
    to     := evalrealbubblebb2in;
    guard  := E > F;
    action := E' = ?, F' = ?;
  };
  transition t7 := {
    from   := evalrealbubblebb1in;
    to     := evalrealbubblebb3in;
    guard  := F >= E;
    action := D' = C, E' = ?, F' = ?;
  };
  transition t8 := {
    from   := evalrealbubblebb2in;
    to     := evalrealbubblebb3in;
    guard  := true;
    action := D' = 1, E' = ?, F' = ?;
  };
  transition t9 := {
    from   := evalrealbubblebb3in;
    to     := evalrealbubblebb4in;
    guard  := true;
    action := B' = B + 1, C' = D, E' = ?, F' = ?;
  };
  transition t10 := {
    from   := evalrealbubblebb5in;
    to     := evalrealbubblereturnin;
    guard  := C = 0;
    action := E' = ?, F' = ?;
  };
  transition t11 := {
    from   := evalrealbubblebb5in;
    to     := evalrealbubblebb6in;
    guard  := 0 > C;
    action := E' = ?, F' = ?;
  };
  transition t12 := {
    from   := evalrealbubblebb5in;
    to     := evalrealbubblebb6in;
    guard  := C > 0;
    action := E' = ?, F' = ?;
  };
  transition t13 := {
    from   := evalrealbubblebb6in;
    to     := evalrealbubblebb7in;
    guard  := true;
    action := A' = A - 1, E' = ?, F' = ?;
  };
  transition t14 := {
    from   := evalrealbubblereturnin;
    to     := evalrealbubblestop;
    guard  := true;
    action := E' = ?, F' = ?;
  };
}
strategy dumb {
  Region init := { state = evalrealbubblestart };
}
