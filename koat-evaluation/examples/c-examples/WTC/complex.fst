model main {
  var A, B, C, D, E;
  states evalcomplexstart, evalcomplexentryin, evalcomplexbb10in, evalcomplexbb8in, evalcomplexreturnin, evalcomplexbb1in, evalcomplexbb9in, evalcomplexbb7in, evalcomplexbb6in, evalcomplexstop;
  transition t0 := {
    from   := evalcomplexstart;
    to     := evalcomplexentryin;
    guard  := true;
    action := ;
  };
  transition t1 := {
    from   := evalcomplexentryin;
    to     := evalcomplexbb10in;
    guard  := true;
    action := A' = B, B' = A;
  };
  transition t2 := {
    from   := evalcomplexbb10in;
    to     := evalcomplexbb8in;
    guard  := 29 >= B;
    action := C' = A, D' = B;
  };
  transition t3 := {
    from   := evalcomplexbb10in;
    to     := evalcomplexreturnin;
    guard  := B > 29;
    action := ;
  };
  transition t4 := {
    from   := evalcomplexbb8in;
    to     := evalcomplexbb1in;
    guard  := D > C;
    action := ;
  };
  transition t5 := {
    from   := evalcomplexbb8in;
    to     := evalcomplexbb9in;
    guard  := C >= D;
    action := ;
  };
  transition t6 := {
    from   := evalcomplexbb1in;
    to     := evalcomplexbb7in;
    guard  := C > 5 && 2 >= C;
    action := E' = C + 7;
  };
  transition t7 := {
    from   := evalcomplexbb1in;
    to     := evalcomplexbb7in;
    guard  := C > 5;
    action := E' = C + 7;
  };
  transition t8 := {
    from   := evalcomplexbb1in;
    to     := evalcomplexbb6in;
    guard  := C > 5 && C > 2 && 5 >= C;
    action := E' = C + 7;
  };
  transition t9 := {
    from   := evalcomplexbb1in;
    to     := evalcomplexbb7in;
    guard  := 5 >= C && 7 >= C;
    action := E' = C + 2;
  };
  transition t10 := {
    from   := evalcomplexbb1in;
    to     := evalcomplexbb7in;
    guard  := 5 >= C && C > 10;
    action := E' = C + 2;
  };
  transition t11 := {
    from   := evalcomplexbb1in;
    to     := evalcomplexbb6in;
    guard  := 5 >= C && C > 7 && 10 >= C;
    action := E' = C + 2;
  };
  transition t12 := {
    from   := evalcomplexbb7in;
    to     := evalcomplexbb8in;
    guard  := true;
    action := C' = E, D' = D + 1;
  };
  transition t13 := {
    from   := evalcomplexbb6in;
    to     := evalcomplexbb8in;
    guard  := true;
    action := C' = E, D' = D + 10;
  };
  transition t14 := {
    from   := evalcomplexbb9in;
    to     := evalcomplexbb10in;
    guard  := true;
    action := A' = C - 10, B' = D + 2;
  };
  transition t15 := {
    from   := evalcomplexreturnin;
    to     := evalcomplexstop;
    guard  := true;
    action := ;
  };
}
strategy dumb {
  Region init := { state = evalcomplexstart };
}
