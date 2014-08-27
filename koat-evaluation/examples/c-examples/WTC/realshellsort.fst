model main {
  var A, B, C, D, E, F;
  states evalrealshellsortstart, evalrealshellsortentryin, evalrealshellsortbb8in, evalrealshellsortbb6in, evalrealshellsortreturnin, evalrealshellsortbb1in, evalrealshellsortbb7in, evalrealshellsortbb3in, evalrealshellsortbb5in, evalrealshellsortbb4in, evalrealshellsortbb2in, evalrealshellsortstop;
  transition t0 := {
    from   := evalrealshellsortstart;
    to     := evalrealshellsortentryin;
    guard  := true;
    action := F' = ?;
  };
  transition t1 := {
    from   := evalrealshellsortentryin;
    to     := evalrealshellsortbb8in;
    guard  := A = 0;
    action := B' = 0, F' = ?;
  };
  transition t2 := {
    from   := evalrealshellsortentryin;
    to     := evalrealshellsortbb8in;
    guard  := A > 0 && F >= 0 && A >= 2*F && 1 + 2*F >= A;
    action := B' = F, F' = ?;
  };
  transition t3 := {
    from   := evalrealshellsortentryin;
    to     := evalrealshellsortbb8in;
    guard  := 0 > A && 0 >= F && 2*F >= A && 1 + A >= 2*F;
    action := B' = F, F' = ?;
  };
  transition t4 := {
    from   := evalrealshellsortbb8in;
    to     := evalrealshellsortbb6in;
    guard  := B > 0;
    action := C' = 0, F' = ?;
  };
  transition t5 := {
    from   := evalrealshellsortbb8in;
    to     := evalrealshellsortreturnin;
    guard  := 0 >= B;
    action := F' = ?;
  };
  transition t6 := {
    from   := evalrealshellsortbb6in;
    to     := evalrealshellsortbb1in;
    guard  := A > C;
    action := F' = ?;
  };
  transition t7 := {
    from   := evalrealshellsortbb6in;
    to     := evalrealshellsortbb7in;
    guard  := C >= A;
    action := F' = ?;
  };
  transition t8 := {
    from   := evalrealshellsortbb1in;
    to     := evalrealshellsortbb3in;
    guard  := true;
    action := D' = F, E' = C, F' = ?;
  };
  transition t9 := {
    from   := evalrealshellsortbb3in;
    to     := evalrealshellsortbb5in;
    guard  := B > E;
    action := F' = ?;
  };
  transition t10 := {
    from   := evalrealshellsortbb3in;
    to     := evalrealshellsortbb4in;
    guard  := E >= B;
    action := F' = ?;
  };
  transition t11 := {
    from   := evalrealshellsortbb4in;
    to     := evalrealshellsortbb2in;
    guard  := F > D;
    action := F' = ?;
  };
  transition t12 := {
    from   := evalrealshellsortbb4in;
    to     := evalrealshellsortbb5in;
    guard  := D >= F;
    action := F' = ?;
  };
  transition t13 := {
    from   := evalrealshellsortbb2in;
    to     := evalrealshellsortbb3in;
    guard  := true;
    action := E' = E - B, F' = ?;
  };
  transition t14 := {
    from   := evalrealshellsortbb5in;
    to     := evalrealshellsortbb6in;
    guard  := true;
    action := C' = C + 1, F' = ?;
  };
  transition t15 := {
    from   := evalrealshellsortbb7in;
    to     := evalrealshellsortbb8in;
    guard  := B = 0;
    action := B' = 0, F' = ?;
  };
  transition t16 := {
    from   := evalrealshellsortbb7in;
    to     := evalrealshellsortbb8in;
    guard  := B > 0 && F >= 0 && B >= 2*F && 1 + 2*F >= B;
    action := B' = F, F' = ?;
  };
  transition t17 := {
    from   := evalrealshellsortbb7in;
    to     := evalrealshellsortbb8in;
    guard  := 0 > B && 0 >= F && 2*F >= B && 1 + B >= 2*F;
    action := B' = F, F' = ?;
  };
  transition t18 := {
    from   := evalrealshellsortreturnin;
    to     := evalrealshellsortstop;
    guard  := true;
    action := F' = ?;
  };
}
strategy dumb {
  Region init := { state = evalrealshellsortstart };
}
