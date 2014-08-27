model main {
  var A, B;
  states f0, f4, f12;
  transition t0 := {
    from   := f0;
    to     := f4;
    guard  := true;
    action := A' = B, B' = ?;
  };
  transition t1 := {
    from   := f4;
    to     := f4;
    guard  := 3 >= A && A > 0;
    action := A' = A + 1, B' = ?;
  };
  transition t2 := {
    from   := f4;
    to     := f4;
    guard  := 0 >= A && 3 >= A;
    action := A' = 1, B' = ?;
  };
  transition t3 := {
    from   := f4;
    to     := f12;
    guard  := A > 3;
    action := B' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
