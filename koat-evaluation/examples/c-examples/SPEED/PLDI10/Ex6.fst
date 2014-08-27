model main {
  var A, B, C;
  states evalEx6start, evalEx6entryin, evalEx6bb3in, evalEx6bbin, evalEx6returnin, evalEx6bb1in, evalEx6bb2in, evalEx6stop;
  transition t0 := {
    from   := evalEx6start;
    to     := evalEx6entryin;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := evalEx6entryin;
    to     := evalEx6bb3in;
    guard  := true;
    action := A' = B, B' = A;
  };
  transition t2 := {
    from   := evalEx6bb3in;
    to     := evalEx6bbin;
    guard  := C > B;
    action := ;
  };
  transition t3 := {
    from   := evalEx6bb3in;
    to     := evalEx6returnin;
    guard  := B >= C;
    action := ;
  };
  transition t4 := {
    from   := evalEx6bbin;
    to     := evalEx6bb1in;
    guard  := A > B;
    action := ;
  };
  transition t5 := {
    from   := evalEx6bbin;
    to     := evalEx6bb2in;
    guard  := B >= A;
    action := ;
  };
  transition t6 := {
    from   := evalEx6bb1in;
    to     := evalEx6bb3in;
    guard  := true;
    action := B' = B + 1;
  };
  transition t7 := {
    from   := evalEx6bb2in;
    to     := evalEx6bb3in;
    guard  := true;
    action := A' = A + 1;
  };
  transition t8 := {
    from   := evalEx6returnin;
    to     := evalEx6stop;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = evalEx6start };
}
