% count(L: List, E: Element, N: Integer) - determinist
% L: Element*, lista originala
% E: Elementul pe care il cautam 
% Modele de flux: (i, i, o), (i, i, i)
count([], _, 0).
count([H|T], E, N) :- H =:= E, !, 
                      count(T, E, N1),
                      N is N1+1.
count([H|T], E, N) :- H =\= E,
                      count(T, E, N).

% stergere(L: List, E: Element, R: List) - determinist
% L, R: Element*, lista originala, respectiv lista rezultata
% Modele de flux: (i, i, o), (i, i, i)
stergere([], _, []).
stergere([H|T], E, R) :- H =:= E, !, 
                         stergere(T, E, R).
stergere([H|T], E, [H|R]) :- H =\= E,
                             stergere(T, E, R).

% del_rep(L: List, R: List) - determinist
% L, R: Lista originala, respectiv lista rezultata
% Modele de flux: (i, o), (i, i)
del_rep([], []).
del_rep([H|T], R) :- count([H|T], H, N),
                     N > 1, !,
                     stergere([H|T], H, C),
                     del_rep(C, R).
del_rep([H|T], [H|R]) :- count([H|T], H, N),
                         N =:= 1, 
                         del_rep(T, R).

% max(L: List, O: Integer) - determinist
% L: Lista in care cautam maximul
% O: Maximul listei
% Modele de flux: (i, o), (i, i)
maxE([], 0).
maxE([H1, H2|_], O) :- H1 > H2, !,
                       O is H1.
maxE([_|T], O) :- maxE(T, O).

% del_max(L: List, R: List) - determinist
% L, R: Lista originala, respectiv lista rezultata
% Modele de flux: (i, o), (i, i)
del_max([], []).
del_max([H|T], R) :- maxE([H|T], O), 
                     O =:= H, !,  
                     stergere([H|T], H, C),
                     del_max(C, R).
del_max([H|T], [H|R]) :- maxE([H|T], O),
                     O =\= H,
                     del_max(T, R).