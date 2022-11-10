% instance
course(programming2).
prereq(programming2, programming1).
taken(job, programming1).
student(job).


% encoding
need_prereq(X, Y) :- prereq(X, Z), not taken(Z,Y).
elligible(X, Y) :- student(Y), not need_prereq(X, Y)

% the prereq to a course is also a course
course(X) :- prereq(Y, X).