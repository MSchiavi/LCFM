(*::Package::*)

(*This Package is a basic lorentz contractions in 4d,


 The following format [is used:

 (p1-p2)[/nu] Will be a p1-p2 quantity with the nu subscript

 the metric tensor used is eta, \eta[\mu,\nu]


 For example the following code should yield

 Contract[\[Eta][\[Mu], \[Nu]]*(p1 - p2)[\[Mu]]]

 (p1-p2)[\nu]*)

 Contract[expr_] := Module[{ans = expr},
   For[i = 0, i <= 4, i++,
       ans = ans //. (A_)[a_] (B_)[a_] :> A.B;
       ans = ans //. \[Eta][a_, b_] (A_)[a_] :>  (A)[b];
       ans = ans //. \[Eta][a_, b_] (A_)[b_] :> (A)[a];
       ans = ans //. \[Eta][a_, b_] \[Eta][a_, c_] :> \[Eta][b, c];
       ans = ans //. \[Eta][b_, a_] \[Eta][a_, c_] :> \[Eta][b, c];
       ans = ans //. \[Eta][a_, b_] \[Eta][a_, c_] :> \[Eta][c, b];
       ans = ans //. \[Eta][b_, a_] \[Eta][a_, c_] :> \[Eta][c, b];
       ans = ans //. \[Gamma][a_] ** p_[s] ** \[Gamma][b_] c_[a_] :> c[s] ** p[s] ** \[Gamma][b];
       ans = ans //. \[Gamma][b_] **   p_[s] ** \[Gamma][a_] c_[a_] :> \[Gamma][b] ** p[s] ** c[s];
       ans = ans //. \[Gamma][a_] ** p_[s] ** A_[s] c_[a_] :> c[s] ** p[s] ** A[s];
       ans = ans //. A_[s] ** p_[s] ** \[Gamma][a_] c_[a_] :> A[s] ** p[s] ** c[s];
       ans = ans //. \[Gamma].p_ :> p[s];
       ];
   Return[ans]]

  Mandelstam[expr_] := Module[{ans = expr},
        ans = ans //. Subscript[p, i_].Subscript[p, j_] :> s[i, j]/2;
        Return[ans]]
