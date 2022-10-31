% ins(L, E, P, Res) - determinist
% E: Element
% L, Res: Element*
% P: Integer
% E: elementul ce trebuie adaugat pe pozitiile care sunt puteri ale lui 2
% P: pozitia initiala
% L, Res: lista initiala, respectiv lista rezultata dupa adaugare
% Modele de flux: (i, i, i, o), (i, i , i, i)                   
ins([],_,_,[]).
ins([E|Es],X,I,[E,X|Rs]) :-
    I /\ (I-1) =:= 0,              % I is a power of two
    !,
    I1 is I + 1,
    ins(Es,X,I1,Rs).
ins([E|Es],X,I,[E|Rs]) :-
    I /\ (I-1) =\= 0,              % I is not a power of two
    I1 is I + 1,
    ins_aux1(Es,X,I1,Rs).

%insert_list(L, Res) - determinist
% L, Res: Lista initiala, respectiv lista rezultata
% Modele de flux: (i,o), (i,i)
insert_list([], []).
insert_list([H1|[H2|T]], [H1|[R2|Res]]) :- not(is_list(H1)),
                                         is_list(H2),
                                         !,
                                         ins(H2, H1, 2, R2),
                                         insert_list(T, Res).
insert_list([H1|[H2|T]], [H1|[H2|Res]]) :- number(H1),
                                         number(H2),
                                         insert_list(T, Res).
