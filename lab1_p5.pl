%stergere(L,E,Rez)
%E: Element
%L: Element*
%Rez: Element*
%Modele de flux: (i, i, o), (i, i, i)
%L: lista din care se sterge elementul E
%E: elementul E care se sterge din lista L
%Rez: lista rezultata in urma stergerii elementului E din lista L
stergere([], _, []).
stergere([H|T], E, [H|Rez]) :- H \= E,
	                   stergere(T, E, Rez).
stergere([H|T], E, Rez) :- H = E,
			   stergere(T, E, Rez).

%stergere_aux(L, E, N)
%E: Element
%L: Element*
%N: Intreg
%Modele de flux: (i, i, o), (i, i, i)
%L: lista din care se sterge elementul E
%E: elementul E care se sterge din lista L
%N: numarul de aparitii al lui E din lista L
stergere_aux([], _, 0).
stergere_aux([H|T], E, N) :- H = E,
			     stergere_aux(T, E, N1),
			     N is N1+1.
stergere_aux([H|T], E, N) :- H \= E,
			     stergere_aux(T, E, N).

%adauga_lista(L, E, Rez)
adauga_lista([], E, [E]).
adauga_lista([H|T], E, [H|Rez]) :- adauga_lista(T, E, Rez).
adauga_lista([H|T], E, Rez) :- adauga_lista(T, E, L),
			       Rez=[H|L].


%pereche(N, L, L)
pereche([B|T], [B,N]) :- stergere_aux(T, B, N1),
			 N is N1+1.
			 %stergere(T, B, T).
			 %T=C,
			 %pereche(T, P).

%numar(L, X, Rez)
%L: Lista
%X: Lista rezultata
%Rez: lista rez
%Modele de flux: (i, o), (i, i)
numar([], []).
numar([H|T],[X|[[H,N]]]) :- stergere_aux([H|T], H, N),
			      stergere([H|T], H, C),
			      numar(C, X).

