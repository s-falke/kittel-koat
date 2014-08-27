model main {
  var A, B, C, D;
  states evalsipma91start, evalsipma91entryin, evalsipma91returnin, evalsipma91bb3in, evalsipma91bb2in, evalsipma91bb11in, evalsipma91bb5in, evalsipma91bb8in, evalsipma91stop;
  transition t0 := {
    from   := evalsipma91start;
    to     := evalsipma91entryin;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := evalsipma91entryin;
    to     := evalsipma91returnin;
    guard  := A > 100;
    action := ;
  };
  transition t2 := {
    from   := evalsipma91entryin;
    to     := evalsipma91bb3in;
    guard  := 100 >= A;
    action := A' = 1, B' = A;
  };
  transition t3 := {
    from   := evalsipma91bb3in;
    to     := evalsipma91bb2in;
    guard  := 100 >= B;
    action := ;
  };
  transition t4 := {
    from   := evalsipma91bb3in;
    to     := evalsipma91bb11in;
    guard  := B > 100;
    action := ;
  };
  transition t5 := {
    from   := evalsipma91bb2in;
    to     := evalsipma91bb3in;
    guard  := true;
    action := A' = A + 1, B' = B + 11;
  };
  transition t6 := {
    from   := evalsipma91bb11in;
    to     := evalsipma91bb5in;
    guard  := A > 1;
    action := ;
  };
  transition t7 := {
    from   := evalsipma91bb11in;
    to     := evalsipma91returnin;
    guard  := 1 >= A;
    action := ;
  };
  transition t8 := {
    from   := evalsipma91bb5in;
    to     := evalsipma91bb8in;
    guard  := 110 >= B;
    action := C' = B - 10, D' = A - 1;
  };
  transition t9 := {
    from   := evalsipma91bb5in;
    to     := evalsipma91bb8in;
    guard  := 1 >= A;
    action := C' = B - 10, D' = A - 1;
  };
  transition t10 := {
    from   := evalsipma91bb5in;
    to     := evalsipma91bb8in;
    guard  := A > 2;
    action := C' = B - 10, D' = A - 1;
  };
  transition t11 := {
    from   := evalsipma91bb5in;
    to     := evalsipma91bb11in;
    guard  := B > 110 && A = 2;
    action := A' = A - 1, B' = B - 10;
  };
  transition t12 := {
    from   := evalsipma91bb8in;
    to     := evalsipma91bb11in;
    guard  := C > 100;
    action := A' = D, B' = C + 1;
  };
  transition t13 := {
    from   := evalsipma91bb8in;
    to     := evalsipma91bb11in;
    guard  := C > 100 && 100 >= C;
    action := A' = D, B' = C + 11;
  };
  transition t14 := {
    from   := evalsipma91bb8in;
    to     := evalsipma91bb11in;
    guard  := 100 >= C && C > 100;
    action := A' = D + 1, B' = C + 1;
  };
  transition t15 := {
    from   := evalsipma91bb8in;
    to     := evalsipma91bb11in;
    guard  := 100 >= C;
    action := A' = D + 1, B' = C + 11;
  };
  transition t16 := {
    from   := evalsipma91returnin;
    to     := evalsipma91stop;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = evalsipma91start };
}
