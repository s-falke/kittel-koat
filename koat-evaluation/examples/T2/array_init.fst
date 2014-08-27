model main {
  var A, B;
  states f0, f3, f11;
  transition t0 := {
    from   := f0;
    to     := f3;
    guard  := true;
    action := A' = 0, B' = ?;
  };
  transition t1 := {
    from   := f3;
    to     := f3;
    guard  := 9 >= A;
    action := A' = A + 1, B' = ?;
  };
  transition t2 := {
    from   := f3;
    to     := f11;
    guard  := A > 9 && 0 > B;
    action := B' = ?;
  };
  transition t3 := {
    from   := f3;
    to     := f11;
    guard  := A > 9;
    action := B' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
