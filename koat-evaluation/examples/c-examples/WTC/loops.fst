model main {
  var A, B, C;
  states evalloopsstart, evalloopsentryin, evalloopsbb6in, evalloopsreturnin, evalloopsbb1in, evalloopsbb4in, evalloopsbb5in, evalloopsbb3in, evalloopsstop;
  transition t0 := {
    from   := evalloopsstart;
    to     := evalloopsentryin;
    guard  := true;
    action := C' = ?;
  };
  transition t1 := {
    from   := evalloopsentryin;
    to     := evalloopsbb6in;
    guard  := A >= 0;
    action := C' = ?;
  };
  transition t2 := {
    from   := evalloopsentryin;
    to     := evalloopsreturnin;
    guard  := 0 > A;
    action := C' = ?;
  };
  transition t3 := {
    from   := evalloopsbb6in;
    to     := evalloopsbb1in;
    guard  := A >= 0;
    action := C' = ?;
  };
  transition t4 := {
    from   := evalloopsbb6in;
    to     := evalloopsreturnin;
    guard  := 0 > A;
    action := C' = ?;
  };
  transition t5 := {
    from   := evalloopsbb1in;
    to     := evalloopsbb4in;
    guard  := A > 1;
    action := B' = 1, C' = ?;
  };
  transition t6 := {
    from   := evalloopsbb1in;
    to     := evalloopsbb5in;
    guard  := 1 >= A;
    action := B' = C, C' = ?;
  };
  transition t7 := {
    from   := evalloopsbb4in;
    to     := evalloopsbb3in;
    guard  := A > B;
    action := C' = ?;
  };
  transition t8 := {
    from   := evalloopsbb4in;
    to     := evalloopsbb5in;
    guard  := B >= A;
    action := C' = ?;
  };
  transition t9 := {
    from   := evalloopsbb3in;
    to     := evalloopsbb4in;
    guard  := true;
    action := B' = 2*B, C' = ?;
  };
  transition t10 := {
    from   := evalloopsbb5in;
    to     := evalloopsbb6in;
    guard  := true;
    action := A' = A - 1, C' = ?;
  };
  transition t11 := {
    from   := evalloopsreturnin;
    to     := evalloopsstop;
    guard  := true;
    action := C' = ?;
  };
}
strategy dumb {
  Region init := { state = evalloopsstart };
}
