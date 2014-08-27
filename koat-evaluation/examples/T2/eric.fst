model main {
  var A, B, C;
  states f1, f2, f3;
  transition t0 := {
    from   := f1;
    to     := f2;
    guard  := A >= B && A > 0 && B > 0;
    action := C' = B + 1;
  };
  transition t1 := {
    from   := f2;
    to     := f3;
    guard  := B > C;
    action := ;
  };
  transition t2 := {
    from   := f2;
    to     := f3;
    guard  := C > B;
    action := ;
  };
  transition t3 := {
    from   := f3;
    to     := f2;
    guard  := A + 1 >= 0 && C > 0 && C > A;
    action := C' = 0;
  };
  transition t4 := {
    from   := f3;
    to     := f2;
    guard  := A >= C && C + 1 >= 0;
    action := C' = C + 1;
  };
}
strategy dumb {
  Region init := { state = f1 };
}
