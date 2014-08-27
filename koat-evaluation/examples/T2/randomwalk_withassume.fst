model main {
  var A, B, C, D, E, F, G, H, I;
  states f0, f10, f21, f32;
  transition t0 := {
    from   := f0;
    to     := f10;
    guard  := H >= 0;
    action := A' = 1, B' = 1, C' = H, D' = 0, E' = 2, F' = 1, H' = ?, I' = ?;
  };
  transition t1 := {
    from   := f10;
    to     := f21;
    guard  := F > 0 && E >= F && B > 0 && 0 >= C;
    action := B' = B - 1, G' = 0, H' = ?, I' = ?;
  };
  transition t2 := {
    from   := f10;
    to     := f21;
    guard  := I >= 0 && 1 >= I && H >= 0 && F > 0 && E >= F && 0 >= B && 0 >= C;
    action := A' = A + 1, B' = A + 1, C' = H, G' = I, H' = ?, I' = ?;
  };
  transition t3 := {
    from   := f10;
    to     := f21;
    guard  := H >= 0 && 1 >= H && F > 0 && C > 0 && E >= F;
    action := C' = C - 1, G' = H, H' = ?, I' = ?;
  };
  transition t4 := {
    from   := f21;
    to     := f10;
    guard  := E + 1 >= A && 0 >= G;
    action := F' = F - 1, H' = ?, I' = ?;
  };
  transition t5 := {
    from   := f21;
    to     := f10;
    guard  := E + 1 >= A && G > 0;
    action := F' = F + 1, H' = ?, I' = ?;
  };
  transition t6 := {
    from   := f10;
    to     := f32;
    guard  := 0 >= F && E >= F;
    action := H' = ?, I' = ?;
  };
  transition t7 := {
    from   := f10;
    to     := f32;
    guard  := F > E;
    action := H' = ?, I' = ?;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
