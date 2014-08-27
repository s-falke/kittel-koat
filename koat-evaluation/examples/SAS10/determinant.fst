model main {
  var A, B, C, D, E, F, G, H;
  states start, a, d, b, halt, c, start0;
  transition t0 := {
    from   := start;
    to     := a;
    guard  := A > 0 && B = A && C = D && E = F && G = H;
    action := ;
  };
  transition t1 := {
    from   := a;
    to     := d;
    guard  := A > 0 && G = H && E = F && C = D && B = A;
    action := C' = 1;
  };
  transition t2 := {
    from   := d;
    to     := b;
    guard  := A > C && A >= C && A > 0 && C > 0 && B = A;
    action := G' = 1 + C;
  };
  transition t3 := {
    from   := d;
    to     := halt;
    guard  := A > 0 && C = A && B = A;
    action := ;
  };
  transition t4 := {
    from   := b;
    to     := d;
    guard  := A > C && C > 0 && A >= C && G = A + 1 && B = A;
    action := C' = 1 + C;
  };
  transition t5 := {
    from   := b;
    to     := c;
    guard  := A >= G && A + 1 >= G && A > C && C > 0 && G > C && B = A;
    action := E' = B;
  };
  transition t6 := {
    from   := c;
    to     := c;
    guard  := E > C && A >= E && A >= G && C > 0 && E >= C && G > C && B = A;
    action := E' = E - 1;
  };
  transition t7 := {
    from   := c;
    to     := b;
    guard  := A >= E && A >= G && E > 0 && G > E && C = E && B = A;
    action := G' = 1 + G;
  };
  transition t8 := {
    from   := start0;
    to     := start;
    guard  := true;
    action := G' = H, E' = F, C' = D, B' = A;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
