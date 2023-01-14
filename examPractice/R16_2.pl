%comb(L: lista, K: int, R: lista)
%L:lista din care aflam combinarile
%K:lungimea combinarilor
%R:combinarea rezultata
%modele de flux: (i, i, o) - nedet
%				 (i, i, i) - det
comb([H|_], 1, [H]).
comb([_|T], K, C) :- comb(T, K, C).
comb([H|T], K, [H|C]) :- K > 1, K1 is K-1, comb(T, K1, C).

%inser(L: lista, E: int, R: lista)
%L: lista in care inseram
%E: elementul pe care il introducem
%R: lista rezultata
%modele de flux: (i, i, o) - nedet
%			     (i, i, i) - det
inser(L, E, [E|L]).
inser([H|T], E, [H|R]) :- inser(T, E, R).

%perm(L: lista, R: lista)
%L: lista din care aflam permutarile
%R: lista rezultata
%modele de flux: (i, i, o) - nedet
%			     (i, i, i) - det
perm([], []).
perm([H|T], R) :- perm(T, P),
    			  inser(P, H, R).

%suma(L: lista, S: int)
%L: lista pe care o insumam
%S: suma rezultata
%modele de flux: (i, o) - det
%				 (i, i) - nedet
suma([], 0).
suma([H|T], S) :- number(H), !,
    			  suma(T, S1),
                  S is S1+H.
suma([_|T], S) :- suma(T, S).

%aranj(L: lista, K: int, S: int, R: int)
%L: lista din care aflam aranjamentele
%K: lungimea unui aranjament
%S: suma data
%R: aranjamentul
%modele de flux: (i, i, o) - nedet
%			     (i, i, i) - det
aranj(L, K, S, R) :- comb(L, K, C),
    				 perm(C, R),
                     suma(R, S1),
                     S1 =:= S.

%solve(L: lista, K: int, S: int, R: int)
%L: lista din care aflam aranjamentele
%K: lungimea unui aranjament
%S: suma data
%R: lista aranjamentelor
%modele de flux: (i, i, o) - nedet
%			     (i, i, i) - det
solve(L, K, S, R) :- findall(R1, aranj(L, K, S, R1), R).