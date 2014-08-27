model main {
  var A, B, C, D, E, F, G, H, I, J;
  states evalbinsearchStepSize2start, evalbinsearchStepSize2entryin, evalbinsearchStepSize2bbin, evalbinsearchStepSize2returnin, evalbinsearchStepSize2bb1in, evalbinsearchStepSize2bb2in, evalbinsearchStepSize2bb3in, evalbinsearchStepSize2bb4in, evalbinsearchStepSize2bb9in, evalbinsearchStepSize2bb6in, evalbinsearchStepSize2bb7in, evalbinsearchStepSize2bb10in, evalbinsearchStepSize2bb12in, evalbinsearchStepSize2bb13in, evalbinsearchStepSize2stop;
  transition t0 := {
    from   := evalbinsearchStepSize2start;
    to     := evalbinsearchStepSize2entryin;
    guard  := true;
    action := J' = ?;
  };
  transition t1 := {
    from   := evalbinsearchStepSize2entryin;
    to     := evalbinsearchStepSize2bbin;
    guard  := true;
    action := A' = 0, B' = 0, C' = 4, D' = A, J' = ?;
  };
  transition t2 := {
    from   := evalbinsearchStepSize2bbin;
    to     := evalbinsearchStepSize2returnin;
    guard  := C = 1;
    action := J' = ?;
  };
  transition t3 := {
    from   := evalbinsearchStepSize2bbin;
    to     := evalbinsearchStepSize2bb1in;
    guard  := 0 >= C;
    action := E' = J, J' = ?;
  };
  transition t4 := {
    from   := evalbinsearchStepSize2bbin;
    to     := evalbinsearchStepSize2bb1in;
    guard  := C > 1;
    action := E' = J, J' = ?;
  };
  transition t5 := {
    from   := evalbinsearchStepSize2bb1in;
    to     := evalbinsearchStepSize2bb2in;
    guard  := 0 > B;
    action := J' = ?;
  };
  transition t6 := {
    from   := evalbinsearchStepSize2bb1in;
    to     := evalbinsearchStepSize2bb2in;
    guard  := B > 0;
    action := J' = ?;
  };
  transition t7 := {
    from   := evalbinsearchStepSize2bb1in;
    to     := evalbinsearchStepSize2bb3in;
    guard  := B = 0;
    action := F' = C, J' = ?;
  };
  transition t8 := {
    from   := evalbinsearchStepSize2bb2in;
    to     := evalbinsearchStepSize2bb3in;
    guard  := C = 0;
    action := F' = 0, J' = ?;
  };
  transition t9 := {
    from   := evalbinsearchStepSize2bb2in;
    to     := evalbinsearchStepSize2bb3in;
    guard  := C > 0 && J >= 0 && C >= 2*J && 1 + 2*J >= C;
    action := F' = J, J' = ?;
  };
  transition t10 := {
    from   := evalbinsearchStepSize2bb2in;
    to     := evalbinsearchStepSize2bb3in;
    guard  := 0 > C && 0 >= J && 2*J >= C && 1 + C >= 2*J;
    action := F' = J, J' = ?;
  };
  transition t11 := {
    from   := evalbinsearchStepSize2bb3in;
    to     := evalbinsearchStepSize2bb4in;
    guard  := E > G;
    action := J' = ?;
  };
  transition t12 := {
    from   := evalbinsearchStepSize2bb3in;
    to     := evalbinsearchStepSize2bb9in;
    guard  := G >= E;
    action := J' = ?;
  };
  transition t13 := {
    from   := evalbinsearchStepSize2bb4in;
    to     := evalbinsearchStepSize2bb6in;
    guard  := A = 1 && B = 0;
    action := J' = ?;
  };
  transition t14 := {
    from   := evalbinsearchStepSize2bb4in;
    to     := evalbinsearchStepSize2bb7in;
    guard  := 0 >= A;
    action := H' = B, I' = F, J' = ?;
  };
  transition t15 := {
    from   := evalbinsearchStepSize2bb4in;
    to     := evalbinsearchStepSize2bb7in;
    guard  := A > 1;
    action := H' = B, I' = F, J' = ?;
  };
  transition t16 := {
    from   := evalbinsearchStepSize2bb4in;
    to     := evalbinsearchStepSize2bb7in;
    guard  := 0 > B;
    action := H' = B, I' = F, J' = ?;
  };
  transition t17 := {
    from   := evalbinsearchStepSize2bb4in;
    to     := evalbinsearchStepSize2bb7in;
    guard  := B > 0;
    action := H' = B, I' = F, J' = ?;
  };
  transition t18 := {
    from   := evalbinsearchStepSize2bb6in;
    to     := evalbinsearchStepSize2bb7in;
    guard  := F = 0;
    action := H' = 1, I' = 0, J' = ?;
  };
  transition t19 := {
    from   := evalbinsearchStepSize2bb6in;
    to     := evalbinsearchStepSize2bb7in;
    guard  := F > 0 && J >= 0 && F >= 2*J && 1 + 2*J >= F;
    action := H' = 1, I' = J, J' = ?;
  };
  transition t20 := {
    from   := evalbinsearchStepSize2bb6in;
    to     := evalbinsearchStepSize2bb7in;
    guard  := 0 > F && 0 >= J && 2*J >= F && 1 + F >= 2*J;
    action := H' = 1, I' = J, J' = ?;
  };
  transition t21 := {
    from   := evalbinsearchStepSize2bb7in;
    to     := evalbinsearchStepSize2returnin;
    guard  := D + I > 255;
    action := J' = ?;
  };
  transition t22 := {
    from   := evalbinsearchStepSize2bb7in;
    to     := evalbinsearchStepSize2bbin;
    guard  := 255 >= D + I;
    action := A' = 2, B' = H, C' = I, D' = D + I, J' = ?;
  };
  transition t23 := {
    from   := evalbinsearchStepSize2bb9in;
    to     := evalbinsearchStepSize2bb10in;
    guard  := G > E;
    action := J' = ?;
  };
  transition t24 := {
    from   := evalbinsearchStepSize2bb9in;
    to     := evalbinsearchStepSize2returnin;
    guard  := E >= G;
    action := J' = ?;
  };
  transition t25 := {
    from   := evalbinsearchStepSize2bb10in;
    to     := evalbinsearchStepSize2bb12in;
    guard  := A = 2 && B = 0;
    action := J' = ?;
  };
  transition t26 := {
    from   := evalbinsearchStepSize2bb10in;
    to     := evalbinsearchStepSize2bb13in;
    guard  := 1 >= A;
    action := H' = B, I' = F, J' = ?;
  };
  transition t27 := {
    from   := evalbinsearchStepSize2bb10in;
    to     := evalbinsearchStepSize2bb13in;
    guard  := A > 2;
    action := H' = B, I' = F, J' = ?;
  };
  transition t28 := {
    from   := evalbinsearchStepSize2bb10in;
    to     := evalbinsearchStepSize2bb13in;
    guard  := 0 > B;
    action := H' = B, I' = F, J' = ?;
  };
  transition t29 := {
    from   := evalbinsearchStepSize2bb10in;
    to     := evalbinsearchStepSize2bb13in;
    guard  := B > 0;
    action := H' = B, I' = F, J' = ?;
  };
  transition t30 := {
    from   := evalbinsearchStepSize2bb12in;
    to     := evalbinsearchStepSize2bb13in;
    guard  := F = 0;
    action := H' = 1, I' = 0, J' = ?;
  };
  transition t31 := {
    from   := evalbinsearchStepSize2bb12in;
    to     := evalbinsearchStepSize2bb13in;
    guard  := F > 0 && J >= 0 && F >= 2*J && 1 + 2*J >= F;
    action := H' = 1, I' = J, J' = ?;
  };
  transition t32 := {
    from   := evalbinsearchStepSize2bb12in;
    to     := evalbinsearchStepSize2bb13in;
    guard  := 0 > F && 0 >= J && 2*J >= F && 1 + F >= 2*J;
    action := H' = 1, I' = J, J' = ?;
  };
  transition t33 := {
    from   := evalbinsearchStepSize2bb13in;
    to     := evalbinsearchStepSize2returnin;
    guard  := I > D;
    action := J' = ?;
  };
  transition t34 := {
    from   := evalbinsearchStepSize2bb13in;
    to     := evalbinsearchStepSize2bbin;
    guard  := D >= I;
    action := A' = 1, B' = H, C' = I, D' = D - I, J' = ?;
  };
  transition t35 := {
    from   := evalbinsearchStepSize2returnin;
    to     := evalbinsearchStepSize2stop;
    guard  := true;
    action := J' = ?;
  };
}
strategy dumb {
  Region init := { state = evalbinsearchStepSize2start };
}
