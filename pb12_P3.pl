% munte(L: List, F: Integer) - determinist
% L: Lista careia ii testam caracterul de munte
% F: Flag ce indica ordinea curenta a elementelor
% F = 0 initial
%     1 crestere
%     2 descrestere
% Model de flux: (i, i)

munte(_, 2).
munte([H1, H2|T], K) :- H1 < H2,
                        K < 2, !,
                        munte([H2|T], 1).
munte([H1, H2|T], K) :- H1 > H2,
                        K > 0, 
                        munte([H2|T], 2).

% subm(L: List, R: List) - nedeterminist
% Modele de flux: (i, i) - determinist, (i, o) - nedeterminist
subm([], []).
subm([H|T], [H|R]) :- subm(T, R).
subm([_|T], R) :- subm(T, R).

% munte1(L: List, R: List)
% Model de flux: (i, o) - determinist
munte1(L, R) :- subm(L, R),
                munte(R, 0).

% submunte(L: List, R: List)
% Model de flux: (i, o) - determinist
submunte(L, R) :- findall(RPartial, munte1(L, RPartial), R).
