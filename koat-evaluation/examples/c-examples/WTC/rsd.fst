model main {
  var A, B, C, D;
  states evalrsdstart, evalrsdentryin, evalrsdbbin, evalrsdreturnin, evalrsdbb4in, evalrsdbb1in, evalrsdbb2in, evalrsdbb3in, evalrsdstop;
  transition t0 := {
    from   := evalrsdstart;
    to     := evalrsdentryin;
    guard  := true;
    action := D' = ?;
  };
  transition t1 := {
    from   := evalrsdentryin;
    to     := evalrsdbbin;
    guard  := A >= 0;
    action := D' = ?;
  };
  transition t2 := {
    from   := evalrsdentryin;
    to     := evalrsdreturnin;
    guard  := 0 > A;
    action := D' = ?;
  };
  transition t3 := {
    from   := evalrsdbbin;
    to     := evalrsdbb4in;
    guard  := true;
    action := B' = 2*A, C' = 2*A, D' = ?;
  };
  transition t4 := {
    from   := evalrsdbb4in;
    to     := evalrsdbb1in;
    guard  := C >= A;
    action := D' = ?;
  };
  transition t5 := {
    from   := evalrsdbb4in;
    to     := evalrsdreturnin;
    guard  := A > C;
    action := D' = ?;
  };
  transition t6 := {
    from   := evalrsdbb1in;
    to     := evalrsdbb2in;
    guard  := 0 > D;
    action := D' = ?;
  };
  transition t7 := {
    from   := evalrsdbb1in;
    to     := evalrsdbb2in;
    guard  := D > 0;
    action := D' = ?;
  };
  transition t8 := {
    from   := evalrsdbb1in;
    to     := evalrsdbb3in;
    guard  := true;
    action := D' = ?;
  };
  transition t9 := {
    from   := evalrsdbb2in;
    to     := evalrsdbb4in;
    guard  := true;
    action := C' = C - 1, D' = ?;
  };
  transition t10 := {
    from   := evalrsdbb3in;
    to     := evalrsdbb4in;
    guard  := true;
    action := B' = B - 1, C' = B - 1, D' = ?;
  };
  transition t11 := {
    from   := evalrsdreturnin;
    to     := evalrsdstop;
    guard  := true;
    action := D' = ?;
  };
}
strategy dumb {
  Region init := { state = evalrsdstart };
}
