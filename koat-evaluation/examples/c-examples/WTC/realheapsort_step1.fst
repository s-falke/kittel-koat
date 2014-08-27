model main {
  var A, B, C, D, E, F;
  states evalrealheapsortstep1start, evalrealheapsortstep1entryin, evalrealheapsortstep1bb6in, evalrealheapsortstep1returnin, evalrealheapsortstep1bb3in, evalrealheapsortstep1bb5in, evalrealheapsortstep1bb4in, evalrealheapsortstep1bb2in, evalrealheapsortstep1stop;
  transition t0 := {
    from   := evalrealheapsortstep1start;
    to     := evalrealheapsortstep1entryin;
    guard  := true;
    action := D' = ?, E' = ?, F' = ?;
  };
  transition t1 := {
    from   := evalrealheapsortstep1entryin;
    to     := evalrealheapsortstep1bb6in;
    guard  := A > 2;
    action := B' = 1, D' = ?, E' = ?, F' = ?;
  };
  transition t2 := {
    from   := evalrealheapsortstep1entryin;
    to     := evalrealheapsortstep1returnin;
    guard  := 2 >= A;
    action := D' = ?, E' = ?, F' = ?;
  };
  transition t3 := {
    from   := evalrealheapsortstep1bb6in;
    to     := evalrealheapsortstep1bb3in;
    guard  := A > B;
    action := C' = B, D' = ?, E' = ?, F' = ?;
  };
  transition t4 := {
    from   := evalrealheapsortstep1bb6in;
    to     := evalrealheapsortstep1returnin;
    guard  := B >= A;
    action := D' = ?, E' = ?, F' = ?;
  };
  transition t5 := {
    from   := evalrealheapsortstep1bb3in;
    to     := evalrealheapsortstep1bb5in;
    guard  := 0 >= C;
    action := D' = ?, E' = ?, F' = ?;
  };
  transition t6 := {
    from   := evalrealheapsortstep1bb3in;
    to     := evalrealheapsortstep1bb4in;
    guard  := C > 0;
    action := D' = ?, E' = ?, F' = ?;
  };
  transition t7 := {
    from   := evalrealheapsortstep1bb4in;
    to     := evalrealheapsortstep1bb2in;
    guard  := C + 1 = 0;
    action := D' = ?, E' = ?, F' = ?;
  };
  transition t8 := {
    from   := evalrealheapsortstep1bb4in;
    to     := evalrealheapsortstep1bb2in;
    guard  := C >= 0 && D >= 0 && C + 1 >= 2*D && 2*D >= C;
    action := D' = ?, E' = ?, F' = ?;
  };
  transition t9 := {
    from   := evalrealheapsortstep1bb4in;
    to     := evalrealheapsortstep1bb2in;
    guard  := 0 > C + 1 && 0 >= D && 2*D > C && 2 + C >= 2*D;
    action := D' = ?, E' = ?, F' = ?;
  };
  transition t10 := {
    from   := evalrealheapsortstep1bb4in;
    to     := evalrealheapsortstep1bb5in;
    guard  := C + 1 = 0;
    action := D' = ?, E' = ?, F' = ?;
  };
  transition t11 := {
    from   := evalrealheapsortstep1bb4in;
    to     := evalrealheapsortstep1bb5in;
    guard  := C >= 0 && D >= 0 && C + 1 >= 2*D && 2*D >= C;
    action := D' = ?, E' = ?, F' = ?;
  };
  transition t12 := {
    from   := evalrealheapsortstep1bb4in;
    to     := evalrealheapsortstep1bb5in;
    guard  := 0 > C + 1 && 0 >= D && 2*D > C && 2 + C >= 2*D;
    action := D' = ?, E' = ?, F' = ?;
  };
  transition t13 := {
    from   := evalrealheapsortstep1bb2in;
    to     := evalrealheapsortstep1bb3in;
    guard  := C + 1 = 0;
    action := C' = -1, D' = ?, E' = ?, F' = ?;
  };
  transition t14 := {
    from   := evalrealheapsortstep1bb2in;
    to     := evalrealheapsortstep1bb3in;
    guard  := 0 > 0 && D >= 0 && 0 >= 2*D && 1 + 2*D >= 0 && C + 1 = 0;
    action := C' = D - 1, D' = ?, E' = ?, F' = ?;
  };
  transition t15 := {
    from   := evalrealheapsortstep1bb2in;
    to     := evalrealheapsortstep1bb3in;
    guard  := 0 > 0 && 0 >= D && C + 1 = 0 && 2*D > C && 2 + C >= 2*D;
    action := C' = D - 1, D' = ?, E' = ?, F' = ?;
  };
  transition t16 := {
    from   := evalrealheapsortstep1bb2in;
    to     := evalrealheapsortstep1bb3in;
    guard  := 0 > 0 && D >= 0 && 0 >= 2*D && 1 + 2*D >= 0 && C + 1 = 0;
    action := C' = -1, D' = ?, E' = ?, F' = ?;
  };
  transition t17 := {
    from   := evalrealheapsortstep1bb2in;
    to     := evalrealheapsortstep1bb3in;
    guard  := 0 > 0 && E >= 0 && 0 >= 2*E && 1 + 2*E >= 0 && D >= 0 && 0 >= 2*D && 1 + 2*D >= 0 && C + 1 = 0;
    action := C' = D - 1, D' = ?, E' = ?, F' = ?;
  };
  transition t18 := {
    from   := evalrealheapsortstep1bb2in;
    to     := evalrealheapsortstep1bb3in;
    guard  := 0 > 0 && E >= 0 && 0 >= 2*E && 1 + 2*E >= 0 && 0 >= D && C + 1 = 0 && 2*D > C && 2 + C >= 2*D;
    action := C' = D - 1, D' = ?, E' = ?, F' = ?;
  };
  transition t19 := {
    from   := evalrealheapsortstep1bb2in;
    to     := evalrealheapsortstep1bb3in;
    guard  := 0 > 0 && 0 >= D && C + 1 = 0 && 2*D > C && 2 + C >= 2*D;
    action := C' = -1, D' = ?, E' = ?, F' = ?;
  };
  transition t20 := {
    from   := evalrealheapsortstep1bb2in;
    to     := evalrealheapsortstep1bb3in;
    guard  := 0 > 0 && 0 >= E && D >= 0 && 0 >= 2*D && 1 + 2*D >= 0 && C + 1 = 0 && 2*E > C && 2 + C >= 2*E;
    action := C' = D - 1, D' = ?, E' = ?, F' = ?;
  };
  transition t21 := {
    from   := evalrealheapsortstep1bb2in;
    to     := evalrealheapsortstep1bb3in;
    guard  := 0 > 0 && 0 >= E && 0 >= D && C + 1 = 0 && 2*E > C && 2 + C >= 2*E && 2*D > C && 2 + C >= 2*D;
    action := C' = D - 1, D' = ?, E' = ?, F' = ?;
  };
  transition t22 := {
    from   := evalrealheapsortstep1bb2in;
    to     := evalrealheapsortstep1bb3in;
    guard  := 0 > 0 && D >= 0 && 0 >= 2*D && 1 + 2*D >= 0 && C + 1 = 0;
    action := C' = -1, D' = ?, E' = ?, F' = ?;
  };
  transition t23 := {
    from   := evalrealheapsortstep1bb2in;
    to     := evalrealheapsortstep1bb3in;
    guard  := 0 > 0 && E >= 0 && 0 >= 2*E && 1 + 2*E >= 0 && D >= 0 && 0 >= 2*D && 1 + 2*D >= 0 && C + 1 = 0;
    action := C' = D - 1, D' = ?, E' = ?, F' = ?;
  };
  transition t24 := {
    from   := evalrealheapsortstep1bb2in;
    to     := evalrealheapsortstep1bb3in;
    guard  := 0 > 0 && E >= 0 && 0 >= 2*E && 1 + 2*E >= 0 && 0 >= D && C + 1 = 0 && 2*D > C && 2 + C >= 2*D;
    action := C' = D - 1, D' = ?, E' = ?, F' = ?;
  };
  transition t25 := {
    from   := evalrealheapsortstep1bb2in;
    to     := evalrealheapsortstep1bb3in;
    guard  := 0 > 0 && D >= 0 && 0 >= 2*D && 1 + 2*D >= 0 && E >= 0 && 0 >= 2*E && 1 + 2*E >= 0 && C + 1 = 0;
    action := C' = -1, D' = ?, E' = ?, F' = ?;
  };
  transition t26 := {
    from   := evalrealheapsortstep1bb2in;
    to     := evalrealheapsortstep1bb3in;
    guard  := C >= 0 && E >= 0 && C + 1 >= 2*E && 2*E >= C && F >= 0 && C + 1 >= 2*F && 2*F >= C && D >= 0 && C + 1 >= 2*D && 2*D >= C;
    action := C' = D - 1, D' = ?, E' = ?, F' = ?;
  };
  transition t27 := {
    from   := evalrealheapsortstep1bb2in;
    to     := evalrealheapsortstep1bb3in;
    guard  := C >= 0 && E >= 0 && C + 1 >= 2*E && 2*E >= C && F >= 0 && C + 1 >= 2*F && 2*F >= C && 0 > C + 1 && 0 >= D && 2*D > C && 2 + C >= 2*D;
    action := C' = D - 1, D' = ?, E' = ?, F' = ?;
  };
  transition t28 := {
    from   := evalrealheapsortstep1bb2in;
    to     := evalrealheapsortstep1bb3in;
    guard  := 0 > 0 && D >= 0 && 0 >= 2*D && 1 + 2*D >= 0 && 0 >= E && C + 1 = 0 && 2*E > C && 2 + C >= 2*E;
    action := C' = -1, D' = ?, E' = ?, F' = ?;
  };
  transition t29 := {
    from   := evalrealheapsortstep1bb2in;
    to     := evalrealheapsortstep1bb3in;
    guard  := C >= 0 && E >= 0 && C + 1 >= 2*E && 2*E >= C && 0 > C + 1 && 0 >= F && D >= 0 && C + 1 >= 2*D && 2*D >= C && 2*F > C && 2 + C >= 2*F;
    action := C' = D - 1, D' = ?, E' = ?, F' = ?;
  };
  transition t30 := {
    from   := evalrealheapsortstep1bb2in;
    to     := evalrealheapsortstep1bb3in;
    guard  := C >= 0 && E >= 0 && C + 1 >= 2*E && 2*E >= C && 0 > C + 1 && 0 >= F && 0 >= D && 2*F > C && 2 + C >= 2*F && 2*D > C && 2 + C >= 2*D;
    action := C' = D - 1, D' = ?, E' = ?, F' = ?;
  };
  transition t31 := {
    from   := evalrealheapsortstep1bb2in;
    to     := evalrealheapsortstep1bb3in;
    guard  := 0 > 0 && 0 >= D && C + 1 = 0 && 2*D > C && 2 + C >= 2*D;
    action := C' = -1, D' = ?, E' = ?, F' = ?;
  };
  transition t32 := {
    from   := evalrealheapsortstep1bb2in;
    to     := evalrealheapsortstep1bb3in;
    guard  := 0 > 0 && 0 >= E && D >= 0 && 0 >= 2*D && 1 + 2*D >= 0 && C + 1 = 0 && 2*E > C && 2 + C >= 2*E;
    action := C' = D - 1, D' = ?, E' = ?, F' = ?;
  };
  transition t33 := {
    from   := evalrealheapsortstep1bb2in;
    to     := evalrealheapsortstep1bb3in;
    guard  := 0 > 0 && 0 >= E && 0 >= D && C + 1 = 0 && 2*E > C && 2 + C >= 2*E && 2*D > C && 2 + C >= 2*D;
    action := C' = D - 1, D' = ?, E' = ?, F' = ?;
  };
  transition t34 := {
    from   := evalrealheapsortstep1bb2in;
    to     := evalrealheapsortstep1bb3in;
    guard  := 0 > 0 && 0 >= D && E >= 0 && 0 >= 2*E && 1 + 2*E >= 0 && C + 1 = 0 && 2*D > C && 2 + C >= 2*D;
    action := C' = -1, D' = ?, E' = ?, F' = ?;
  };
  transition t35 := {
    from   := evalrealheapsortstep1bb2in;
    to     := evalrealheapsortstep1bb3in;
    guard  := 0 > C + 1 && 0 >= E && C >= 0 && F >= 0 && C + 1 >= 2*F && 2*F >= C && D >= 0 && C + 1 >= 2*D && 2*D >= C && 2*E > C && 2 + C >= 2*E;
    action := C' = D - 1, D' = ?, E' = ?, F' = ?;
  };
  transition t36 := {
    from   := evalrealheapsortstep1bb2in;
    to     := evalrealheapsortstep1bb3in;
    guard  := 0 > C + 1 && 0 >= E && C >= 0 && F >= 0 && C + 1 >= 2*F && 2*F >= C && 0 >= D && 2*E > C && 2 + C >= 2*E && 2*D > C && 2 + C >= 2*D;
    action := C' = D - 1, D' = ?, E' = ?, F' = ?;
  };
  transition t37 := {
    from   := evalrealheapsortstep1bb2in;
    to     := evalrealheapsortstep1bb3in;
    guard  := 0 > 0 && 0 >= D && 0 >= E && C + 1 = 0 && 2*D > C && 2 + C >= 2*D && 2*E > C && 2 + C >= 2*E;
    action := C' = -1, D' = ?, E' = ?, F' = ?;
  };
  transition t38 := {
    from   := evalrealheapsortstep1bb2in;
    to     := evalrealheapsortstep1bb3in;
    guard  := 0 > C + 1 && 0 >= E && 0 >= F && C >= 0 && D >= 0 && C + 1 >= 2*D && 2*D >= C && 2*E > C && 2 + C >= 2*E && 2*F > C && 2 + C >= 2*F;
    action := C' = D - 1, D' = ?, E' = ?, F' = ?;
  };
  transition t39 := {
    from   := evalrealheapsortstep1bb2in;
    to     := evalrealheapsortstep1bb3in;
    guard  := 0 > C + 1 && 0 >= E && 0 >= F && 0 >= D && 2*E > C && 2 + C >= 2*E && 2*F > C && 2 + C >= 2*F && 2*D > C && 2 + C >= 2*D;
    action := C' = D - 1, D' = ?, E' = ?, F' = ?;
  };
  transition t40 := {
    from   := evalrealheapsortstep1bb5in;
    to     := evalrealheapsortstep1bb6in;
    guard  := true;
    action := B' = B + 1, D' = ?, E' = ?, F' = ?;
  };
  transition t41 := {
    from   := evalrealheapsortstep1returnin;
    to     := evalrealheapsortstep1stop;
    guard  := true;
    action := D' = ?, E' = ?, F' = ?;
  };
}
strategy dumb {
  Region init := { state = evalrealheapsortstep1start };
}
