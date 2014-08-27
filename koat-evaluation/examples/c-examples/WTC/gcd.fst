model main {
  var A, B;
  states evalgcdstart, evalgcdentryin, evalgcdreturnin, evalgcdbb7in, evalgcdbb4in, evalgcdbb5in, evalgcdbb6in, evalgcdstop;
  transition t0 := {
    from   := evalgcdstart;
    to     := evalgcdentryin;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := evalgcdentryin;
    to     := evalgcdreturnin;
    guard  := 0 >= A;
    action := ;
  };
  transition t2 := {
    from   := evalgcdentryin;
    to     := evalgcdreturnin;
    guard  := 0 >= B;
    action := ;
  };
  transition t3 := {
    from   := evalgcdentryin;
    to     := evalgcdbb7in;
    guard  := A > 0 && B > 0;
    action := A' = B, B' = A;
  };
  transition t4 := {
    from   := evalgcdbb7in;
    to     := evalgcdbb4in;
    guard  := A > B;
    action := ;
  };
  transition t5 := {
    from   := evalgcdbb7in;
    to     := evalgcdbb4in;
    guard  := B > A;
    action := ;
  };
  transition t6 := {
    from   := evalgcdbb7in;
    to     := evalgcdreturnin;
    guard  := B = A;
    action := ;
  };
  transition t7 := {
    from   := evalgcdbb4in;
    to     := evalgcdbb5in;
    guard  := A > B;
    action := ;
  };
  transition t8 := {
    from   := evalgcdbb4in;
    to     := evalgcdbb6in;
    guard  := B >= A;
    action := ;
  };
  transition t9 := {
    from   := evalgcdbb5in;
    to     := evalgcdbb7in;
    guard  := true;
    action := A' = A - B;
  };
  transition t10 := {
    from   := evalgcdbb6in;
    to     := evalgcdbb7in;
    guard  := true;
    action := B' = B - A;
  };
  transition t11 := {
    from   := evalgcdreturnin;
    to     := evalgcdstop;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = evalgcdstart };
}
