model main {
  var A;
  states evaleasy2start, evaleasy2entryin, evaleasy2bb1in, evaleasy2bbin, evaleasy2returnin, evaleasy2stop;
  transition t0 := {
    from   := evaleasy2start;
    to     := evaleasy2entryin;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := evaleasy2entryin;
    to     := evaleasy2bb1in;
    guard  := true;
    action := ;
  };
  transition t2 := {
    from   := evaleasy2bb1in;
    to     := evaleasy2bbin;
    guard  := A > 0;
    action := ;
  };
  transition t3 := {
    from   := evaleasy2bb1in;
    to     := evaleasy2returnin;
    guard  := 0 >= A;
    action := ;
  };
  transition t4 := {
    from   := evaleasy2bbin;
    to     := evaleasy2bb1in;
    guard  := true;
    action := A' = A - 1;
  };
  transition t5 := {
    from   := evaleasy2returnin;
    to     := evaleasy2stop;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = evaleasy2start };
}
