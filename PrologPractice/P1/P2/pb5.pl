%max of list
maxE([X],X) :- !, true.
maxE([X|Xs], M):- maxE(Xs, M), M >= X.
maxE([X|Xs], X):- maxE(Xs, M), X >  M.

poz_aux([], _, []).
poz_aux([H|T], P, R) :- maxE([H|T], O), 
                    O =:= H, !,
                    P1 is P+1, 
                    poz_aux(T, P1, R1),
                    R=[P|R1].
poz_aux([H|T], P, R) :- maxE([H|T], O),
                    O =\= H,
                    P1 is P+1,
                    poz_aux(T, P1, R).

poz(L, R) :- poz_aux(L, 1, R).