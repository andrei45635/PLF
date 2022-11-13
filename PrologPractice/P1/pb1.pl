% contine(L: List, E: Element) - determinist
% L: Element*, lista in care cautam daca elementul E exista
% E: Element, elementul E pe care il cautam in lista L
% Modele de flux: (i, i)
contine([], _) :- fail.
contine([H|_], E) :- H =:= E, !.
contine([H|T], E) :- H =\= E, 
                     contine(T, E).

% difmult(L: List, B: List, R: List) - determinist
% L, B, R: L si B sunt liste originale, R este lista rezultata
% Modele de flux: (i, i, o), (i, i, i) 
difmult([], B, R) :- R=B, !.
difmult(L, [], R) :- R=L.
difmult([H|T], [K|M], R) :- contine([H|T], K), !,
                            difmult(T, M, R).
difmult(L, [K|M], [K|R]) :- not(contine(L, K)),
                            difmult(L, M, R).
difmult([H|T], B, [H|R]) :- not(contine(B, H)),
                            difmult(T, B, R).

% add1(L: List, R: List) - determinist
% L: Lista originala
% R: Lista rezultata in urma adaugarii lui 1
% Modele de flux: (i, o), (i, i)
add1([], []).
add1([H|T], [H|[1|R]]) :- 0 is mod(H, 2), !, 
                          add1(T, R).
add1([H|T], [H|R]) :- not(0 is mod(H, 2)),  
                      add1(T, R).