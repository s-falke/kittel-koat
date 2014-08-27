model main {
  var A, B, C;
  states eval, start;
  transition t0 := {
    from   := eval;
    to     := eval;
    guard  := A > B && C > B;
    action := B' = B + 1;
  };
  transition t1 := {
    from   := eval;
    to     := eval;
    guard  := A > B && B >= C;
    action := C' = C + 1;
  };
  transition t2 := {
    from   := start;
    to     := eval;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = start };
}
