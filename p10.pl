% ins(E,L,P,Res)
% E: Element
% L, Res: Element*
% P: Integer
% E: elementul de adaugat pe pozitia P 
% L, Res: Lista initiala, respectiv lista rezultata
% Modele de flux: (i, i, i, o), (i,i,i,i)
ins(E,[H|L],P,[H|Res]):- P > 1, !, 
                                P1 is P-1, ins(E,L,P1,Res). 
ins(E, L, 1, [Val|L]).

% even(N)
% N: Integer
% Model de flux: (i)
even(N):- mod(N,2) =:= 0.

% add(E, L, P, Res)
% E: Element
% L, Res: Element*
% P: Integer
% E: elementul de adaugat pe pozitia P din puterea lui 2 in puterea lui 2
% L, Res: Lista initiala, respectiv lista rezultata
% Modele de flux: (i, i, i, o), (i,i,i,i)
add(_, [], _, []).
add(E, L, P, Res) :- even(P),
                     ins(E, L, P, Res),
                     P1 is P*2,
                     add(E, Res, P1, Res).
add(E, L, P, Res) :- not(even(P)), !,
                     P2 is P+1,
                     add(E, L, P2, Res).


%insert_list(L, Res)
% L, Res: Lista initiala, respectiv lista rezultata
% Modele de flux: (i,o), (i,i)
insert_list([], []).
insert_list([H1|[H2|T]], Res) :- not(is_list(H1)),
                           is_list(H2),
                           add(H1, H2, 2, T),
                           insert_list(T, Res).
insert_list([H1|[H2|T]], Res) :- insert_list(T, Res), !.
                           