model main {
  var A, B, C;
  states evalaxstart, evalaxentryin, evalaxbbin, evalaxbb2in, evalaxbb1in, evalaxbb3in, evalaxreturnin, evalaxstop;
  transition t0 := {
    from   := evalaxstart;
    to     := evalaxentryin;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := evalaxentryin;
    to     := evalaxbbin;
    guard  := true;
    action := A' = 0;
  };
  transition t2 := {
    from   := evalaxbbin;
    to     := evalaxbb2in;
    guard  := true;
    action := B' = 0;
  };
  transition t3 := {
    from   := evalaxbb2in;
    to     := evalaxbb1in;
    guard  := C > 1 + B;
    action := ;
  };
  transition t4 := {
    from   := evalaxbb2in;
    to     := evalaxbb3in;
    guard  := B + 1 >= C;
    action := ;
  };
  transition t5 := {
    from   := evalaxbb1in;
    to     := evalaxbb2in;
    guard  := true;
    action := B' = B + 1;
  };
  transition t6 := {
    from   := evalaxbb3in;
    to     := evalaxbbin;
    guard  := B + 1 >= C && C > 2 + A;
    action := A' = A + 1;
  };
  transition t7 := {
    from   := evalaxbb3in;
    to     := evalaxreturnin;
    guard  := C > 1 + B;
    action := ;
  };
  transition t8 := {
    from   := evalaxbb3in;
    to     := evalaxreturnin;
    guard  := A + 2 >= C;
    action := ;
  };
  transition t9 := {
    from   := evalaxreturnin;
    to     := evalaxstop;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = evalaxstart };
}
