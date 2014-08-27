model main {
  var A, B;
  states f0, f8;
  transition t0 := {
    from   := f0;
    to     := f8;
    guard  := 0 > B;
    action := B' = ?;
  };
  transition t1 := {
    from   := f0;
    to     := f8;
    guard  := true;
    action := B' = ?;
  };
  transition t2 := {
    from   := f0;
    to     := f8;
    guard  := true;
    action := A' = B, B' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
