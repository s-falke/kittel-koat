model main {
  var A, B, C, D, E;
  states evalEx2start, evalEx2entryin, evalEx2bb3in, evalEx2bbin, evalEx2returnin, evalEx2bb2in, evalEx2bb1in, evalEx2stop;
  transition t0 := {
    from   := evalEx2start;
    to     := evalEx2entryin;
    guard  := true;
    action := E' = ?;
  };
  transition t1 := {
    from   := evalEx2entryin;
    to     := evalEx2bb3in;
    guard  := true;
    action := A' = B, B' = A, E' = ?;
  };
  transition t2 := {
    from   := evalEx2bb3in;
    to     := evalEx2bbin;
    guard  := B > 0 && A > 0;
    action := E' = ?;
  };
  transition t3 := {
    from   := evalEx2bb3in;
    to     := evalEx2returnin;
    guard  := 0 >= B;
    action := E' = ?;
  };
  transition t4 := {
    from   := evalEx2bb3in;
    to     := evalEx2returnin;
    guard  := 0 >= A;
    action := E' = ?;
  };
  transition t5 := {
    from   := evalEx2bbin;
    to     := evalEx2bb2in;
    guard  := true;
    action := C' = A - 1, D' = B - 1, E' = ?;
  };
  transition t6 := {
    from   := evalEx2bb2in;
    to     := evalEx2bb1in;
    guard  := 0 > E;
    action := E' = ?;
  };
  transition t7 := {
    from   := evalEx2bb2in;
    to     := evalEx2bb1in;
    guard  := E > 0;
    action := E' = ?;
  };
  transition t8 := {
    from   := evalEx2bb2in;
    to     := evalEx2bb3in;
    guard  := true;
    action := A' = C, B' = D, E' = ?;
  };
  transition t9 := {
    from   := evalEx2bb1in;
    to     := evalEx2bb2in;
    guard  := true;
    action := C' = C + 1, D' = D - 1, E' = ?;
  };
  transition t10 := {
    from   := evalEx2returnin;
    to     := evalEx2stop;
    guard  := true;
    action := E' = ?;
  };
}
strategy dumb {
  Region init := { state = evalEx2start };
}
