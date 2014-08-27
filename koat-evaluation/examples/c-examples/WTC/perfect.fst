model main {
  var A, B, C, D;
  states evalperfectstart, evalperfectentryin, evalperfectreturnin, evalperfectbb1in, evalperfectbb8in, evalperfectbb4in, evalperfectbb9in, evalperfectbb3in, evalperfectbb5in, evalperfectstop;
  transition t0 := {
    from   := evalperfectstart;
    to     := evalperfectentryin;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := evalperfectentryin;
    to     := evalperfectreturnin;
    guard  := 1 >= A;
    action := ;
  };
  transition t2 := {
    from   := evalperfectentryin;
    to     := evalperfectbb1in;
    guard  := A > 1;
    action := ;
  };
  transition t3 := {
    from   := evalperfectbb1in;
    to     := evalperfectbb8in;
    guard  := true;
    action := B' = A, C' = A - 1;
  };
  transition t4 := {
    from   := evalperfectbb8in;
    to     := evalperfectbb4in;
    guard  := C > 0;
    action := D' = A;
  };
  transition t5 := {
    from   := evalperfectbb8in;
    to     := evalperfectbb9in;
    guard  := 0 >= C;
    action := A' = B;
  };
  transition t6 := {
    from   := evalperfectbb4in;
    to     := evalperfectbb3in;
    guard  := D >= C;
    action := ;
  };
  transition t7 := {
    from   := evalperfectbb4in;
    to     := evalperfectbb5in;
    guard  := C > D;
    action := ;
  };
  transition t8 := {
    from   := evalperfectbb3in;
    to     := evalperfectbb4in;
    guard  := true;
    action := D' = D - C;
  };
  transition t9 := {
    from   := evalperfectbb5in;
    to     := evalperfectbb8in;
    guard  := D = 0;
    action := B' = B - C, C' = C - 1;
  };
  transition t10 := {
    from   := evalperfectbb5in;
    to     := evalperfectbb8in;
    guard  := 0 > D;
    action := C' = C - 1;
  };
  transition t11 := {
    from   := evalperfectbb5in;
    to     := evalperfectbb8in;
    guard  := D > 0;
    action := C' = C - 1;
  };
  transition t12 := {
    from   := evalperfectbb9in;
    to     := evalperfectreturnin;
    guard  := 0 > A;
    action := ;
  };
  transition t13 := {
    from   := evalperfectbb9in;
    to     := evalperfectreturnin;
    guard  := A > 0;
    action := ;
  };
  transition t14 := {
    from   := evalperfectbb9in;
    to     := evalperfectreturnin;
    guard  := A = 0;
    action := ;
  };
  transition t15 := {
    from   := evalperfectreturnin;
    to     := evalperfectstop;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = evalperfectstart };
}
