model main {
  var A, B, C, D, E;
  states evalwcet1start, evalwcet1entryin, evalwcet1bbin, evalwcet1returnin, evalwcet1bb1in, evalwcet1bb4in, evalwcet1bb6in, evalwcet1bb5in, evalwcet1stop;
  transition t0 := {
    from   := evalwcet1start;
    to     := evalwcet1entryin;
    guard  := true;
    action := E' = ?;
  };
  transition t1 := {
    from   := evalwcet1entryin;
    to     := evalwcet1bbin;
    guard  := A > 0;
    action := B' = 0, C' = A, E' = ?;
  };
  transition t2 := {
    from   := evalwcet1entryin;
    to     := evalwcet1returnin;
    guard  := 0 >= A;
    action := E' = ?;
  };
  transition t3 := {
    from   := evalwcet1bbin;
    to     := evalwcet1bb1in;
    guard  := 0 > E;
    action := E' = ?;
  };
  transition t4 := {
    from   := evalwcet1bbin;
    to     := evalwcet1bb1in;
    guard  := E > 0;
    action := E' = ?;
  };
  transition t5 := {
    from   := evalwcet1bbin;
    to     := evalwcet1bb4in;
    guard  := true;
    action := E' = ?;
  };
  transition t6 := {
    from   := evalwcet1bb1in;
    to     := evalwcet1bb6in;
    guard  := B + 1 >= A;
    action := D' = 0, E' = ?;
  };
  transition t7 := {
    from   := evalwcet1bb1in;
    to     := evalwcet1bb6in;
    guard  := A > B + 1;
    action := D' = B + 1, E' = ?;
  };
  transition t8 := {
    from   := evalwcet1bb4in;
    to     := evalwcet1bb5in;
    guard  := 1 >= B;
    action := E' = ?;
  };
  transition t9 := {
    from   := evalwcet1bb4in;
    to     := evalwcet1bb6in;
    guard  := B > 1;
    action := D' = B - 1, E' = ?;
  };
  transition t10 := {
    from   := evalwcet1bb5in;
    to     := evalwcet1bb6in;
    guard  := true;
    action := D' = 0, E' = ?;
  };
  transition t11 := {
    from   := evalwcet1bb6in;
    to     := evalwcet1bbin;
    guard  := C > 1;
    action := B' = D, C' = C - 1, E' = ?;
  };
  transition t12 := {
    from   := evalwcet1bb6in;
    to     := evalwcet1returnin;
    guard  := 1 >= C;
    action := E' = ?;
  };
  transition t13 := {
    from   := evalwcet1returnin;
    to     := evalwcet1stop;
    guard  := true;
    action := E' = ?;
  };
}
strategy dumb {
  Region init := { state = evalwcet1start };
}
