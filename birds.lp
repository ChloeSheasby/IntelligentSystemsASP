% instance
eagle(eddy).
penguin(tux).

% encoding
fly(X) :- bird(X), not not_fly(X).
not_fly(X) :- not fly(X), bird(X).
not_fly(X) :- penguin(X).
bird(X) :- penguin(X).
bird(X) :- eagle(X).