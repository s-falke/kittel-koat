model main {
  var A, B;
  states evaleasy1start, evaleasy1entryin, evaleasy1bb3in, evaleasy1bbin, evaleasy1returnin, evaleasy1bb1in, evaleasy1bb2in, evaleasy1stop;
  transition t0 := {
    from   := evaleasy1start;
    to     := evaleasy1entryin;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := evaleasy1entryin;
    to     := evaleasy1bb3in;
    guard  := true;
    action := A' = 0;
  };
  transition t2 := {
    from   := evaleasy1bb3in;
    to     := evaleasy1bbin;
    guard  := 39 >= A;
    action := ;
  };
  transition t3 := {
    from   := evaleasy1bb3in;
    to     := evaleasy1returnin;
    guard  := A > 39;
    action := ;
  };
  transition t4 := {
    from   := evaleasy1bbin;
    to     := evaleasy1bb1in;
    guard  := B = 0;
    action := ;
  };
  transition t5 := {
    from   := evaleasy1bbin;
    to     := evaleasy1bb2in;
    guard  := 0 > B;
    action := ;
  };
  transition t6 := {
    from   := evaleasy1bbin;
    to     := evaleasy1bb2in;
    guard  := B > 0;
    action := ;
  };
  transition t7 := {
    from   := evaleasy1bb1in;
    to     := evaleasy1bb3in;
    guard  := true;
    action := A' = A + 1;
  };
  transition t8 := {
    from   := evaleasy1bb2in;
    to     := evaleasy1bb3in;
    guard  := true;
    action := A' = A + 2;
  };
  transition t9 := {
    from   := evaleasy1returnin;
    to     := evaleasy1stop;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = evaleasy1start };
}
