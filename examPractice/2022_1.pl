subm([], []).
subm([_|T], R) :- subm(T, R).
subm([H|T], [H|R]) :- subm(T, R).

suma([], 0).
suma([H|T], S) :- number(H), !,
    			  suma(T, S1),
                  S is S1+H.
suma([_|T], S) :- suma(T, S).

checkLg(L, N) :- length(L, Lg),
    			 Lg < N.
checkLg(L, N) :- length(L, Lg),
                 Lg > N,
    			 fail.

par([]).
par([H|T]) :- H mod 2 =:= 0,   
                 par(T).

solveOne(N, K, S, R) :- generateList(N, L),
                        subm(L, R),
                        checkLg(R, K),
                        par(R),
                        suma(R, Sum),
                        Sum < S.

solve(N, K, S, R) :- findall(R1, solveOne(N, K, S, R1), R).

generateList(2, [2]) :- !.
generateList(N, [N|L]) :- N mod 2 =:= 0, N > 1, !,
                          N1 is N-1,
                          generateList(N1, L).
generateList(N, L) :- N > 1,
                      N1 is N-1,
                      generateList(N1, L).