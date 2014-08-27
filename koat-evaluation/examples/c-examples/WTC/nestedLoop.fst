model main {
  var A, B, C, D, E, F, G, H;
  states evalnestedLoopstart, evalnestedLoopentryin, evalnestedLoopbb9in, evalnestedLoopreturnin, evalnestedLoopbb7in, evalnestedLoopbb4in, evalnestedLoopbb8in, evalnestedLoopbb6in, evalnestedLoopbb5in, evalnestedLoopstop;
  transition t0 := {
    from   := evalnestedLoopstart;
    to     := evalnestedLoopentryin;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := evalnestedLoopentryin;
    to     := evalnestedLoopbb9in;
    guard  := A >= 0 && B >= 0 && C >= 0;
    action := D' = 0;
  };
  transition t2 := {
    from   := evalnestedLoopentryin;
    to     := evalnestedLoopreturnin;
    guard  := 0 > A;
    action := ;
  };
  transition t3 := {
    from   := evalnestedLoopentryin;
    to     := evalnestedLoopreturnin;
    guard  := 0 > B;
    action := ;
  };
  transition t4 := {
    from   := evalnestedLoopentryin;
    to     := evalnestedLoopreturnin;
    guard  := 0 > C;
    action := ;
  };
  transition t5 := {
    from   := evalnestedLoopbb9in;
    to     := evalnestedLoopbb7in;
    guard  := A > D;
    action := E' = 0, F' = D;
  };
  transition t6 := {
    from   := evalnestedLoopbb9in;
    to     := evalnestedLoopreturnin;
    guard  := D >= A;
    action := ;
  };
  transition t7 := {
    from   := evalnestedLoopbb7in;
    to     := evalnestedLoopbb4in;
    guard  := B > E;
    action := ;
  };
  transition t8 := {
    from   := evalnestedLoopbb7in;
    to     := evalnestedLoopbb8in;
    guard  := E >= B;
    action := ;
  };
  transition t9 := {
    from   := evalnestedLoopbb4in;
    to     := evalnestedLoopbb6in;
    guard  := true;
    action := G' = E + 1, H' = F;
  };
  transition t10 := {
    from   := evalnestedLoopbb6in;
    to     := evalnestedLoopbb5in;
    guard  := C > H;
    action := ;
  };
  transition t11 := {
    from   := evalnestedLoopbb6in;
    to     := evalnestedLoopbb7in;
    guard  := H >= C;
    action := E' = G, F' = H;
  };
  transition t12 := {
    from   := evalnestedLoopbb5in;
    to     := evalnestedLoopbb6in;
    guard  := true;
    action := H' = H + 1;
  };
  transition t13 := {
    from   := evalnestedLoopbb8in;
    to     := evalnestedLoopbb9in;
    guard  := true;
    action := D' = F + 1;
  };
  transition t14 := {
    from   := evalnestedLoopreturnin;
    to     := evalnestedLoopstop;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = evalnestedLoopstart };
}
