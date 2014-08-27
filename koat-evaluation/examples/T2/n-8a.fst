model main {
  var A, B, C, D, E, F, G;
  states f1, f2, f300;
  transition t0 := {
    from   := f1;
    to     := f2;
    guard  := true;
    action := A' = G, B' = G, G' = ?;
  };
  transition t1 := {
    from   := f2;
    to     := f2;
    guard  := D > C;
    action := E' = G, G' = ?;
  };
  transition t2 := {
    from   := f2;
    to     := f300;
    guard  := C >= D;
    action := F' = G, G' = ?;
  };
}
strategy dumb {
  Region init := { state = f1 };
}
