model main {
  var A, B, C, D, E, F, G, H, I;
  states evalNestedLoopstart, evalNestedLoopentryin, evalNestedLoopbb9in, evalNestedLoopreturnin, evalNestedLoopbb10in, evalNestedLoopbb6in, evalNestedLoopbb8in, evalNestedLoopbb7in, evalNestedLoopbb1in, evalNestedLoopbb3in, evalNestedLoopbb4in, evalNestedLoopbb2in, evalNestedLoopstop;
  transition t0 := {
    from   := evalNestedLoopstart;
    to     := evalNestedLoopentryin;
    guard  := true;
    action := I' = ?;
  };
  transition t1 := {
    from   := evalNestedLoopentryin;
    to     := evalNestedLoopbb9in;
    guard  := A >= 0 && B >= 0 && C >= 0;
    action := D' = 0, I' = ?;
  };
  transition t2 := {
    from   := evalNestedLoopbb9in;
    to     := evalNestedLoopreturnin;
    guard  := D >= A;
    action := I' = ?;
  };
  transition t3 := {
    from   := evalNestedLoopbb9in;
    to     := evalNestedLoopbb10in;
    guard  := A > D;
    action := I' = ?;
  };
  transition t4 := {
    from   := evalNestedLoopbb10in;
    to     := evalNestedLoopbb6in;
    guard  := 0 > I;
    action := E' = 0, F' = D, I' = ?;
  };
  transition t5 := {
    from   := evalNestedLoopbb10in;
    to     := evalNestedLoopbb6in;
    guard  := I > 0;
    action := E' = 0, F' = D, I' = ?;
  };
  transition t6 := {
    from   := evalNestedLoopbb10in;
    to     := evalNestedLoopreturnin;
    guard  := true;
    action := I' = ?;
  };
  transition t7 := {
    from   := evalNestedLoopbb6in;
    to     := evalNestedLoopbb8in;
    guard  := E >= B;
    action := I' = ?;
  };
  transition t8 := {
    from   := evalNestedLoopbb6in;
    to     := evalNestedLoopbb7in;
    guard  := B > E;
    action := I' = ?;
  };
  transition t9 := {
    from   := evalNestedLoopbb7in;
    to     := evalNestedLoopbb1in;
    guard  := 0 > I;
    action := I' = ?;
  };
  transition t10 := {
    from   := evalNestedLoopbb7in;
    to     := evalNestedLoopbb1in;
    guard  := I > 0;
    action := I' = ?;
  };
  transition t11 := {
    from   := evalNestedLoopbb7in;
    to     := evalNestedLoopbb8in;
    guard  := true;
    action := I' = ?;
  };
  transition t12 := {
    from   := evalNestedLoopbb1in;
    to     := evalNestedLoopbb3in;
    guard  := true;
    action := G' = E + 1, H' = F, I' = ?;
  };
  transition t13 := {
    from   := evalNestedLoopbb3in;
    to     := evalNestedLoopbb6in;
    guard  := H >= C;
    action := E' = G, F' = H, I' = ?;
  };
  transition t14 := {
    from   := evalNestedLoopbb3in;
    to     := evalNestedLoopbb4in;
    guard  := C > H;
    action := I' = ?;
  };
  transition t15 := {
    from   := evalNestedLoopbb4in;
    to     := evalNestedLoopbb2in;
    guard  := 0 > I;
    action := I' = ?;
  };
  transition t16 := {
    from   := evalNestedLoopbb4in;
    to     := evalNestedLoopbb2in;
    guard  := I > 0;
    action := I' = ?;
  };
  transition t17 := {
    from   := evalNestedLoopbb4in;
    to     := evalNestedLoopbb6in;
    guard  := true;
    action := E' = G, F' = H, I' = ?;
  };
  transition t18 := {
    from   := evalNestedLoopbb2in;
    to     := evalNestedLoopbb3in;
    guard  := true;
    action := H' = H + 1, I' = ?;
  };
  transition t19 := {
    from   := evalNestedLoopbb8in;
    to     := evalNestedLoopbb9in;
    guard  := true;
    action := D' = F + 1, I' = ?;
  };
  transition t20 := {
    from   := evalNestedLoopreturnin;
    to     := evalNestedLoopstop;
    guard  := true;
    action := I' = ?;
  };
}
strategy dumb {
  Region init := { state = evalNestedLoopstart };
}
