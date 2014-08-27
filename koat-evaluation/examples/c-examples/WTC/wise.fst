model main {
  var A, B;
  states evalwisestart, evalwiseentryin, evalwisereturnin, evalwisebb6in, evalwisebb3in, evalwisebb4in, evalwisebb5in, evalwisestop;
  transition t0 := {
    from   := evalwisestart;
    to     := evalwiseentryin;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := evalwiseentryin;
    to     := evalwisereturnin;
    guard  := 0 > A;
    action := ;
  };
  transition t2 := {
    from   := evalwiseentryin;
    to     := evalwisereturnin;
    guard  := 0 > B;
    action := ;
  };
  transition t3 := {
    from   := evalwiseentryin;
    to     := evalwisebb6in;
    guard  := A >= 0 && B >= 0;
    action := A' = B, B' = A;
  };
  transition t4 := {
    from   := evalwisebb6in;
    to     := evalwisebb3in;
    guard  := B > A + 2;
    action := ;
  };
  transition t5 := {
    from   := evalwisebb6in;
    to     := evalwisebb3in;
    guard  := A > B + 2;
    action := ;
  };
  transition t6 := {
    from   := evalwisebb6in;
    to     := evalwisereturnin;
    guard  := 2 + A >= B && 2 + B >= A;
    action := ;
  };
  transition t7 := {
    from   := evalwisebb3in;
    to     := evalwisebb4in;
    guard  := A > B;
    action := ;
  };
  transition t8 := {
    from   := evalwisebb3in;
    to     := evalwisebb5in;
    guard  := B >= A;
    action := ;
  };
  transition t9 := {
    from   := evalwisebb4in;
    to     := evalwisebb6in;
    guard  := true;
    action := B' = B + 1;
  };
  transition t10 := {
    from   := evalwisebb5in;
    to     := evalwisebb6in;
    guard  := true;
    action := A' = A + 1;
  };
  transition t11 := {
    from   := evalwisereturnin;
    to     := evalwisestop;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = evalwisestart };
}
