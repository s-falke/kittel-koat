model main {
  var A, B, C, D, E;
  states f0, f8, f23;
  transition t0 := {
    from   := f0;
    to     := f8;
    guard  := true;
    action := A' = 0, E' = ?;
  };
  transition t1 := {
    from   := f8;
    to     := f8;
    guard  := 3 >= A;
    action := A' = A + 1, E' = ?;
  };
  transition t2 := {
    from   := f8;
    to     := f8;
    guard  := 3 >= A;
    action := A' = A + 1, B' = A, C' = A + 1, D' = E, E' = ?;
  };
  transition t3 := {
    from   := f8;
    to     := f23;
    guard  := A > 3 && 0 > E;
    action := E' = ?;
  };
  transition t4 := {
    from   := f8;
    to     := f23;
    guard  := A > 3;
    action := E' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
