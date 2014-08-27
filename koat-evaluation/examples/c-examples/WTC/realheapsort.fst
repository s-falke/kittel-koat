model main {
  var A, B, C, D, E, F, G;
  states evalrealheapsortstart, evalrealheapsortentryin, evalrealheapsortbb6in, evalrealheapsortreturnin, evalrealheapsortbb3in, evalrealheapsortbb7in, evalrealheapsortbb5in, evalrealheapsortbb4in, evalrealheapsortbb2in, evalrealheapsortbb18in, evalrealheapsortbb8in, evalrealheapsortbb16in, evalrealheapsortbb9in, evalrealheapsortbb17in, evalrealheapsortbb11in, evalrealheapsortbb10in, evalrealheapsortbb12in, evalrealheapsortbb13in, evalrealheapsortbb14in, evalrealheapsortstop;
  transition t0 := {
    from   := evalrealheapsortstart;
    to     := evalrealheapsortentryin;
    guard  := true;
    action := E' = ?, F' = ?, G' = ?;
  };
  transition t1 := {
    from   := evalrealheapsortentryin;
    to     := evalrealheapsortbb6in;
    guard  := A > 2;
    action := B' = 1, E' = ?, F' = ?, G' = ?;
  };
  transition t2 := {
    from   := evalrealheapsortentryin;
    to     := evalrealheapsortreturnin;
    guard  := 2 >= A;
    action := E' = ?, F' = ?, G' = ?;
  };
  transition t3 := {
    from   := evalrealheapsortbb6in;
    to     := evalrealheapsortbb3in;
    guard  := A > B;
    action := C' = B, E' = ?, F' = ?, G' = ?;
  };
  transition t4 := {
    from   := evalrealheapsortbb6in;
    to     := evalrealheapsortbb7in;
    guard  := B >= A;
    action := E' = ?, F' = ?, G' = ?;
  };
  transition t5 := {
    from   := evalrealheapsortbb3in;
    to     := evalrealheapsortbb5in;
    guard  := 0 >= C;
    action := E' = ?, F' = ?, G' = ?;
  };
  transition t6 := {
    from   := evalrealheapsortbb3in;
    to     := evalrealheapsortbb4in;
    guard  := C > 0;
    action := E' = ?, F' = ?, G' = ?;
  };
  transition t7 := {
    from   := evalrealheapsortbb4in;
    to     := evalrealheapsortbb2in;
    guard  := C + 1 = 0;
    action := E' = ?, F' = ?, G' = ?;
  };
  transition t8 := {
    from   := evalrealheapsortbb4in;
    to     := evalrealheapsortbb2in;
    guard  := C >= 0 && E >= 0 && C + 1 >= 2*E && 2*E >= C;
    action := E' = ?, F' = ?, G' = ?;
  };
  transition t9 := {
    from   := evalrealheapsortbb4in;
    to     := evalrealheapsortbb2in;
    guard  := 0 > C + 1 && 0 >= E && 2*E > C && 2 + C >= 2*E;
    action := E' = ?, F' = ?, G' = ?;
  };
  transition t10 := {
    from   := evalrealheapsortbb4in;
    to     := evalrealheapsortbb5in;
    guard  := C + 1 = 0;
    action := E' = ?, F' = ?, G' = ?;
  };
  transition t11 := {
    from   := evalrealheapsortbb4in;
    to     := evalrealheapsortbb5in;
    guard  := C >= 0 && E >= 0 && C + 1 >= 2*E && 2*E >= C;
    action := E' = ?, F' = ?, G' = ?;
  };
  transition t12 := {
    from   := evalrealheapsortbb4in;
    to     := evalrealheapsortbb5in;
    guard  := 0 > C + 1 && 0 >= E && 2*E > C && 2 + C >= 2*E;
    action := E' = ?, F' = ?, G' = ?;
  };
  transition t13 := {
    from   := evalrealheapsortbb2in;
    to     := evalrealheapsortbb3in;
    guard  := C + 1 = 0;
    action := C' = -1, E' = ?, F' = ?, G' = ?;
  };
  transition t14 := {
    from   := evalrealheapsortbb2in;
    to     := evalrealheapsortbb3in;
    guard  := 0 > 0 && E >= 0 && 0 >= 2*E && 1 + 2*E >= 0 && C + 1 = 0;
    action := C' = E - 1, E' = ?, F' = ?, G' = ?;
  };
  transition t15 := {
    from   := evalrealheapsortbb2in;
    to     := evalrealheapsortbb3in;
    guard  := 0 > 0 && 0 >= E && C + 1 = 0 && 2*E > C && 2 + C >= 2*E;
    action := C' = E - 1, E' = ?, F' = ?, G' = ?;
  };
  transition t16 := {
    from   := evalrealheapsortbb2in;
    to     := evalrealheapsortbb3in;
    guard  := 0 > 0 && E >= 0 && 0 >= 2*E && 1 + 2*E >= 0 && C + 1 = 0;
    action := C' = -1, E' = ?, F' = ?, G' = ?;
  };
  transition t17 := {
    from   := evalrealheapsortbb2in;
    to     := evalrealheapsortbb3in;
    guard  := 0 > 0 && F >= 0 && 0 >= 2*F && 1 + 2*F >= 0 && E >= 0 && 0 >= 2*E && 1 + 2*E >= 0 && C + 1 = 0;
    action := C' = E - 1, E' = ?, F' = ?, G' = ?;
  };
  transition t18 := {
    from   := evalrealheapsortbb2in;
    to     := evalrealheapsortbb3in;
    guard  := 0 > 0 && F >= 0 && 0 >= 2*F && 1 + 2*F >= 0 && 0 >= E && C + 1 = 0 && 2*E > C && 2 + C >= 2*E;
    action := C' = E - 1, E' = ?, F' = ?, G' = ?;
  };
  transition t19 := {
    from   := evalrealheapsortbb2in;
    to     := evalrealheapsortbb3in;
    guard  := 0 > 0 && 0 >= E && C + 1 = 0 && 2*E > C && 2 + C >= 2*E;
    action := C' = -1, E' = ?, F' = ?, G' = ?;
  };
  transition t20 := {
    from   := evalrealheapsortbb2in;
    to     := evalrealheapsortbb3in;
    guard  := 0 > 0 && 0 >= F && E >= 0 && 0 >= 2*E && 1 + 2*E >= 0 && C + 1 = 0 && 2*F > C && 2 + C >= 2*F;
    action := C' = E - 1, E' = ?, F' = ?, G' = ?;
  };
  transition t21 := {
    from   := evalrealheapsortbb2in;
    to     := evalrealheapsortbb3in;
    guard  := 0 > 0 && 0 >= F && 0 >= E && C + 1 = 0 && 2*F > C && 2 + C >= 2*F && 2*E > C && 2 + C >= 2*E;
    action := C' = E - 1, E' = ?, F' = ?, G' = ?;
  };
  transition t22 := {
    from   := evalrealheapsortbb2in;
    to     := evalrealheapsortbb3in;
    guard  := 0 > 0 && E >= 0 && 0 >= 2*E && 1 + 2*E >= 0 && C + 1 = 0;
    action := C' = -1, E' = ?, F' = ?, G' = ?;
  };
  transition t23 := {
    from   := evalrealheapsortbb2in;
    to     := evalrealheapsortbb3in;
    guard  := 0 > 0 && F >= 0 && 0 >= 2*F && 1 + 2*F >= 0 && E >= 0 && 0 >= 2*E && 1 + 2*E >= 0 && C + 1 = 0;
    action := C' = E - 1, E' = ?, F' = ?, G' = ?;
  };
  transition t24 := {
    from   := evalrealheapsortbb2in;
    to     := evalrealheapsortbb3in;
    guard  := 0 > 0 && F >= 0 && 0 >= 2*F && 1 + 2*F >= 0 && 0 >= E && C + 1 = 0 && 2*E > C && 2 + C >= 2*E;
    action := C' = E - 1, E' = ?, F' = ?, G' = ?;
  };
  transition t25 := {
    from   := evalrealheapsortbb2in;
    to     := evalrealheapsortbb3in;
    guard  := 0 > 0 && E >= 0 && 0 >= 2*E && 1 + 2*E >= 0 && F >= 0 && 0 >= 2*F && 1 + 2*F >= 0 && C + 1 = 0;
    action := C' = -1, E' = ?, F' = ?, G' = ?;
  };
  transition t26 := {
    from   := evalrealheapsortbb2in;
    to     := evalrealheapsortbb3in;
    guard  := C >= 0 && F >= 0 && C + 1 >= 2*F && 2*F >= C && G >= 0 && C + 1 >= 2*G && 2*G >= C && E >= 0 && C + 1 >= 2*E && 2*E >= C;
    action := C' = E - 1, E' = ?, F' = ?, G' = ?;
  };
  transition t27 := {
    from   := evalrealheapsortbb2in;
    to     := evalrealheapsortbb3in;
    guard  := C >= 0 && F >= 0 && C + 1 >= 2*F && 2*F >= C && G >= 0 && C + 1 >= 2*G && 2*G >= C && 0 > C + 1 && 0 >= E && 2*E > C && 2 + C >= 2*E;
    action := C' = E - 1, E' = ?, F' = ?, G' = ?;
  };
  transition t28 := {
    from   := evalrealheapsortbb2in;
    to     := evalrealheapsortbb3in;
    guard  := 0 > 0 && E >= 0 && 0 >= 2*E && 1 + 2*E >= 0 && 0 >= F && C + 1 = 0 && 2*F > C && 2 + C >= 2*F;
    action := C' = -1, E' = ?, F' = ?, G' = ?;
  };
  transition t29 := {
    from   := evalrealheapsortbb2in;
    to     := evalrealheapsortbb3in;
    guard  := C >= 0 && F >= 0 && C + 1 >= 2*F && 2*F >= C && 0 > C + 1 && 0 >= G && E >= 0 && C + 1 >= 2*E && 2*E >= C && 2*G > C && 2 + C >= 2*G;
    action := C' = E - 1, E' = ?, F' = ?, G' = ?;
  };
  transition t30 := {
    from   := evalrealheapsortbb2in;
    to     := evalrealheapsortbb3in;
    guard  := C >= 0 && F >= 0 && C + 1 >= 2*F && 2*F >= C && 0 > C + 1 && 0 >= G && 0 >= E && 2*G > C && 2 + C >= 2*G && 2*E > C && 2 + C >= 2*E;
    action := C' = E - 1, E' = ?, F' = ?, G' = ?;
  };
  transition t31 := {
    from   := evalrealheapsortbb2in;
    to     := evalrealheapsortbb3in;
    guard  := 0 > 0 && 0 >= E && C + 1 = 0 && 2*E > C && 2 + C >= 2*E;
    action := C' = -1, E' = ?, F' = ?, G' = ?;
  };
  transition t32 := {
    from   := evalrealheapsortbb2in;
    to     := evalrealheapsortbb3in;
    guard  := 0 > 0 && 0 >= F && E >= 0 && 0 >= 2*E && 1 + 2*E >= 0 && C + 1 = 0 && 2*F > C && 2 + C >= 2*F;
    action := C' = E - 1, E' = ?, F' = ?, G' = ?;
  };
  transition t33 := {
    from   := evalrealheapsortbb2in;
    to     := evalrealheapsortbb3in;
    guard  := 0 > 0 && 0 >= F && 0 >= E && C + 1 = 0 && 2*F > C && 2 + C >= 2*F && 2*E > C && 2 + C >= 2*E;
    action := C' = E - 1, E' = ?, F' = ?, G' = ?;
  };
  transition t34 := {
    from   := evalrealheapsortbb2in;
    to     := evalrealheapsortbb3in;
    guard  := 0 > 0 && 0 >= E && F >= 0 && 0 >= 2*F && 1 + 2*F >= 0 && C + 1 = 0 && 2*E > C && 2 + C >= 2*E;
    action := C' = -1, E' = ?, F' = ?, G' = ?;
  };
  transition t35 := {
    from   := evalrealheapsortbb2in;
    to     := evalrealheapsortbb3in;
    guard  := 0 > C + 1 && 0 >= F && C >= 0 && G >= 0 && C + 1 >= 2*G && 2*G >= C && E >= 0 && C + 1 >= 2*E && 2*E >= C && 2*F > C && 2 + C >= 2*F;
    action := C' = E - 1, E' = ?, F' = ?, G' = ?;
  };
  transition t36 := {
    from   := evalrealheapsortbb2in;
    to     := evalrealheapsortbb3in;
    guard  := 0 > C + 1 && 0 >= F && C >= 0 && G >= 0 && C + 1 >= 2*G && 2*G >= C && 0 >= E && 2*F > C && 2 + C >= 2*F && 2*E > C && 2 + C >= 2*E;
    action := C' = E - 1, E' = ?, F' = ?, G' = ?;
  };
  transition t37 := {
    from   := evalrealheapsortbb2in;
    to     := evalrealheapsortbb3in;
    guard  := 0 > 0 && 0 >= E && 0 >= F && C + 1 = 0 && 2*E > C && 2 + C >= 2*E && 2*F > C && 2 + C >= 2*F;
    action := C' = -1, E' = ?, F' = ?, G' = ?;
  };
  transition t38 := {
    from   := evalrealheapsortbb2in;
    to     := evalrealheapsortbb3in;
    guard  := 0 > C + 1 && 0 >= F && 0 >= G && C >= 0 && E >= 0 && C + 1 >= 2*E && 2*E >= C && 2*F > C && 2 + C >= 2*F && 2*G > C && 2 + C >= 2*G;
    action := C' = E - 1, E' = ?, F' = ?, G' = ?;
  };
  transition t39 := {
    from   := evalrealheapsortbb2in;
    to     := evalrealheapsortbb3in;
    guard  := 0 > C + 1 && 0 >= F && 0 >= G && 0 >= E && 2*F > C && 2 + C >= 2*F && 2*G > C && 2 + C >= 2*G && 2*E > C && 2 + C >= 2*E;
    action := C' = E - 1, E' = ?, F' = ?, G' = ?;
  };
  transition t40 := {
    from   := evalrealheapsortbb5in;
    to     := evalrealheapsortbb6in;
    guard  := true;
    action := B' = B + 1, E' = ?, F' = ?, G' = ?;
  };
  transition t41 := {
    from   := evalrealheapsortbb7in;
    to     := evalrealheapsortbb18in;
    guard  := true;
    action := B' = 0, E' = ?, F' = ?, G' = ?;
  };
  transition t42 := {
    from   := evalrealheapsortbb18in;
    to     := evalrealheapsortbb8in;
    guard  := A > 1 + B;
    action := E' = ?, F' = ?, G' = ?;
  };
  transition t43 := {
    from   := evalrealheapsortbb18in;
    to     := evalrealheapsortreturnin;
    guard  := B + 1 >= A;
    action := E' = ?, F' = ?, G' = ?;
  };
  transition t44 := {
    from   := evalrealheapsortbb8in;
    to     := evalrealheapsortbb16in;
    guard  := true;
    action := C' = 0, E' = ?, F' = ?, G' = ?;
  };
  transition t45 := {
    from   := evalrealheapsortbb16in;
    to     := evalrealheapsortbb9in;
    guard  := A > B + 2 + 2*C;
    action := E' = ?, F' = ?, G' = ?;
  };
  transition t46 := {
    from   := evalrealheapsortbb16in;
    to     := evalrealheapsortbb17in;
    guard  := 2*C + 2 + B >= A;
    action := E' = ?, F' = ?, G' = ?;
  };
  transition t47 := {
    from   := evalrealheapsortbb9in;
    to     := evalrealheapsortbb11in;
    guard  := A = 2*C + 3 + B;
    action := E' = ?, F' = ?, G' = ?;
  };
  transition t48 := {
    from   := evalrealheapsortbb9in;
    to     := evalrealheapsortbb10in;
    guard  := A > B + 3 + 2*C;
    action := E' = ?, F' = ?, G' = ?;
  };
  transition t49 := {
    from   := evalrealheapsortbb9in;
    to     := evalrealheapsortbb10in;
    guard  := 2*C + 2 + B >= A;
    action := E' = ?, F' = ?, G' = ?;
  };
  transition t50 := {
    from   := evalrealheapsortbb10in;
    to     := evalrealheapsortbb11in;
    guard  := true;
    action := E' = ?, F' = ?, G' = ?;
  };
  transition t51 := {
    from   := evalrealheapsortbb10in;
    to     := evalrealheapsortbb12in;
    guard  := true;
    action := E' = ?, F' = ?, G' = ?;
  };
  transition t52 := {
    from   := evalrealheapsortbb11in;
    to     := evalrealheapsortbb13in;
    guard  := true;
    action := D' = 2*C + 1, E' = ?, F' = ?, G' = ?;
  };
  transition t53 := {
    from   := evalrealheapsortbb12in;
    to     := evalrealheapsortbb13in;
    guard  := true;
    action := D' = 2*C + 2, E' = ?, F' = ?, G' = ?;
  };
  transition t54 := {
    from   := evalrealheapsortbb13in;
    to     := evalrealheapsortbb14in;
    guard  := true;
    action := E' = ?, F' = ?, G' = ?;
  };
  transition t55 := {
    from   := evalrealheapsortbb13in;
    to     := evalrealheapsortbb16in;
    guard  := true;
    action := C' = A, E' = ?, F' = ?, G' = ?;
  };
  transition t56 := {
    from   := evalrealheapsortbb14in;
    to     := evalrealheapsortbb16in;
    guard  := true;
    action := C' = D, E' = ?, F' = ?, G' = ?;
  };
  transition t57 := {
    from   := evalrealheapsortbb17in;
    to     := evalrealheapsortbb18in;
    guard  := true;
    action := B' = B + 1, E' = ?, F' = ?, G' = ?;
  };
  transition t58 := {
    from   := evalrealheapsortreturnin;
    to     := evalrealheapsortstop;
    guard  := true;
    action := E' = ?, F' = ?, G' = ?;
  };
}
strategy dumb {
  Region init := { state = evalrealheapsortstart };
}
