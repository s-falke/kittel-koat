model main {
  var A, B, C, D, E, F, G, H, I;
  states f1, f300, f2;
  transition t0 := {
    from   := f1;
    to     := f1;
    guard  := A > B;
    action := C' = H, D' = I, H' = ?, I' = ?;
  };
  transition t1 := {
    from   := f1;
    to     := f300;
    guard  := B >= A;
    action := C' = H, E' = I, H' = ?, I' = ?;
  };
  transition t2 := {
    from   := f2;
    to     := f1;
    guard  := true;
    action := F' = H, G' = H, H' = ?, I' = ?;
  };
}
strategy dumb {
  Region init := { state = f2 };
}
