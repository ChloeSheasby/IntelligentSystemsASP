node(1..4).
connected(1, 2).
connected(2, 3).
connected(3, 4).
connected(4, 1).

connected(N,M) :- connected(M,N).
red(N)   :- node(N), not green(N), not blue(N).
green(N) :- node(N), not red(N), not blue(N).
blue(N)  :- node(N), not red(N), not green(N).
:- connected(N1,N2), blue(N1), blue(N2).
:- connected(N1,N2), red(N1), red(N2).
:- connected(N1,N2), green(N1), green(N2).
