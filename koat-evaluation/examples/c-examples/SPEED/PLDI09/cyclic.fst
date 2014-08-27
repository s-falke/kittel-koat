model main {
  var A, B, C, D;
  states evalcyclicstart, evalcyclicentryin, evalcyclicbb3in, evalcyclicreturnin, evalcyclicbb4in, evalcyclicbbin, evalcyclicstop;
  transition t0 := {
    from   := evalcyclicstart;
    to     := evalcyclicentryin;
    guard  := true;
    action := D' = ?;
  };
  transition t1 := {
    from   := evalcyclicentryin;
    to     := evalcyclicbb3in;
    guard  := A >= 0 && B > A;
    action := C' = A + 1, D' = ?;
  };
  transition t2 := {
    from   := evalcyclicbb3in;
    to     := evalcyclicreturnin;
    guard  := C = A;
    action := D' = ?;
  };
  transition t3 := {
    from   := evalcyclicbb3in;
    to     := evalcyclicbb4in;
    guard  := A > C;
    action := D' = ?;
  };
  transition t4 := {
    from   := evalcyclicbb3in;
    to     := evalcyclicbb4in;
    guard  := C > A;
    action := D' = ?;
  };
  transition t5 := {
    from   := evalcyclicbb4in;
    to     := evalcyclicbbin;
    guard  := 0 > D;
    action := D' = ?;
  };
  transition t6 := {
    from   := evalcyclicbb4in;
    to     := evalcyclicbbin;
    guard  := D > 0;
    action := D' = ?;
  };
  transition t7 := {
    from   := evalcyclicbb4in;
    to     := evalcyclicreturnin;
    guard  := true;
    action := D' = ?;
  };
  transition t8 := {
    from   := evalcyclicbbin;
    to     := evalcyclicbb3in;
    guard  := B >= C;
    action := C' = C + 1, D' = ?;
  };
  transition t9 := {
    from   := evalcyclicbbin;
    to     := evalcyclicbb3in;
    guard  := C > B;
    action := C' = 0, D' = ?;
  };
  transition t10 := {
    from   := evalcyclicreturnin;
    to     := evalcyclicstop;
    guard  := true;
    action := D' = ?;
  };
}
strategy dumb {
  Region init := { state = evalcyclicstart };
}
