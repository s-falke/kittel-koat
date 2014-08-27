model main {
  var A, B, C;
  states f2, f3, f300;
  transition t0 := {
    from   := f2;
    to     := f2;
    guard  := 0 > A;
    action := A' = -2 + C, C' = ?;
  };
  transition t1 := {
    from   := f2;
    to     := f2;
    guard  := A > 0;
    action := A' = 2 + C, C' = ?;
  };
  transition t2 := {
    from   := f3;
    to     := f2;
    guard  := true;
    action := C' = ?;
  };
  transition t3 := {
    from   := f2;
    to     := f300;
    guard  := A = 0;
    action := B' = C, C' = ?;
  };
}
strategy dumb {
  Region init := { state = f3 };
}
