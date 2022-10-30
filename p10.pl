% ins(E,L,P,Res)
% E: Element
% L, Res: Element*
% P: Integer
% E: elementul de adaugat pe pozitia P 
% L, Res: Lista initiala, respectiv lista rezultata
% Modele de flux: (i, i, i, o), (i,i,i,i)
ins(E,[H|L],P,[H|Res]):- P > 1, !, 
                         P1 is P-1, ins(E,L,P1,Res). 
ins(E, L, 1, [E|L]).

% even(N)
% N: Integer
% Model de flux: (i)
even(N):- mod(N,2) =:= 0.

% add(E, L, P, K, Res)
% E: Element
% L, Res: Element*
% P, K: Integer
% E: Elementul de adaugat pe pozitia P din puterea lui 2 in puterea lui 2
% L, Res: Lista initiala, respectiv lista rezultata
% P: Pozitia curenta
% K: Numar ce este incrementat cu 1 pentru de fiecare data cand se adauga un element pentru a ajunge la pozitia corecta
% Modele de flux: (i, i, i, i, o), (i, i, i, i, i)
add(_, [], _, _, []).
add(E, L, P, K, Res) :- even(P),
                     ins(E, L, P, Res),
                     P1 is (P*2)+K,
                     K1 is K+1,
                     add(E, Res, P1, K1, Res).
add(E, L, P, K, Res) :- not(even(P)), !,
                     P2 is P+1,
                     add(E, L, P2, K, Res).


%insert_list(L, Res)
% L, Res: Lista initiala, respectiv lista rezultata
% Modele de flux: (i,o), (i,i)
insert_list([], []).
insert_list([H1|[H2|T]], Res) :- not(is_list(H1)),
                           is_list(H2),
                           ins_aux1(H1, H2, 2, T),
                           insert_list(T, Res).
insert_list([H1|[H2|T]], Res) :- insert_list(T, Res), !.
                           
%empty list
ins_aux(_, [], _, _, []).
%if the position is even, add the element and then multiply P by 2 
%and add a value K which is incremented at every step to get the next position 
ins_aux(E, L, P, K, Res) :- 0 is mod(P, 2), !, 
                         nth1(P, Res, E, L), 
                         P1 is (P*2)+K,
                         K1 is K+1,
                         ins_aux(E, Res, P1, K1, Res).
%if the position is odd, add the element to the list 
ins_aux(E, L, P, K, Res) :- nth1(P, Res, E, L),
                         P1 is P+1,
                         ins_aux(E, Res, P1, K, Res).
                              
                             
ins_aux1([],_,_,[]).
ins_aux1([E|Es],X,I,[E,X|Rs]) :-
    I /\ (I-1) =:= 0,              % I is a power of two
    !,
    I1 is I + 1,
    ins_aux1(Es,X,I1,Rs).
ins_aux1([E|Es],X,I,[E|Rs]) :-
    I /\ (I-1) =\= 0,              % I is not a power of two
    I1 is I + 1,
    ins_aux1(Es,X,I1,Rs).
