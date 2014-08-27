model main {
  var A, B, C;
  states f0, f8, f6;
  transition t0 := {
    from   := f0;
    to     := f8;
    guard  := true;
    action := A' = 0, B' = 10, C' = 0;
  };
  transition t1 := {
    from   := f8;
    to     := f8;
    guard  := B > C;
    action := A' = A + 2, C' = C + 1;
  };
  transition t2 := {
    from   := f8;
    to     := f6;
    guard  := 2*B > A && C >= B;
    action := ;
  };
  transition t3 := {
    from   := f8;
    to     := f6;
    guard  := A >= 2*B && C >= B;
    action := ;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
