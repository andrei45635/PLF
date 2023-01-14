%putere(N: int, P: int, R: int)
%model de flux: (i, i, o) - det, (i, i, i) - det
putere(_, 0, 1) :- !.
putere(N, 1, N) :- !.
putere(N, P, R) :- P>0,
                   P1 is P-1,
                   putere(N, P1, R1),
                   R is R1*N.

inser(L, E, [E|L]).
inser([H|T], E, [H|R]) :- inser(T, E, R).

perm([], []).
perm(L, [H|T]) :- inser(Z, H, L),
                  perm(Z, T).

check([_]).
check([H, H1|T]) :- Hs is H-H1,
                    Hs <= 3,
                    check([H1|T]).

perms(L, Perm) :- perm(L, Perm),
                  check(Perm).

solve(L, P) :- findall(R, perms(L, R), P).