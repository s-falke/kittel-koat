model main {
  var A, B, C;
  states eval0, eval1;
  transition t0 := {
    from   := eval0;
    to     := eval1;
    guard  := A > 0;
    action := ;
  };
  transition t1 := {
    from   := eval1;
    to     := eval1;
    guard  := A > B && C > A && A > 0;
    action := B' = B + A;
  };
  transition t2 := {
    from   := eval1;
    to     := eval1;
    guard  := A > B && C > A && A > 0;
    action := C' = B - A;
  };
}
strategy dumb {
  Region init := { state = eval0 };
}
