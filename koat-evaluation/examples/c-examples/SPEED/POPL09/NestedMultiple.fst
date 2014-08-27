model main {
  var A, B, C, D, E, F;
  states evalNestedMultiplestart, evalNestedMultipleentryin, evalNestedMultiplebb5in, evalNestedMultiplebb2in, evalNestedMultiplereturnin, evalNestedMultiplebb4in, evalNestedMultiplebb3in, evalNestedMultiplebb1in, evalNestedMultiplestop;
  transition t0 := {
    from   := evalNestedMultiplestart;
    to     := evalNestedMultipleentryin;
    guard  := true;
    action := F' = ?;
  };
  transition t1 := {
    from   := evalNestedMultipleentryin;
    to     := evalNestedMultiplebb5in;
    guard  := true;
    action := A' = B, C' = D, B' = A, D' = C, F' = ?;
  };
  transition t2 := {
    from   := evalNestedMultiplebb5in;
    to     := evalNestedMultiplebb2in;
    guard  := A > B;
    action := E' = D, F' = ?;
  };
  transition t3 := {
    from   := evalNestedMultiplebb5in;
    to     := evalNestedMultiplereturnin;
    guard  := B >= A;
    action := F' = ?;
  };
  transition t4 := {
    from   := evalNestedMultiplebb2in;
    to     := evalNestedMultiplebb4in;
    guard  := E >= C;
    action := F' = ?;
  };
  transition t5 := {
    from   := evalNestedMultiplebb2in;
    to     := evalNestedMultiplebb3in;
    guard  := C > E;
    action := F' = ?;
  };
  transition t6 := {
    from   := evalNestedMultiplebb3in;
    to     := evalNestedMultiplebb1in;
    guard  := 0 > F;
    action := F' = ?;
  };
  transition t7 := {
    from   := evalNestedMultiplebb3in;
    to     := evalNestedMultiplebb1in;
    guard  := F > 0;
    action := F' = ?;
  };
  transition t8 := {
    from   := evalNestedMultiplebb3in;
    to     := evalNestedMultiplebb4in;
    guard  := true;
    action := F' = ?;
  };
  transition t9 := {
    from   := evalNestedMultiplebb1in;
    to     := evalNestedMultiplebb2in;
    guard  := true;
    action := E' = E + 1, F' = ?;
  };
  transition t10 := {
    from   := evalNestedMultiplebb4in;
    to     := evalNestedMultiplebb5in;
    guard  := true;
    action := B' = B + 1, D' = E, F' = ?;
  };
  transition t11 := {
    from   := evalNestedMultiplereturnin;
    to     := evalNestedMultiplestop;
    guard  := true;
    action := F' = ?;
  };
}
strategy dumb {
  Region init := { state = evalNestedMultiplestart };
}
