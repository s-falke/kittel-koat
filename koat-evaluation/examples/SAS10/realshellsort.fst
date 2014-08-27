model main {
  var A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q;
  states start, lbl21, lbl121, lbl123, stop, lbl71, lbl101, lbl53, start0;
  transition t0 := {
    from   := start;
    to     := lbl21;
    guard  := A = B && C = D && E = F && G = H && I = J && K = L && M = N && O = P;
    action := O' = Q, Q' = ?;
  };
  transition t1 := {
    from   := lbl121;
    to     := lbl123;
    guard  := G >= 2*A && 2*A + 1 >= G && 2*O + 1 >= L && O >= G && E >= 0 && G > 0 && L > E && K = L && I = L && M + 1 = L;
    action := G' = A, Q' = ?;
  };
  transition t2 := {
    from   := lbl123;
    to     := stop;
    guard  := E >= 0 && 2*O + 1 >= L && O > 0 && L > E && O >= 0 && G = 0 && K = L && I = L && M + 1 = L && A = 0;
    action := Q' = ?;
  };
  transition t3 := {
    from   := lbl123;
    to     := lbl121;
    guard  := A > 0 && 0 >= L && A >= 0 && E >= 0 && 2*O + 1 >= L && O > 0 && L > E && O >= 2*A && K = L && I = L && M + 1 = L && G = A;
    action := I' = 0, A' = Q, Q' = ?;
  };
  transition t4 := {
    from   := lbl123;
    to     := lbl71;
    guard  := L > 0 && A > 0 && A >= 0 && E >= 0 && 2*O + 1 >= L && O > 0 && L > E && O >= 2*A && K = L && I = L && M + 1 = L && G = A;
    action := I' = 0, E' = 0, C' = Q, Q' = ?;
  };
  transition t5 := {
    from   := lbl101;
    to     := lbl101;
    guard  := E >= G && I >= G + E && O >= G && L > I && G > 0 && 2*O + 1 >= L && E >= 0 && K = L;
    action := E' = E - G, Q' = ?;
  };
  transition t6 := {
    from   := lbl101;
    to     := lbl53;
    guard  := I >= G + E && O >= G && L > I && G > 0 && 2*O + 1 >= L && E >= 0 && K = L;
    action := I' = 1 + I, M' = I, Q' = ?;
  };
  transition t7 := {
    from   := lbl71;
    to     := lbl101;
    guard  := E >= G && 2*O + 1 >= L && O >= G && G > 0 && E >= 0 && L > E && I = E && K = L;
    action := E' = E - G, Q' = ?;
  };
  transition t8 := {
    from   := lbl71;
    to     := lbl53;
    guard  := 2*O + 1 >= L && O >= G && G > 0 && E >= 0 && L > E && I = E && K = L;
    action := I' = 1 + I, M' = I, Q' = ?;
  };
  transition t9 := {
    from   := lbl53;
    to     := lbl121;
    guard  := L > E && G > 0 && E >= 0 && O >= G && 2*O + 1 >= L && I = L && K = L && M + 1 = L;
    action := A' = Q, Q' = ?;
  };
  transition t10 := {
    from   := lbl53;
    to     := lbl71;
    guard  := L > M + 1 && L > M && M >= E && G > 0 && E >= 0 && O >= G && 2*O + 1 >= L && I = M + 1 && K = L;
    action := E' = I, C' = Q, Q' = ?;
  };
  transition t11 := {
    from   := lbl21;
    to     := stop;
    guard  := L >= 2*O && 0 >= O && 2*O + 1 >= L && M = N && A = B && C = D && E = F && G = H && I = J && K = L;
    action := G' = O, Q' = ?;
  };
  transition t12 := {
    from   := lbl21;
    to     := lbl71;
    guard  := L >= 2*O && O > 0 && 2*O + 1 >= L && M = N && A = B && C = D && E = F && G = H && I = J && K = L;
    action := I' = 0, G' = O, E' = 0, C' = Q, Q' = ?;
  };
  transition t13 := {
    from   := start0;
    to     := start;
    guard  := true;
    action := K' = L, I' = J, G' = H, E' = F, C' = D, A' = B, M' = N, O' = P, Q' = ?;
  };
}
strategy dumb {
  Region init := { state = start0 };
}
