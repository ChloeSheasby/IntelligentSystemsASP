% fact for each vertex(N).
vertex(0).
vertex(1).
vertex(2).
vertex(3).

% fact for each edge edge(U, V).
edge(0, 1).
edge(1, 2).
edge(2, 3).
edge(3, 0).

edge(1, 0).
edge(2, 1).
edge(3, 2).
edge(0, 3).

%edge(M, N) :- edge(N, M).

% Every vertex must be reachable.
:- vertex(U), not reachable(U).
%:- not vertex(U), reachable(U).

% Choose exactly one edge from each vertex.
other(U, V) :- vertex(U), vertex(V), edge(U, V), not chosen(U, V).
chosen(U, V) :- vertex(U), vertex(V), edge(U, V), not other(U, V).

reachable(X) :- vertex(Y), vertex(X), edge(Y, X),
    chosen(Y, X), reachable(Y).
reachable(0) :- vertex(P), edge(P, 0), chosen(P, 0).

% You cannot choose two edges to the same vertex
:- chosen(U, V), chosen(W, V), not eq(U, W).
:- chosen(U, V), chosen(V, U), not eq(U, V).
:- chosen(U, V), chosen(U, W), not eq(V, W).

eq(0, 0).
eq(1, 1).
eq(2, 2).
eq(3, 3).