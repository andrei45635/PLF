f([], []).
f([H|T], [H|S]) :- H mod 2 =:= 0,
    			   f(T, S).
f([H|T], S) :- f(T, S).
