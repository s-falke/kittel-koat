model main {
  var A, B, C;
  states eval1, eval2, start;
  transition t0 := {
    from   := eval1;
    to     := eval2;
    guard  := A > B;
    action := ;
  };
  transition t1 := {
    from   := eval2;
    to     := eval1;
    guard  := A > C;
    action := B' = B + 1;
  };
  transition t2 := {
    from   := eval2;
    to     := eval1;
    guard  := A > C;
    action := C' = C + 1;
  };
  transition t3 := {
    from   := eval2;
    to     := eval1;
    guard  := C >= A;
    action := A' = A - 1;
  };
  transition t4 := {
    from   := start;
    to     := eval1;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = start };
}
