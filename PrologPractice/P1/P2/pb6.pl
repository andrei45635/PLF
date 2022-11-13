inloc([], _, _, []).
inloc(L, _, [], L).
inloc([H|T], E, [K|M], R) :- H =:= E, !,
                             inloc(T, E, M, R1),
                             R=[K|R1].
inloc([H|T], E, B, [H|R]) :- H =\= E,
                         inloc(T, E, B, R).