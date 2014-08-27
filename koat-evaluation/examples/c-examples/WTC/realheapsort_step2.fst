model main {
  var A, B, C, D;
  states evalrealheapsortstep2start, evalrealheapsortstep2entryin, evalrealheapsortstep2bbin, evalrealheapsortstep2returnin, evalrealheapsortstep2bb11in, evalrealheapsortstep2bb1in, evalrealheapsortstep2bb9in, evalrealheapsortstep2bb2in, evalrealheapsortstep2bb10in, evalrealheapsortstep2bb4in, evalrealheapsortstep2bb3in, evalrealheapsortstep2bb5in, evalrealheapsortstep2bb6in, evalrealheapsortstep2bb7in, evalrealheapsortstep2stop;
  transition t0 := {
    from   := evalrealheapsortstep2start;
    to     := evalrealheapsortstep2entryin;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := evalrealheapsortstep2entryin;
    to     := evalrealheapsortstep2bbin;
    guard  := A > 2;
    action := ;
  };
  transition t2 := {
    from   := evalrealheapsortstep2entryin;
    to     := evalrealheapsortstep2returnin;
    guard  := 2 >= A;
    action := ;
  };
  transition t3 := {
    from   := evalrealheapsortstep2bbin;
    to     := evalrealheapsortstep2bb11in;
    guard  := true;
    action := B' = 0;
  };
  transition t4 := {
    from   := evalrealheapsortstep2bb11in;
    to     := evalrealheapsortstep2bb1in;
    guard  := A > 1 + B;
    action := ;
  };
  transition t5 := {
    from   := evalrealheapsortstep2bb11in;
    to     := evalrealheapsortstep2returnin;
    guard  := B + 1 >= A;
    action := ;
  };
  transition t6 := {
    from   := evalrealheapsortstep2bb1in;
    to     := evalrealheapsortstep2bb9in;
    guard  := true;
    action := C' = 0;
  };
  transition t7 := {
    from   := evalrealheapsortstep2bb9in;
    to     := evalrealheapsortstep2bb2in;
    guard  := A > B + 2 + 2*C;
    action := ;
  };
  transition t8 := {
    from   := evalrealheapsortstep2bb9in;
    to     := evalrealheapsortstep2bb10in;
    guard  := 2*C + 2 + B >= A;
    action := ;
  };
  transition t9 := {
    from   := evalrealheapsortstep2bb2in;
    to     := evalrealheapsortstep2bb4in;
    guard  := A = 2*C + 3 + B;
    action := ;
  };
  transition t10 := {
    from   := evalrealheapsortstep2bb2in;
    to     := evalrealheapsortstep2bb3in;
    guard  := A > B + 3 + 2*C;
    action := ;
  };
  transition t11 := {
    from   := evalrealheapsortstep2bb2in;
    to     := evalrealheapsortstep2bb3in;
    guard  := 2*C + 2 + B >= A;
    action := ;
  };
  transition t12 := {
    from   := evalrealheapsortstep2bb3in;
    to     := evalrealheapsortstep2bb4in;
    guard  := true;
    action := ;
  };
  transition t13 := {
    from   := evalrealheapsortstep2bb3in;
    to     := evalrealheapsortstep2bb5in;
    guard  := true;
    action := ;
  };
  transition t14 := {
    from   := evalrealheapsortstep2bb4in;
    to     := evalrealheapsortstep2bb6in;
    guard  := true;
    action := D' = 2*C + 1;
  };
  transition t15 := {
    from   := evalrealheapsortstep2bb5in;
    to     := evalrealheapsortstep2bb6in;
    guard  := true;
    action := D' = 2*C + 2;
  };
  transition t16 := {
    from   := evalrealheapsortstep2bb6in;
    to     := evalrealheapsortstep2bb7in;
    guard  := true;
    action := ;
  };
  transition t17 := {
    from   := evalrealheapsortstep2bb6in;
    to     := evalrealheapsortstep2bb9in;
    guard  := true;
    action := C' = A;
  };
  transition t18 := {
    from   := evalrealheapsortstep2bb7in;
    to     := evalrealheapsortstep2bb9in;
    guard  := true;
    action := C' = D;
  };
  transition t19 := {
    from   := evalrealheapsortstep2bb10in;
    to     := evalrealheapsortstep2bb11in;
    guard  := true;
    action := B' = B + 1;
  };
  transition t20 := {
    from   := evalrealheapsortstep2returnin;
    to     := evalrealheapsortstep2stop;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = evalrealheapsortstep2start };
}
