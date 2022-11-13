% instance
course(datastructs).
prereq(programming2, programming1).
taken(job, programming1).
student(job).

prereq(datastructs, programming2).
taken(chloe, programming2).
taken(chloe, programming1).
student(chloe).

course(linearalgebra).
course(computergraphics).
prereq(linearalgebra, computergraphics).
student(adam).

course(calc1).
course(calc2).
prereq(calc1, calc2).
taken(jack, calc1).
student(jack).

% encoding
need_prereq(X, Y) :- student(Y), prereq(X, Z), not taken(Y,Z).
elligible(X, Y) :- course(X), student(Y), not need_prereq(X, Y).

% the prereq to a course is also a course
course(X) :- prereq(Y, X).