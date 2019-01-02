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

(*Contractions for path integral functional derivative*)
   ContractFunc[expr_] := Module[{ans = expr},
     For[i = 0, i <= 4, i++,
         ans = ans //. (A_)[a_] (B_)[a_] :> A.B;
         ans = ans //. \[Eta][a_, b_] (A_)[S_,a_,c_] :>  (A)[S,b,c];
         ans = ans //. \[Eta][a_, b_] (A_)[S_,b_,c_] :> (A)[S,a,c];
         ans = ans //. \[Eta][a_, b_] (A_)[S_,c_,a_] :>  (A)[S,c,b];
         ans = ans //. \[Eta][a_, b_] (A_)[S_,c_,b_] :> (A)[S,c,a];
         ans = ans //. \[Eta][a_, b_] \[Eta][a_, c_] :> \[Eta][b, c];
         ans = ans //. \[Eta][b_, a_] \[Eta][a_, c_] :> \[Eta][b, c];
         ans = ans //. \[Eta][a_, b_] \[Eta][a_, c_] :> \[Eta][c, b];
         ans = ans //. \[Eta][b_, a_] \[Eta][a_, c_] :> \[Eta][c, b];
         ans = ans //. \[Gamma][a_] ** p_[s] ** \[Gamma][b_] c_[a_] :> c[s] ** p[s] ** \[Gamma][b];
         ans = ans //. \[Gamma][b_] **   p_[s] ** \[Gamma][a_] c_[a_] :> \[Gamma][b] ** p[s] ** c[s];
         ans = ans //. \[Gamma][a_] ** p_[s] ** A_[s] c_[a_] :> c[s] ** p[s] ** A[s];
         ans = ans //. A_[s] ** p_[s] ** \[Gamma][a_] c_[a_] :> A[s] ** p[s] ** c[s];
         ans = ans //. \[Gamma].p_ :> p[s];
         ans = ans//. B__*A_[S_,a_,b_]+B__*A_[S_,b_,a_]:> 2*B*A[S,a,b];
         ans = ans //. \[Delta][a_, b_] \[Delta][a_, c_] :> \[Delta][b, c];
         ans = ans //. \[Delta][b_, a_] \[Delta][a_, c_] :> \[Delta][b, c];
         ans = ans //. \[Delta][a_, b_] \[Delta][a_, c_] :> \[Delta][c, b];
         ans = ans //. \[Delta][b_, a_] \[Delta][a_, c_] :> \[Delta][c, b];
         ans = ans //. f[a_,b_,c_] \[Delta][a_,d_]:> f[d,b,c];
         ans = ans //. f[a_,b_,c_] \[Delta][b_,d_]:> f[a,d,c];
         ans = ans //. f[a_,b_,c_] \[Delta][c_,d_]:> f[a,b,d];
         ans = ans //.d[a_]\[Eta][a_,b_]:> d[b];
         ];
     Return[ans]]

  Mandelstam[expr_] := Module[{ans = expr},
        ans = ans //. Subscript[p, i_].Subscript[p, j_] :> s[i, j]/2;
        Return[ans]]
