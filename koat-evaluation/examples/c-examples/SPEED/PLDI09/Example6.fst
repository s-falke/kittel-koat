model main {
  var A, B, C, D, E, F, G, H;
  states evalfstart, evalfentryin, evalfbb5in, evalfreturnin, evalfbbin, evalfbb1in, evalfbb3in, evalfstop;
  transition t0 := {
    from   := evalfstart;
    to     := evalfentryin;
    guard  := true;
    action := H' = ?;
  };
  transition t1 := {
    from   := evalfentryin;
    to     := evalfbb5in;
    guard  := true;
    action := A' = 0, B' = 0, C' = 0, H' = ?;
  };
  transition t2 := {
    from   := evalfbb5in;
    to     := evalfreturnin;
    guard  := C >= D;
    action := H' = ?;
  };
  transition t3 := {
    from   := evalfbb5in;
    to     := evalfbbin;
    guard  := D > C;
    action := E' = C + 1, H' = ?;
  };
  transition t4 := {
    from   := evalfbbin;
    to     := evalfbb1in;
    guard  := 0 > H;
    action := F' = B, H' = ?;
  };
  transition t5 := {
    from   := evalfbbin;
    to     := evalfbb1in;
    guard  := H > 0;
    action := F' = B, H' = ?;
  };
  transition t6 := {
    from   := evalfbbin;
    to     := evalfbb3in;
    guard  := true;
    action := F' = A, H' = ?;
  };
  transition t7 := {
    from   := evalfbb1in;
    to     := evalfbb5in;
    guard  := F >= G;
    action := B' = F + 1, C' = E, H' = ?;
  };
  transition t8 := {
    from   := evalfbb1in;
    to     := evalfbb1in;
    guard  := G > F;
    action := F' = F + 1, H' = ?;
  };
  transition t9 := {
    from   := evalfbb3in;
    to     := evalfbb5in;
    guard  := F >= G;
    action := A' = F + 1, C' = E, H' = ?;
  };
  transition t10 := {
    from   := evalfbb3in;
    to     := evalfbb3in;
    guard  := G > F;
    action := F' = F + 1, H' = ?;
  };
  transition t11 := {
    from   := evalfreturnin;
    to     := evalfstop;
    guard  := true;
    action := H' = ?;
  };
}
strategy dumb {
  Region init := { state = evalfstart };
}
