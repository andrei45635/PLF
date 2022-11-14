% secv_max(L: List, R: List) - determinist
% L: Lista initiala
% R: Lista rezultata
% Modele de flux: (i, o), (i, i)
secv_max([], []).
secv_max([E], [E]).
secv_max([E1, E2], []) :- E2 =:= E1+1, !.
secv_max([E1,E2], [E1,E2]) :- E2 =\= E1+1.
secv_max([H1,H2,H3|T], R) :- H2 =:= H1+1, 
                             H3 =:= H2+1, !,
                             secv_max([H2,H3|T], R).
secv_max([H1,H2,H3|T], R) :- H2 =:= H1+1,
                             H3 =\= H2+1, 
                             secv_max([H3|T], R).
secv_max([H1,H2, H3|T], [H1|R]) :- H2 =\= H1+1, 
                              secv_max([H2,H3|T], R).