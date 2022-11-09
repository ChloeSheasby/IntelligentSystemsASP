% instance
course(programming2).
prereq(programming2, programming1).
taken(programming1).

% encoding
need_prereq(X) :- prereq(X, Y), not taken(Y).

% the prereq to a course is also a course
course(X) :- prereq(Y, X).