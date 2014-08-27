model main {
  var A, B;
  states f0, f5, f13;
  transition t0 := {
    from   := f0;
    to     := f5;
    guard  := true;
    action := A' = 0, B' = ?;
  };
  transition t1 := {
    from   := f5;
    to     := f5;
    guard  := 1 >= A;
    action := A' = A + 1, B' = ?;
  };
  transition t2 := {
    from   := f5;
    to     := f13;
    guard  := A > 1 && 0 > B;
    action := B' = ?;
  };
  transition t3 := {
    from   := f5;
    to     := f13;
    guard  := A > 1;
    action := B' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
