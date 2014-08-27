model main {
  var A, B;
  states evalwcet2start, evalwcet2entryin, evalwcet2bb5in, evalwcet2bb2in, evalwcet2returnin, evalwcet2bb1in, evalwcet2bb4in, evalwcet2stop;
  transition t0 := {
    from   := evalwcet2start;
    to     := evalwcet2entryin;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := evalwcet2entryin;
    to     := evalwcet2bb5in;
    guard  := true;
    action := ;
  };
  transition t2 := {
    from   := evalwcet2bb5in;
    to     := evalwcet2bb2in;
    guard  := 4 >= A;
    action := B' = 0;
  };
  transition t3 := {
    from   := evalwcet2bb5in;
    to     := evalwcet2returnin;
    guard  := A > 4;
    action := ;
  };
  transition t4 := {
    from   := evalwcet2bb2in;
    to     := evalwcet2bb1in;
    guard  := A > 2 && 9 >= B;
    action := ;
  };
  transition t5 := {
    from   := evalwcet2bb2in;
    to     := evalwcet2bb4in;
    guard  := 2 >= A;
    action := ;
  };
  transition t6 := {
    from   := evalwcet2bb2in;
    to     := evalwcet2bb4in;
    guard  := B > 9;
    action := ;
  };
  transition t7 := {
    from   := evalwcet2bb1in;
    to     := evalwcet2bb2in;
    guard  := true;
    action := B' = B + 1;
  };
  transition t8 := {
    from   := evalwcet2bb4in;
    to     := evalwcet2bb5in;
    guard  := true;
    action := A' = A + 1;
  };
  transition t9 := {
    from   := evalwcet2returnin;
    to     := evalwcet2stop;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = evalwcet2start };
}
