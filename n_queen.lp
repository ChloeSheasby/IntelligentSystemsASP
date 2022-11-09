row(1). row(2). row(3). row(4).
col(1). col(2). col(3). col(4).

not_q(X, Y) :- not q(X, Y), row(X), col(Y).
q(X, Y) :- row(X), col(Y), not not_q(X, Y).

not_q(Z, Y) :- q(X, Y), row(X), col(Y), row(Z), X != Z.

not_q(X, Z) :- q(X, Y), row(X), col(Y), col(Z), Y != Z.

% No two queens on a diagonal
:- row(X1), row(X2), col(Y1), col(Y2), X1 < X2, Y1 < Y2, q(X1, Y1), q(X2, Y2), X2 - X1 == Y2 - Y1.
:- row(X1), row(X2), col(Y1), col(Y2), X1 < X2, Y1 > Y2, q(X1, Y1), q(X2, Y2), X2 - X1 == Y1 - Y2.

% every row has a queen
has_q(X) :- q(X, Y), row(X), col(Y).
:- row(X), not has_q(X).
