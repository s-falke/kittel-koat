model main {
  var A, B, C, D, E;
  states evalrealselectstart, evalrealselectentryin, evalrealselectbb6in, evalrealselectbbin, evalrealselectreturnin, evalrealselectbb4in, evalrealselectbb1in, evalrealselectbb5in, evalrealselectstop;
  transition t0 := {
    from   := evalrealselectstart;
    to     := evalrealselectentryin;
    guard  := true;
    action := D' = ?, E' = ?;
  };
  transition t1 := {
    from   := evalrealselectentryin;
    to     := evalrealselectbb6in;
    guard  := true;
    action := A' = 0, D' = ?, E' = ?;
  };
  transition t2 := {
    from   := evalrealselectbb6in;
    to     := evalrealselectbbin;
    guard  := B > 1 + A;
    action := D' = ?, E' = ?;
  };
  transition t3 := {
    from   := evalrealselectbb6in;
    to     := evalrealselectreturnin;
    guard  := A + 1 >= B;
    action := D' = ?, E' = ?;
  };
  transition t4 := {
    from   := evalrealselectbbin;
    to     := evalrealselectbb4in;
    guard  := true;
    action := C' = A + 1, D' = ?, E' = ?;
  };
  transition t5 := {
    from   := evalrealselectbb4in;
    to     := evalrealselectbb1in;
    guard  := B > C;
    action := D' = ?, E' = ?;
  };
  transition t6 := {
    from   := evalrealselectbb4in;
    to     := evalrealselectbb5in;
    guard  := C >= B;
    action := D' = ?, E' = ?;
  };
  transition t7 := {
    from   := evalrealselectbb1in;
    to     := evalrealselectbb4in;
    guard  := D > E;
    action := C' = C + 1, D' = ?, E' = ?;
  };
  transition t8 := {
    from   := evalrealselectbb1in;
    to     := evalrealselectbb4in;
    guard  := E >= D;
    action := C' = C + 1, D' = ?, E' = ?;
  };
  transition t9 := {
    from   := evalrealselectbb5in;
    to     := evalrealselectbb6in;
    guard  := true;
    action := A' = A + 1, D' = ?, E' = ?;
  };
  transition t10 := {
    from   := evalrealselectreturnin;
    to     := evalrealselectstop;
    guard  := true;
    action := D' = ?, E' = ?;
  };
}
strategy dumb {
  Region init := { state = evalrealselectstart };
}
