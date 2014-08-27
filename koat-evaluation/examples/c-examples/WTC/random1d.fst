model main {
  var A, B, C;
  states evalrandom1dstart, evalrandom1dentryin, evalrandom1dbb5in, evalrandom1dreturnin, evalrandom1dbb1in, evalrandom1dstop;
  transition t0 := {
    from   := evalrandom1dstart;
    to     := evalrandom1dentryin;
    guard  := true;
    action := C' = ?;
  };
  transition t1 := {
    from   := evalrandom1dentryin;
    to     := evalrandom1dbb5in;
    guard  := A > 0;
    action := B' = 1, C' = ?;
  };
  transition t2 := {
    from   := evalrandom1dentryin;
    to     := evalrandom1dreturnin;
    guard  := 0 >= A;
    action := C' = ?;
  };
  transition t3 := {
    from   := evalrandom1dbb5in;
    to     := evalrandom1dbb1in;
    guard  := A >= B;
    action := C' = ?;
  };
  transition t4 := {
    from   := evalrandom1dbb5in;
    to     := evalrandom1dreturnin;
    guard  := B > A;
    action := C' = ?;
  };
  transition t5 := {
    from   := evalrandom1dbb1in;
    to     := evalrandom1dbb5in;
    guard  := 0 > C;
    action := B' = B + 1, C' = ?;
  };
  transition t6 := {
    from   := evalrandom1dbb1in;
    to     := evalrandom1dbb5in;
    guard  := C > 0;
    action := B' = B + 1, C' = ?;
  };
  transition t7 := {
    from   := evalrandom1dbb1in;
    to     := evalrandom1dbb5in;
    guard  := true;
    action := B' = B + 1, C' = ?;
  };
  transition t8 := {
    from   := evalrandom1dreturnin;
    to     := evalrandom1dstop;
    guard  := true;
    action := C' = ?;
  };
}
strategy dumb {
  Region init := { state = evalrandom1dstart };
}
