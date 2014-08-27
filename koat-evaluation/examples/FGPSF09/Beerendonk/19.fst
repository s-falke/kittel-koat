model main {
  var A, B, C;
  states eval, start;
  transition t0 := {
    from   := eval;
    to     := eval;
    guard  := A > B;
    action := A' = A - 1;
  };
  transition t1 := {
    from   := eval;
    to     := eval;
    guard  := C > B && A > B;
    action := A' = A - 1;
  };
  transition t2 := {
    from   := eval;
    to     := eval;
    guard  := A > B && B >= A && C > B;
    action := C' = C - 1;
  };
  transition t3 := {
    from   := eval;
    to     := eval;
    guard  := C > B && B >= A;
    action := C' = C - 1;
  };
  transition t4 := {
    from   := eval;
    to     := eval;
    guard  := A > B && B >= A && B >= C;
    action := ;
  };
  transition t5 := {
    from   := eval;
    to     := eval;
    guard  := C > B && B >= A && B >= C;
    action := ;
  };
  transition t6 := {
    from   := start;
    to     := eval;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = start };
}
