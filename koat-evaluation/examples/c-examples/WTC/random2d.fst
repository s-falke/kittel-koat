model main {
  var A, B, C, D, E;
  states evalrandom2dstart, evalrandom2dentryin, evalrandom2dbb10in, evalrandom2dbbin, evalrandom2dreturnin, evalrandom2dbb2in, evalrandom2dNodeBlock9in, evalrandom2dNodeBlockin, evalrandom2dNodeBlock7in, evalrandom2dLeafBlockin, evalrandom2dLeafBlock1in, evalrandom2dbb3in, evalrandom2dNewDefaultin, evalrandom2dbb5in, evalrandom2dLeafBlock3in, evalrandom2dLeafBlock5in, evalrandom2dbb7in, evalrandom2dbb9in, evalrandom2dstop;
  transition t0 := {
    from   := evalrandom2dstart;
    to     := evalrandom2dentryin;
    guard  := true;
    action := E' = ?;
  };
  transition t1 := {
    from   := evalrandom2dentryin;
    to     := evalrandom2dbb10in;
    guard  := true;
    action := A' = 0, E' = ?;
  };
  transition t2 := {
    from   := evalrandom2dbb10in;
    to     := evalrandom2dbbin;
    guard  := B > A;
    action := E' = ?;
  };
  transition t3 := {
    from   := evalrandom2dbb10in;
    to     := evalrandom2dreturnin;
    guard  := A >= B;
    action := E' = ?;
  };
  transition t4 := {
    from   := evalrandom2dbbin;
    to     := evalrandom2dbb2in;
    guard  := E >= 0 && 3 >= E;
    action := C' = A + 1, D' = E, E' = ?;
  };
  transition t5 := {
    from   := evalrandom2dbbin;
    to     := evalrandom2dbb10in;
    guard  := 0 > E;
    action := A' = A + 1, E' = ?;
  };
  transition t6 := {
    from   := evalrandom2dbbin;
    to     := evalrandom2dbb10in;
    guard  := E > 3;
    action := A' = A + 1, E' = ?;
  };
  transition t7 := {
    from   := evalrandom2dbb2in;
    to     := evalrandom2dNodeBlock9in;
    guard  := true;
    action := E' = ?;
  };
  transition t8 := {
    from   := evalrandom2dNodeBlock9in;
    to     := evalrandom2dNodeBlockin;
    guard  := 1 >= D;
    action := E' = ?;
  };
  transition t9 := {
    from   := evalrandom2dNodeBlock9in;
    to     := evalrandom2dNodeBlock7in;
    guard  := D > 1;
    action := E' = ?;
  };
  transition t10 := {
    from   := evalrandom2dNodeBlockin;
    to     := evalrandom2dLeafBlockin;
    guard  := 0 >= D;
    action := E' = ?;
  };
  transition t11 := {
    from   := evalrandom2dNodeBlockin;
    to     := evalrandom2dLeafBlock1in;
    guard  := D > 0;
    action := E' = ?;
  };
  transition t12 := {
    from   := evalrandom2dLeafBlockin;
    to     := evalrandom2dbb3in;
    guard  := D = 0;
    action := E' = ?;
  };
  transition t13 := {
    from   := evalrandom2dLeafBlockin;
    to     := evalrandom2dNewDefaultin;
    guard  := 0 > D;
    action := E' = ?;
  };
  transition t14 := {
    from   := evalrandom2dLeafBlockin;
    to     := evalrandom2dNewDefaultin;
    guard  := D > 0;
    action := E' = ?;
  };
  transition t15 := {
    from   := evalrandom2dbb3in;
    to     := evalrandom2dbb10in;
    guard  := true;
    action := A' = C, E' = ?;
  };
  transition t16 := {
    from   := evalrandom2dLeafBlock1in;
    to     := evalrandom2dbb5in;
    guard  := D = 1;
    action := E' = ?;
  };
  transition t17 := {
    from   := evalrandom2dLeafBlock1in;
    to     := evalrandom2dNewDefaultin;
    guard  := 0 >= D;
    action := E' = ?;
  };
  transition t18 := {
    from   := evalrandom2dLeafBlock1in;
    to     := evalrandom2dNewDefaultin;
    guard  := D > 1;
    action := E' = ?;
  };
  transition t19 := {
    from   := evalrandom2dbb5in;
    to     := evalrandom2dbb10in;
    guard  := true;
    action := A' = C, E' = ?;
  };
  transition t20 := {
    from   := evalrandom2dNodeBlock7in;
    to     := evalrandom2dLeafBlock3in;
    guard  := 2 >= D;
    action := E' = ?;
  };
  transition t21 := {
    from   := evalrandom2dNodeBlock7in;
    to     := evalrandom2dLeafBlock5in;
    guard  := D > 2;
    action := E' = ?;
  };
  transition t22 := {
    from   := evalrandom2dLeafBlock3in;
    to     := evalrandom2dbb7in;
    guard  := D = 2;
    action := E' = ?;
  };
  transition t23 := {
    from   := evalrandom2dLeafBlock3in;
    to     := evalrandom2dNewDefaultin;
    guard  := 1 >= D;
    action := E' = ?;
  };
  transition t24 := {
    from   := evalrandom2dLeafBlock3in;
    to     := evalrandom2dNewDefaultin;
    guard  := D > 2;
    action := E' = ?;
  };
  transition t25 := {
    from   := evalrandom2dbb7in;
    to     := evalrandom2dbb10in;
    guard  := true;
    action := A' = C, E' = ?;
  };
  transition t26 := {
    from   := evalrandom2dLeafBlock5in;
    to     := evalrandom2dbb9in;
    guard  := D = 3;
    action := E' = ?;
  };
  transition t27 := {
    from   := evalrandom2dLeafBlock5in;
    to     := evalrandom2dNewDefaultin;
    guard  := 2 >= D;
    action := E' = ?;
  };
  transition t28 := {
    from   := evalrandom2dLeafBlock5in;
    to     := evalrandom2dNewDefaultin;
    guard  := D > 3;
    action := E' = ?;
  };
  transition t29 := {
    from   := evalrandom2dbb9in;
    to     := evalrandom2dbb10in;
    guard  := true;
    action := A' = C, E' = ?;
  };
  transition t30 := {
    from   := evalrandom2dNewDefaultin;
    to     := evalrandom2dbb10in;
    guard  := true;
    action := A' = C, E' = ?;
  };
  transition t31 := {
    from   := evalrandom2dreturnin;
    to     := evalrandom2dstop;
    guard  := true;
    action := E' = ?;
  };
}
strategy dumb {
  Region init := { state = evalrandom2dstart };
}
