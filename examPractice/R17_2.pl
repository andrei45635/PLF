%subm(L: lista, R: lista)
%L: lista din care aflam submultimile
%R: submultime
%modele de flux: (i, i, o) - nedet
%			     (i, i, i) - det
subm([], []).
subm([_|T], R) :- subm(T, R).
subm([H|T], [H|R]) :- subm(T, R).

%checkLg(L: lista, N: int)
%L: lista pe care o verificam 
%N: lungimea ideala a listei
%model de flux: (i, i) - det
checkLg(L, N) :- length(L, Lg),
    			 Lg =:= N.
checkLg(L, N) :- length(L, Lg),
                 Lg =\= N,
    			 fail.

%progA(L: lista, K: int, N: int)
%L: lista pe care o verificam daca e progresie aritmetica
%K: lungimea listei
%N: contor
%modele de flux: (i, i, o) - nedet
% 				 (i, i, i) - det
progA([H1, H2, H3|T], K, N) :- length([H1, H2, H3|T], Lg),
    						   Lg mod 2 =:= 0, !,
    						   K1 is K div 2,
    						   N < K1,
                               H4 is H1 + H3,
                               H4 div 2 =:= H2,
                               N1 is N+1,
                               progA([H2, H3|T], K, N1).
progA([H1, H2, H3|T], K, N) :- length([H1, H2, H3|T], Lg),
    						   Lg mod 2 =\= 0, !,
    						   K1 is (K div 2) + 1,
    						   N < K1,
                               H4 is H1 + H3,
                               H4 div 2 =:= H2,
                               N1 is N+1,
                               progA([H2, H3|T], K, N1).
progA(L, K, N) :- length(L, Lg), !,
    			  Lg mod 2 =:= 0,
                  N =:= K div 2.
progA(L, K, N) :- length(L, Lg),
    			  Lg mod 2 =\= 0,
                  N =:= (K div 2)+1.

%solveOne(L: lista, K: int, R: lista)
%L: lista din care aflam submultimea
%K: lungimea ideala a submultimii
%R: submultimea rezultata
%modele de flux: (i, i, o) - nedet
% 				 (i, i, i) - det
solveOne(L, K, R) :- subm(L, R),
                     progA(R, K, 0),
                     checkLg(R, K).

%solve(L: lista, K: int, R: lista)
%L: lista din care aflam submultimea
%K: lungimea ideala a submultimii
%R: submultimea rezultata
%modele de flux: (i, i, o) - nedet
% 				 (i, i, i) - det
solve(L, K, R) :- findall(R1, solveOne(L, K, R1), R).
