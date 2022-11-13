inv_list_aux([], C, C).
inv_list_aux([H|T], C, R) :- inv_list_aux(T, [H|C], R).

inv(L, R) :- inv_list_aux(L, [], R).

product_aux([], _, _, [0]).
product_aux([], _, C, [C]) :- C =\= 0, !.
product_aux([H|T], N, C, R) :- P is H*N,
                               P < 10, !,
                               H1 is mod(P+C,10),
                               product_aux(T, N, C, R1),
                               R=[H1|R1].
product_aux([H|T], N, C, R) :- P is H*N,
                               P >= 10,
                               H1 is mod(P+C, 10),
                               C1 is div(P+C-H1,10),
                               product_aux(T, N, C1, R1),
                               R=[H1|R1].

product(L, N, Res) :- inv(L, LR),
                      product_aux(LR, N, 0, R),
                      inv(R, Res).