model main {
  var A, B;
  states f4, f5, f0, f11, f14;
  transition t0 := {
    from   := f4;
    to     := f5;
    guard  := 0 > B;
    action := B' = ?;
  };
  transition t1 := {
    from   := f4;
    to     := f5;
    guard  := true;
    action := B' = ?;
  };
  transition t2 := {
    from   := f0;
    to     := f4;
    guard  := true;
    action := A' = 0, B' = ?;
  };
  transition t3 := {
    from   := f5;
    to     := f11;
    guard  := A > 2;
    action := B' = ?;
  };
  transition t4 := {
    from   := f4;
    to     := f11;
    guard  := true;
    action := B' = ?;
  };
  transition t5 := {
    from   := f5;
    to     := f4;
    guard  := 2 >= A;
    action := A' = A + 1, B' = ?;
  };
  transition t6 := {
    from   := f11;
    to     := f14;
    guard  := 1 >= A;
    action := B' = ?;
  };
  transition t7 := {
    from   := f11;
    to     := f14;
    guard  := A > 1;
    action := B' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
