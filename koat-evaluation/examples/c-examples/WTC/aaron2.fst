model main {
  var A, B, C, D;
  states evalaaron2start, evalaaron2entryin, evalaaron2bb6in, evalaaron2returnin, evalaaron2bb3in, evalaaron2bb4in, evalaaron2bb5in, evalaaron2stop;
  transition t0 := {
    from   := evalaaron2start;
    to     := evalaaron2entryin;
    guard  := true;
    action := D' = ?;
  };
  transition t1 := {
    from   := evalaaron2entryin;
    to     := evalaaron2bb6in;
    guard  := A >= 0;
    action := B' = C, C' = B, D' = ?;
  };
  transition t2 := {
    from   := evalaaron2entryin;
    to     := evalaaron2returnin;
    guard  := 0 > A;
    action := D' = ?;
  };
  transition t3 := {
    from   := evalaaron2bb6in;
    to     := evalaaron2returnin;
    guard  := B > C;
    action := D' = ?;
  };
  transition t4 := {
    from   := evalaaron2bb6in;
    to     := evalaaron2returnin;
    guard  := 0 > A;
    action := D' = ?;
  };
  transition t5 := {
    from   := evalaaron2bb6in;
    to     := evalaaron2bb3in;
    guard  := C >= B && A >= 0;
    action := D' = ?;
  };
  transition t6 := {
    from   := evalaaron2bb3in;
    to     := evalaaron2bb4in;
    guard  := 0 > D;
    action := D' = ?;
  };
  transition t7 := {
    from   := evalaaron2bb3in;
    to     := evalaaron2bb4in;
    guard  := D > 0;
    action := D' = ?;
  };
  transition t8 := {
    from   := evalaaron2bb3in;
    to     := evalaaron2bb5in;
    guard  := true;
    action := D' = ?;
  };
  transition t9 := {
    from   := evalaaron2bb4in;
    to     := evalaaron2bb6in;
    guard  := true;
    action := C' = C - A - 1, D' = ?;
  };
  transition t10 := {
    from   := evalaaron2bb5in;
    to     := evalaaron2bb6in;
    guard  := true;
    action := B' = B + A + 1, D' = ?;
  };
  transition t11 := {
    from   := evalaaron2returnin;
    to     := evalaaron2stop;
    guard  := true;
    action := D' = ?;
  };
}
strategy dumb {
  Region init := { state = evalaaron2start };
}
