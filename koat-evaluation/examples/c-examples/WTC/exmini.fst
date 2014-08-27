model main {
  var A, B, C;
  states evalexministart, evalexminientryin, evalexminibb1in, evalexminibbin, evalexminireturnin, evalexministop;
  transition t0 := {
    from   := evalexministart;
    to     := evalexminientryin;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := evalexminientryin;
    to     := evalexminibb1in;
    guard  := true;
    action := A' = B, B' = A;
  };
  transition t2 := {
    from   := evalexminibb1in;
    to     := evalexminibbin;
    guard  := 100 >= B && A >= C;
    action := ;
  };
  transition t3 := {
    from   := evalexminibb1in;
    to     := evalexminireturnin;
    guard  := B > 100;
    action := ;
  };
  transition t4 := {
    from   := evalexminibb1in;
    to     := evalexminireturnin;
    guard  := C > A;
    action := ;
  };
  transition t5 := {
    from   := evalexminibbin;
    to     := evalexminibb1in;
    guard  := true;
    action := A' = A - 1, C' = B + 1, B' = C;
  };
  transition t6 := {
    from   := evalexminireturnin;
    to     := evalexministop;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = evalexministart };
}
