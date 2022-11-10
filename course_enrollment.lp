% instance
course(programming2).
prereq(programming2, programming1).
taken(job, programming1).
student(job).


% encoding
need_prereq(X, Y) :- student(Y), prereq(X, Z), not taken(Y,Z).
elligible(X, Y) :- couse(X), student(Y), not need_prereq(X, Y).

% the prereq to a course is also a course
course(X) :- prereq(Y, X).